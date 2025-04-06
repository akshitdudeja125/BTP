#define MAX_TERM 3// 1 to 3
#define MAX_LOG 2// 0 to 1
#define NUM_SERVERS 3// Number of servers in the system
#define MSG_CAPACITY 10// Capacity of message channels

#define NIL 10// a number that won't be used

// Message types
mtype:MessageType = { APPEND_ENTRY,APPEND_ENTRY_RESPONSE,REQUEST_VOTE,REQUEST_VOTE_RESPONSE };

// Message structures
typedef AppendEntry {
	byte term,leaderCommit,index,prevLogTerm;
};

typedef AppendEntryResponse {
	byte term;
	bool success;
};

typedef RequestVote {
	byte term,lastLogIndex,lastLogTerm;
};

typedef RequestVoteResponse {
	byte term;
	bool voteGranted;
};

// Common message structure
typedef Message {
	mtype messageType;
	byte sender;
	byte receiver;
	AppendEntry appendEntry;
	AppendEntryResponse appendEntryResponse;
	RequestVote requestVote;
	RequestVoteResponse requestVoteResponse;
};

// Common channel for all servers
chan toNodes[NUM_SERVERS] = [MSG_CAPACITY] of { Message };

// The following variables are actually local,
// we move them globally, because SPIN doesn't support
// that represent LTL with local variables.
mtype:State = { leader,candidate,follower,crashed };
mtype:State state[NUM_SERVERS];
byte currentTerm[NUM_SERVERS];
typedef Logs {
	byte logs[2];
};
Logs logs[NUM_SERVERS];
byte commitIndex[NUM_SERVERS];

// If commitIndex reaches MAX_LOG, the whole system is nearly full.
// There's no need to run further.
proctype server(byte serverId) {
	printf("SERVER %d: Starting server process\n",serverId);
	state[serverId] = follower;
	byte votedFor = NIL;
	printf("SERVER %d: Initialized as follower,term = %d,votedFor = %d\n",serverId,currentTerm[serverId],votedFor);
	
// helpers
	byte i;
	bool votesGranted[NUM_SERVERS];
	byte lastLogTerm,lastLogIndex;
	bool logOk;
	Message msg,outMsg;
	
	do// main loop
:: // crash
	(state[serverId] != crashed) -> 
	atomic {
		printf("SERVER %d: Crashing from state %e\n",serverId,state[serverId]);
		state[serverId] = crashed;
// Reset votes when crashing
		for (i : 0 .. NUM_SERVERS - 1) {
			votesGranted[i] = 0;
		}
		votedFor = NIL;
	}
:: // resume / recover
	(state[serverId] == crashed) -> 
	atomic {
		printf("SERVER %d: Recovering from crash,becoming follower\n",serverId);
		state[serverId] = follower;
// Don't increment term on recovery, just rejoin with current term
		votedFor = NIL;
	}
:: // timeout
	(state[serverId] == candidate || state[serverId] == follower) -> 
	atomic {
		printf("SERVER %d: Timeout occurred,becoming candidate\n",serverId);
		state[serverId] = candidate;
		currentTerm[serverId] = currentTerm[serverId] + 1;
		
		votedFor = serverId;
// Reset votes and vote for self
		for (i : 0 .. NUM_SERVERS - 1) {
			votesGranted[i] = 0;
		}
		votesGranted[serverId] = 1;
		printf("SERVER %d: Now candidate for term %d,voted for self\n",serverId,currentTerm[serverId]);
	}
:: // restart
	(state[serverId] == follower) -> 
	atomic {
		printf("SERVER %d: Restarting as follower\n",serverId);
	}
:: // request vote
	(state[serverId] == candidate) -> 
	atomic {
		printf("SERVER %d: Sending RequestVote as candidate for term %d\n",serverId,currentTerm[serverId]);
		
// Prepare RequestVote message
		outMsg.messageType = REQUEST_VOTE;
		outMsg.sender = serverId;
		outMsg.requestVote.term = currentTerm[serverId];
		
// Set last log info
		if
		:: (logs[serverId].logs[0] == 0) -> 
			outMsg.requestVote.lastLogTerm = 0;
			outMsg.requestVote.lastLogIndex = 0;
			printf("SERVER %d: Last log empty,lastLogTerm = 0,lastLogIndex = 0\n",serverId);
		:: (logs[serverId].logs[0] != 0 && logs[serverId].logs[1] == 0) -> 
			outMsg.requestVote.lastLogTerm = logs[serverId].logs[0];
			outMsg.requestVote.lastLogIndex = 1;
			printf("SERVER %d: Last log at index 0,lastLogTerm = %d,lastLogIndex = 1\n",serverId,outMsg.requestVote.lastLogTerm);
		:: (logs[serverId].logs[0] != 0 && logs[serverId].logs[1] != 0) -> 
			outMsg.requestVote.lastLogTerm = logs[serverId].logs[1];
			outMsg.requestVote.lastLogIndex = 2;
			printf("SERVER %d: Last log at index 1,lastLogTerm = %d,lastLogIndex = 2\n",serverId,outMsg.requestVote.lastLogTerm);
		fi
		
// Send RequestVote to other servers
		for (i : 0 .. NUM_SERVERS - 1) {
			if
			:: (i != serverId) -> 
				outMsg.receiver = i;
				printf("SERVER %d: Sending RequestVote to server %d\n",serverId,i);
				toNodes[i]!outMsg;
			:: else -> skip;
			fi
		}
	}
:: // become leader
	(state[serverId] == candidate) -> 
	atomic {
// Count votes
		byte voteCount = 0;
		for (i : 0 .. NUM_SERVERS - 1) {
			if
			:: votesGranted[i] -> voteCount++;
			:: else -> skip;
			fi
		}
		
// If majority of votes received, become leader
		if
		:: (voteCount > (NUM_SERVERS / 2)) -> 
			state[serverId] = leader;
			printf("SERVER %d: Becoming leader for term %d with %d votes\n",serverId,currentTerm[serverId],voteCount);
		:: else -> skip;
		fi
	}
:: // handle incoming messages
	(toNodes[serverId]?[msg] && state[serverId] != crashed) -> // Only process messages if not crashed
	atomic {
		toNodes[serverId]?msg;
		byte sender = msg.sender;
		
// Handle different message types
		if
		:: (msg.messageType == REQUEST_VOTE) -> 
			printf("SERVER %d: Received RequestVote from server %d for term %d\n",serverId,sender,msg.requestVote.term);
			
// Update terms if needed
			if
			:: (msg.requestVote.term > currentTerm[serverId]) -> 
				printf("SERVER %d: Updating term from %d to %d and becoming follower\n",serverId,currentTerm[serverId],msg.requestVote.term);
				currentTerm[serverId] = msg.requestVote.term;
				state[serverId] = follower;
				votedFor = NIL;
			:: (msg.requestVote.term <= currentTerm[serverId]) -> 
				printf("SERVER %d: RequestVote term %d <= current term %d\n",serverId,msg.requestVote.term,currentTerm[serverId]);
				skip;
			fi
			
// Determine last log info
			if
			:: (logs[serverId].logs[0] == 0) -> 
				lastLogTerm = 0;
				lastLogIndex = 0;
				printf("SERVER %d: My last log empty,lastLogTerm = 0,lastLogIndex = 0\n",serverId);
			:: (logs[serverId].logs[0] != 0 && logs[serverId].logs[1] == 0) -> 
				lastLogTerm = logs[serverId].logs[0];
				lastLogIndex = 1;
				printf("SERVER %d: My last log at index 0,lastLogTerm = %d,lastLogIndex = 1\n",serverId,lastLogTerm);
			:: (logs[serverId].logs[0] != 0 && logs[serverId].logs[1] != 0) -> 
				lastLogTerm = logs[serverId].logs[1];
				lastLogIndex = 2;
				printf("SERVER %d: My last log at index 1,lastLogTerm = %d,lastLogIndex = 2\n",serverId,lastLogTerm);
			fi
			
// Check if log is ok and vote can be granted
			logOk = msg.requestVote.lastLogTerm > lastLogTerm || 
			(msg.requestVote.lastLogTerm == lastLogTerm && msg.requestVote.lastLogIndex >= lastLogIndex);
			bool voteGranted = msg.requestVote.term == currentTerm[serverId] && logOk && (votedFor == NIL || votedFor == sender);
			
// Prepare response
			outMsg.messageType = REQUEST_VOTE_RESPONSE;
			outMsg.sender = serverId;
			outMsg.receiver = sender;
			outMsg.requestVoteResponse.term = currentTerm[serverId];
			outMsg.requestVoteResponse.voteGranted = voteGranted;
			
			if
			:: voteGranted -> 
				votedFor = sender;
				printf("SERVER %d: Granting vote to server %d for term %d\n",serverId,sender,currentTerm[serverId]);
			:: !voteGranted -> 
				printf("SERVER %d: Rejecting vote for server %d,term = %d,logOk = %d,votedFor = %d\n",
				serverId,sender,currentTerm[serverId],logOk,votedFor);
				skip;
			fi
			
// Send response
			toNodes[sender]!outMsg;
			
		:: (msg.messageType == REQUEST_VOTE_RESPONSE) -> 
			printf("SERVER %d: Received RequestVoteResponse from server %d,term = %d,granted = %d\n",
			serverId,sender,msg.requestVoteResponse.term,msg.requestVoteResponse.voteGranted);
			
			if
			:: (msg.requestVoteResponse.term > currentTerm[serverId]) -> // update terms
				printf("SERVER %d: Updating term from %d to %d and becoming follower\n",
				serverId,currentTerm[serverId],msg.requestVoteResponse.term);
				currentTerm[serverId] = msg.requestVoteResponse.term;
				state[serverId] = follower;
				votedFor = NIL;
			:: (msg.requestVoteResponse.term == currentTerm[serverId] && msg.requestVoteResponse.voteGranted) -> 
				votesGranted[sender] = 1;
				printf("SERVER %d: Vote granted by server %d\n",serverId,sender);
			:: else -> 
				printf("SERVER %d: Vote not granted by server %d\n",serverId,sender);
				skip;
			fi
			
		:: (msg.messageType == APPEND_ENTRY) -> 
			printf("SERVER %d: Received AppendEntries from server %d,term = %d,index = %d\n",
			serverId,sender,msg.appendEntry.term,msg.appendEntry.index);
			
// Update terms if needed
			if
			:: (msg.appendEntry.term > currentTerm[serverId]) -> 
				printf("SERVER %d: Updating term from %d to %d and becoming follower\n",
				serverId,currentTerm[serverId],msg.appendEntry.term);
				currentTerm[serverId] = msg.appendEntry.term;
				state[serverId] = follower;
				votedFor = NIL;
			:: (msg.appendEntry.term <= currentTerm[serverId]) -> 
				printf("SERVER %d: AppendEntries term %d <= current term %d\n",
				serverId,msg.appendEntry.term,currentTerm[serverId]);
				skip;
			fi
			
// Return to follower state if needed
			if
			:: (msg.appendEntry.term == currentTerm[serverId] && state[serverId] == candidate) -> 
				printf("SERVER %d: Stepping down from candidate to follower for term %d\n",
				serverId,currentTerm[serverId]);
				state[serverId] = follower;
				votedFor = NIL;
			:: else -> skip;
			fi
			
// Check if log is ok
			logOk = msg.appendEntry.index == 0 || 
			(msg.appendEntry.index == 1 && msg.appendEntry.prevLogTerm == logs[serverId].logs[0]);
			
// Prepare response
			outMsg.messageType = APPEND_ENTRY_RESPONSE;
			outMsg.sender = serverId;
			outMsg.receiver = sender;
			outMsg.appendEntryResponse.term = currentTerm[serverId];
			
			if
			:: (msg.appendEntry.term < currentTerm[serverId] || 
				(msg.appendEntry.term == currentTerm[serverId] && state[serverId] == follower && !logOk)) -> 
// Reject request
				outMsg.appendEntryResponse.success = 0;
				printf("SERVER %d: Rejecting AppendEntries,term = %d,logOk = %d\n",
				serverId,currentTerm[serverId],logOk);
			:: (msg.appendEntry.term == currentTerm[serverId] && state[serverId] == follower && logOk) -> 
// Accept request
				outMsg.appendEntryResponse.success = 1;
				printf("SERVER %d: Accepting AppendEntries,updating log at index %d to term %d\n",
				serverId,msg.appendEntry.index,msg.appendEntry.term);
				
// Update log
				logs[serverId].logs[msg.appendEntry.index] = msg.appendEntry.term;
				
// Update commit index
				commitIndex[serverId] = msg.appendEntry.leaderCommit;
				printf("SERVER %d: Updated commitIndex to %d\n",serverId,commitIndex[serverId]);
			fi
			
// Send response
			toNodes[sender]!outMsg;
			
		:: (msg.messageType == APPEND_ENTRY_RESPONSE) -> 
			printf("SERVER %d: Received AppendEntriesResponse from server %d,term = %d,success = %d\n",
			serverId,sender,msg.appendEntryResponse.term,msg.appendEntryResponse.success);
			
			if
			:: (msg.appendEntryResponse.term > currentTerm[serverId]) -> // update terms
				printf("SERVER %d: Updating term from %d to %d and becoming follower\n",
				serverId,currentTerm[serverId],msg.appendEntryResponse.term);
				currentTerm[serverId] = msg.appendEntryResponse.term;
				state[serverId] = follower;
				votedFor = NIL;
			:: (msg.appendEntryResponse.term < currentTerm[serverId]) -> 
				printf("SERVER %d: Ignoring AppendEntriesResponse with lower term %d\n",
				serverId,msg.appendEntryResponse.term);
				skip;
			:: (msg.appendEntryResponse.term == currentTerm[serverId] && 
				msg.appendEntryResponse.success && state[serverId] == leader) -> 
// Advance commit index
				printf("SERVER %d: Successful AppendEntries,considering commit advancement\n",serverId);
				
				if
				:: (commitIndex[serverId] == 0 && logs[sender].logs[0] == logs[serverId].logs[0]) -> 
					commitIndex[serverId] = 1;
					printf("SERVER %d: Advanced commitIndex to 1\n",serverId);
				:: else -> 
					printf("SERVER %d: Cannot advance commitIndex further\n",serverId);
					skip;
				fi
			:: else -> 
				printf("SERVER %d: AppendEntriesResponse not successful or not leader\n",serverId);
				skip;
			fi
		fi
	}
:: // append entries (leader sends to followers)
	(state[serverId] == leader) -> 
	atomic {
// Send AppendEntries to all other servers
		for (i : 0 .. NUM_SERVERS - 1) {
			if
			:: (i != serverId) -> 
// Prepare AppendEntry message
				outMsg.messageType = APPEND_ENTRY;
				outMsg.sender = serverId;
				outMsg.receiver = i;
				outMsg.appendEntry.term = currentTerm[serverId];
				outMsg.appendEntry.leaderCommit = commitIndex[serverId];
				
				printf("SERVER %d: Leader sending AppendEntries to server %d\n",serverId,i);
				
				if
				:: (logs[serverId].logs[0] != logs[i].logs[0]) -> 
					outMsg.appendEntry.index = 0;
					printf("SERVER %d: Sending log at index 0,term = %d\n",serverId,outMsg.appendEntry.term);
				:: (logs[serverId].logs[1] != 0 && logs[serverId].logs[0] == logs[i].logs[0] && 
					logs[serverId].logs[1] != logs[i].logs[1]) -> 
					outMsg.appendEntry.index = 1;
					outMsg.appendEntry.prevLogTerm = logs[i].logs[0];
					printf("SERVER %d: Sending log at index 1,term = %d,prevLogTerm = %d\n",
					serverId,outMsg.appendEntry.term,outMsg.appendEntry.prevLogTerm);
				:: else -> 
					outMsg.appendEntry.index = NIL;
					printf("SERVER %d: No new logs to send to server %d\n",serverId,i);
				fi
				
// Send message
				toNodes[i]!outMsg;
			:: else -> skip;
			fi
		}
	}
:: // client request
	(state[serverId] == leader && logs[serverId].logs[1] == 0) -> 
	atomic {
		if
		:: logs[serverId].logs[0] == 0 -> 
			logs[serverId].logs[0] = currentTerm[serverId];
			printf("SERVER %d: Client request,adding entry at index 0 with term %d\n",
			serverId,currentTerm[serverId]);
		:: logs[serverId].logs[0] != 0 -> 
			logs[serverId].logs[1] = currentTerm[serverId];
			printf("SERVER %d: Client request,adding entry at index 1 with term %d\n",
			serverId,currentTerm[serverId]);
		fi
	}
od;
printf("SERVER %d: Process terminated\n",serverId);
};

init {
printf("INIT: Starting Raft simulation with %d servers\n",NUM_SERVERS);
byte i;
atomic {
	for (i : 0 .. NUM_SERVERS - 1) {
		run server(i);
	}
}
printf("INIT: All servers started\n");
}

// LTL properties can be updated to use NUM_SERVERS and loops if needed
ltl electionSafety {
[]!(
(state[0] == leader && state[1] == leader && currentTerm[0] == currentTerm[1])
|| (state[0] == leader && state[2] == leader && currentTerm[0] == currentTerm[2])
|| (state[1] == leader && state[2] == leader && currentTerm[1] == currentTerm[2])
)
}

// Crash Safety: No two servers can be leader in same term after crash recovery
ltl crashSafety {
[](
(state[0] == crashed || state[1] == crashed || state[2] == crashed) -> 
[]!(
(state[0] == leader && state[1] == leader && currentTerm[0] == currentTerm[1])
|| (state[0] == leader && state[2] == leader && currentTerm[0] == currentTerm[2])
|| (state[1] == leader && state[2] == leader && currentTerm[1] == currentTerm[2])
)
)
}

// Recovery Property: A crashed server eventually becomes follower
ltl eventualRecovery {
[](
(state[0] == crashed -> <> (state[0] == follower))
&& (state[1] == crashed -> <> (state[1] == follower))
&& (state[2] == crashed -> <> (state[2] == follower))
)
}

// Leader Append-Only (Scalable version)
#define LEADER_APPEND_ONLY(id,log_idx) \
[]( \
state[id] == leader -> \
( \
(logs[id].logs[log_idx] == 0) \
|| ((logs[id].logs[log_idx] == 1) W (state[id] != leader)) \
|| ((logs[id].logs[log_idx] == 2) W (state[id] != leader)) \
|| ((logs[id].logs[log_idx] == 3) W (state[id] != leader)) \
) \
)

ltl leaderAppendOnly0 { LEADER_APPEND_ONLY(0,0) && LEADER_APPEND_ONLY(0,1) }
ltl leaderAppendOnly1 { LEADER_APPEND_ONLY(1,0) && LEADER_APPEND_ONLY(1,1) }
ltl leaderAppendOnly2 { LEADER_APPEND_ONLY(2,0) && LEADER_APPEND_ONLY(2,1) }

// Log Matching (Scalable version)
#define LOG_MATCH(id1,id2) \
[]( \
(logs[id1].logs[1] != 0 && logs[id1].logs[1] == logs[id2].logs[1]) -> \
(logs[id1].logs[0] == logs[id2].logs[0]) \
)

ltl logMatching {
LOG_MATCH(0,1) && LOG_MATCH(0,2) && LOG_MATCH(1,2)
}

// State Machine Safety (Scalable version)
#define STATE_MACHINE_SAFETY(id1,id2) \
[]( \
(commitIndex[id1] == 1 && commitIndex[id2] == 1) -> \
(logs[id1].logs[0] == logs[id2].logs[0]) \
)

ltl stateMachineSafety {
STATE_MACHINE_SAFETY(0,1) && STATE_MACHINE_SAFETY(0,2) && STATE_MACHINE_SAFETY(1,2)
}

// Leader Completeness (Scalable version)
#define LEADER_COMPLETENESS(id1,id2) \
[]( \
(commitIndex[id1] == 1) -> \
[]((state[id2] == leader) -> (logs[id1].logs[0] == logs[id2].logs[0])) \
)

ltl leaderCompleteness {
LEADER_COMPLETENESS(0,1) && LEADER_COMPLETENESS(0,2) && 
LEADER_COMPLETENESS(1,0) && LEADER_COMPLETENESS(1,2) && 
LEADER_COMPLETENESS(2,0) && LEADER_COMPLETENESS(2,1)
}

// Crash-specific properties
#define NO_CRASHED_LEADER(id) []!(state[id] == crashed && state[id] == leader)

ltl noCrashedLeader {
NO_CRASHED_LEADER(0) && 
NO_CRASHED_LEADER(1) && 
NO_CRASHED_LEADER(2)
}

#define CRASHED_NO_MESSAGES(id) []((state[id] == crashed) -> []!(len(toNodes[id]) > 0))

ltl t n {
CRASHED_NO_MESSAGES(0) && 
CRASHED_NO_MESSAGES(1) && 
CRASHED_NO_MESSAGES(2)
}

// Log consistency after crash and recovery
#define RECOVERY_LOG_CONSISTENCY(id1,id2) \
[]((state[id1] == crashed && <> (state[id1] == follower) && state[id2] == leader) -> \
(logs[id1].logs[0] == logs[id2].logs[0] || logs[id1].logs[0] == 0))

ltl recoveryLogConsistency {
RECOVERY_LOG_CONSISTENCY(0,1) && RECOVERY_LOG_CONSISTENCY(0,2) && 
RECOVERY_LOG_CONSISTENCY(1,0) && RECOVERY_LOG_CONSISTENCY(1,2) && 
RECOVERY_LOG_CONSISTENCY(2,0) && RECOVERY_LOG_CONSISTENCY(2,1)
}

// Ensure there's always a majority of non-crashed nodes
// For 3 servers, we ensure no more than 1 server is crashed at a time
#define NODES_NOT_CRASHED(id1,id2)!((state[id1] == crashed) && (state[id2] == crashed))

ltl majorityAlive {
NODES_NOT_CRASHED(0,1) && 
NODES_NOT_CRASHED(0,2) && 
NODES_NOT_CRASHED(1,2)
}

// Verify that a crashed node can eventually become leader after recovery
#define CRASHED_CAN_BECOME_LEADER(id) []((state[id] == crashed) -> <> ((state[id] == follower) && <> (state[id] == leader)))

ltl eventualLeadership {
CRASHED_CAN_BECOME_LEADER(0) || 
CRASHED_CAN_BECOME_LEADER(1) || 
CRASHED_CAN_BECOME_LEADER(2)
}
