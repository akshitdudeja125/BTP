#define MAX_TERM 10// 1 to 3
#define MAX_LOG 2// 0 to 1
#define NUM_SERVERS 3// Number of servers in the system
#define MSG_CAPACITY 10// Capacity of message channels

#define NIL 10// a number that won't be used

// Message types
mtype:MessageType = { APPEND_ENTRY,APPEND_ENTRY_RESPONSE,REQUEST_VOTE,REQUEST_VOTE_RESPONSE };

// Variables for safety properties
byte leaders = 0;// Number of leaders in the system
bool isLeader = 0;// Indicates whether there is a leader in the system
bool leader[NUM_SERVERS];// Indicates which nodes are leaders
byte connect[NUM_SERVERS];// Number of network connections for each node

typedef Heartbeat {
	byte term;// term of the leader
	byte leaderId;// id of the leader
	byte prevLogIndex;// index of the previous log entry
	byte prevLogTerm;// term of the previous log entry
	byte leaderCommit;// commit index of the leader
};

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
mtype:State = { LEADER,CANDIDATE,FOLLOWER,CRASHED };
mtype:State state[NUM_SERVERS];
byte currentTerm[NUM_SERVERS];
typedef Logs {
	byte logs[2];
};
Logs logs[NUM_SERVERS];
byte commitIndex[NUM_SERVERS];
byte time_out[NUM_SERVERS];// Added timeout variable for each server

// If commitIndex reaches MAX_LOG, the whole system is nearly full.
// There's no need to run further.
proctype server(byte serverId) {
	printf("SERVER %d: Starting server process\n",serverId);
	state[serverId] = FOLLOWER;
	byte votedFor = NIL;
	time_out[serverId] = 1;// Initialize timeout with non - zero value
	leader[serverId] = 0;// Initialize leader flag for this server
	connect[serverId] = NUM_SERVERS - 1;// Initialize with connections to all other servers
	printf("SERVER %d: Initialized as follower,term = %d,votedFor = %d,time_out = %d\n",
	serverId,currentTerm[serverId],votedFor,time_out[serverId]);
	
// helpers
	byte i;
	bool votesGranted[NUM_SERVERS];
	byte lastLogTerm,lastLogIndex;
	bool logOk;
	Message msg,outMsg;
	byte voteCount;
	
	do// main loop
:: // crash
	(state[serverId] != CRASHED) -> 
	atomic {
		printf("SERVER %d: Crashing from state %e\n",serverId,state[serverId]);
		if 
		:: (state[serverId] == LEADER) -> 
			leaders--;
			isLeader = (leaders > 0);
			leader[serverId] = 0;
		:: else -> skip;
		fi
		state[serverId] = CRASHED;
		connect[serverId] = 0;// Reset connections when crashed
// Reset votes when crashing
		for (i : 0 .. NUM_SERVERS - 1) {
			votesGranted[i] = 0;
		}
		votedFor = NIL;
	}
:: // resume / recover
	(state[serverId] == CRASHED) -> 
	atomic {
		printf("SERVER %d: Recovering from crash,becoming follower\n",serverId);
		state[serverId] = FOLLOWER;
// Don't increment term on recovery, just rejoin with current term
		votedFor = NIL;
		time_out[serverId] = 1;// Reset timeout when recovering
		connect[serverId] = NUM_SERVERS - 1;// Restore connections on recovery
	}
:: // timer ticks down (timeout count down)
	(state[serverId] != CRASHED && state[serverId] != LEADER && time_out[serverId] > 0) -> 
	atomic {
		time_out[serverId] = time_out[serverId] - 1;
		printf("SERVER %d: Timer tick,time_out now %d\n",serverId,time_out[serverId]);
	}
:: // timeout occurs (time_out reaches 0)
	(state[serverId] == FOLLOWER && time_out[serverId] == 0) -> 
	atomic {
		printf("SERVER %d: Timeout occurred (time_out = 0),becoming candidate\n",serverId);
		state[serverId] = CANDIDATE;
		currentTerm[serverId] = currentTerm[serverId] + 1;
		
		votedFor = serverId;
// Reset votes and vote for self
		for (i : 0 .. NUM_SERVERS - 1) {
			votesGranted[i] = 0;
		}
		votesGranted[serverId] = 1;
		
// Prepare RequestVote message
		outMsg.messageType = REQUEST_VOTE;
		outMsg.sender = serverId;
		outMsg.requestVote.term = currentTerm[serverId];
		
// Set last log info
		if
		:: (logs[serverId].logs[0] == 0) -> 
			outMsg.requestVote.lastLogTerm = 0;
			outMsg.requestVote.lastLogIndex = 0;
		:: (logs[serverId].logs[0] != 0 && logs[serverId].logs[1] == 0) -> 
			outMsg.requestVote.lastLogTerm = logs[serverId].logs[0];
			outMsg.requestVote.lastLogIndex = 1;
		:: (logs[serverId].logs[0] != 0 && logs[serverId].logs[1] != 0) -> 
			outMsg.requestVote.lastLogTerm = logs[serverId].logs[1];
			outMsg.requestVote.lastLogIndex = 2;
		fi
		
// Send RequestVote to other servers
		for (i : 0 .. NUM_SERVERS - 1) {
			if
			:: (i != serverId) -> 
				outMsg.receiver = i;
				printf("SERVER %d: Sending RequestVote to server %d for term %d\n",serverId,i,currentTerm[serverId]);
				toNodes[i]!outMsg;
			:: else -> skip;
			fi
		}
		
		printf("SERVER %d: Now candidate for term %d,voted for self\n",serverId,currentTerm[serverId]);
	}
:: // candidate election completion check
	(state[serverId] == CANDIDATE && time_out[serverId] == 0) -> 
	atomic {
// Count votes
		voteCount = 0;
		for (i : 0 .. NUM_SERVERS - 1) {
			if
			:: votesGranted[i] -> voteCount++;
			:: else -> skip;
			fi
		}
		
// If majority of votes received, become leader
		if
		:: (voteCount > (NUM_SERVERS / 2)) -> 
			state[serverId] = LEADER;
			leaders++;
			isLeader = 1;
			leader[serverId] = 1;
			printf("SERVER %d: Becoming leader for term %d with %d votes\n",serverId,currentTerm[serverId],voteCount);
// Send initial heartbeat
			for (i : 0 .. NUM_SERVERS - 1) {
				if
				:: (i != serverId) -> 
					outMsg.messageType = APPEND_ENTRY;
					outMsg.sender = serverId;
					outMsg.receiver = i;
					outMsg.appendEntry.term = currentTerm[serverId];
					outMsg.appendEntry.leaderCommit = commitIndex[serverId];
					outMsg.appendEntry.index = NIL;// Heartbeat has no log entry
					printf("SERVER %d: Sending initial heartbeat to server %d\n",serverId,i);
					toNodes[i]!outMsg;
				:: else -> skip;
				fi
			}
		:: else -> 
// Election timeout for candidate, restart election
			printf("SERVER %d: Election timeout without majority,restarting election\n",serverId);
			time_out[serverId] = 1;// Reset the timeout
		fi
	}
:: // restart
	(state[serverId] == FOLLOWER) -> 
	atomic {
		printf("SERVER %d: Restarting as follower,resetting timeout\n",serverId);
		time_out[serverId] = 1;// Reset timeout on restart
	}
:: // handle incoming messages
	(toNodes[serverId]?[msg] && state[serverId] != CRASHED) -> // Only process messages if not crashed
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
				if 
				:: (state[serverId] == LEADER) -> 
					leaders--;
					isLeader = (leaders > 0);
					leader[serverId] = 0;
				:: else -> skip;
				fi
				currentTerm[serverId] = msg.requestVote.term;
				state[serverId] = FOLLOWER;
				votedFor = NIL;
				time_out[serverId] = 1;// Reset timeout when term changes
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
				if 
				:: (state[serverId] == LEADER) -> 
					leaders--;
					isLeader = (leaders > 0);
					leader[serverId] = 0;
				:: else -> skip;
				fi
				currentTerm[serverId] = msg.requestVoteResponse.term;
				state[serverId] = FOLLOWER;
				votedFor = NIL;
				time_out[serverId] = 1;// Reset timeout when term changes
			:: (msg.requestVoteResponse.term == currentTerm[serverId] && msg.requestVoteResponse.voteGranted && state[serverId] == CANDIDATE) -> 
				votesGranted[sender] = 1;
				printf("SERVER %d: Vote granted by server %d\n",serverId,sender);
			:: else -> 
				printf("SERVER %d: Vote not granted by server %d or no longer a candidate\n",serverId,sender);
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
				if 
				:: (state[serverId] == LEADER) -> 
					leaders--;
					isLeader = (leaders > 0);
					leader[serverId] = 0;
				:: else -> skip;
				fi
				currentTerm[serverId] = msg.appendEntry.term;
				state[serverId] = FOLLOWER;
				votedFor = NIL;
				time_out[serverId] = 1;// Reset timeout for higher term
			:: (msg.appendEntry.term <= currentTerm[serverId]) -> 
				printf("SERVER %d: AppendEntries term %d <= current term %d\n",
				serverId,msg.appendEntry.term,currentTerm[serverId]);
				skip;
			fi
			
// Return to follower state if needed and reset timeout
			if
			:: (msg.appendEntry.term == currentTerm[serverId]) -> 
				if
				:: (state[serverId] == CANDIDATE) -> 
					printf("SERVER %d: Stepping down from candidate to follower for term %d\n",
					serverId,currentTerm[serverId]);
					state[serverId] = FOLLOWER;
					votedFor = NIL;
				:: else -> skip;
				fi
// Reset timeout on valid AppendEntries (heartbeat)
				time_out[serverId] = 1;
				printf("SERVER %d: Reset timeout on AppendEntries from leader\n",serverId);
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
				(msg.appendEntry.term == currentTerm[serverId] && state[serverId] == FOLLOWER && !logOk)) -> 
// Reject request
				outMsg.appendEntryResponse.success = 0;
				printf("SERVER %d: Rejecting AppendEntries,term = %d,logOk = %d\n",
				serverId,currentTerm[serverId],logOk);
			:: (msg.appendEntry.term == currentTerm[serverId] && state[serverId] == FOLLOWER && logOk) -> 
// Accept request
				outMsg.appendEntryResponse.success = 1;
				printf("SERVER %d: Accepting AppendEntries,updating log at index %d to term %d\n",
				serverId,msg.appendEntry.index,msg.appendEntry.term);
				
// Update log if it's not just a heartbeat
				if
				:: (msg.appendEntry.index != NIL) -> 
					logs[serverId].logs[msg.appendEntry.index] = msg.appendEntry.term;
				:: else -> skip;
				fi
				
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
				if 
				:: (state[serverId] == LEADER) -> 
					leaders--;
					isLeader = (leaders > 0);
					leader[serverId] = 0;
				:: else -> skip;
				fi
				currentTerm[serverId] = msg.appendEntryResponse.term;
				state[serverId] = FOLLOWER;
				votedFor = NIL;
				time_out[serverId] = 1;// Reset timeout when term changes
			:: (msg.appendEntryResponse.term < currentTerm[serverId]) -> 
				printf("SERVER %d: Ignoring AppendEntriesResponse with lower term %d\n",
				serverId,msg.appendEntryResponse.term);
				skip;
			:: (msg.appendEntryResponse.term == currentTerm[serverId] && 
				msg.appendEntryResponse.success && state[serverId] == LEADER) -> 
// Advance commit index
				printf("SERVER %d: Successful AppendEntries,considering commit advancement\n",serverId);
				connect[serverId]++;// Increment connection count for successful communication
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
:: // heartbeat (leader sends to followers)
	(state[serverId] == LEADER) -> 
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
					printf("SERVER %d: No new logs to send to server %d,sending heartbeat\n",serverId,i);
				fi
				
// Send message
				toNodes[i]!outMsg;
			:: else -> skip;
			fi
		}
	}
:: // client request
	(state[serverId] == LEADER && logs[serverId].logs[1] == 0) -> 
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
		leader[i] = 0;// Initialize leader array
		connect[i] = 0;// Initialize connection counts
		run server(i);
		
	}
}
printf("INIT: All servers started\n");
}

// LTL properties can be updated to use NUM_SERVERS and loops if needed

#define ELECTION_SAFETY(id1,id2) []((state[id1] == LEADER && state[id2] == LEADER && currentTerm[id1] == currentTerm[id2]) || (state[id1] == LEADER && state[id2] == LEADER && currentTerm[id1] == currentTerm[id2]))

ltl electionSafety {
ELECTION_SAFETY(0,1) && ELECTION_SAFETY(0,2) && ELECTION_SAFETY(1,2)
}

// Crash Safety: No two servers can be leader in same term after crash recovery

#define CRASH_SAFETY(id1,id2) []((state[id1] == CRASHED && state[id2] == CRASHED) -> []!(state[id1] == LEADER && state[id2] == LEADER && currentTerm[id1] == currentTerm[id2]))

ltl crashSafety {
CRASH_SAFETY(0,1) && CRASH_SAFETY(0,2) && CRASH_SAFETY(1,2)
}

#define EVENTUAL_RECOVERY(id) []((state[id] == CRASHED -> <> (state[id] == FOLLOWER)))

// Recovery Property: A crashed server eventually becomes follower
ltl eventualRecovery {
EVENTUAL_RECOVERY(0) && EVENTUAL_RECOVERY(1) && EVENTUAL_RECOVERY(2)
}

// Leader Append-Only (Scalable version)
#define LEADER_APPEND_ONLY(id,log_idx) \
[]( \
state[id] == LEADER -> \
( \
(logs[id].logs[log_idx] == 0) \
|| ((logs[id].logs[log_idx] == 1) W (state[id] != LEADER)) \
|| ((logs[id].logs[log_idx] == 2) W (state[id] != LEADER)) \
|| ((logs[id].logs[log_idx] == 3) W (state[id] != LEADER)) \
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
[]((state[id2] == LEADER) -> (logs[id1].logs[0] == logs[id2].logs[0])) \
)

ltl leaderCompleteness {
LEADER_COMPLETENESS(0,1) && LEADER_COMPLETENESS(0,2) && 
LEADER_COMPLETENESS(1,0) && LEADER_COMPLETENESS(1,2) && 
LEADER_COMPLETENESS(2,0) && LEADER_COMPLETENESS(2,1)
}

// Crash-specific properties
#define NO_CRASHED_LEADER(id) []!(state[id] == CRASHED && state[id] == LEADER)

ltl noCrashedLeader {
NO_CRASHED_LEADER(0) && 
NO_CRASHED_LEADER(1) && 
NO_CRASHED_LEADER(2)
}

#define CRASHED_NO_MESSAGES(id) []((state[id] == CRASHED) -> []!(len(toNodes[id]) > 0))

ltl crashedNoMessages {
CRASHED_NO_MESSAGES(0) && 
CRASHED_NO_MESSAGES(1) && 
CRASHED_NO_MESSAGES(2)
}

// Log consistency after crash and recovery
#define RECOVERY_LOG_CONSISTENCY(id1,id2) \
[]((state[id1] == CRASHED && <> (state[id1] == FOLLOWER) && state[id2] == LEADER) -> \
(logs[id1].logs[0] == logs[id2].logs[0] || logs[id1].logs[0] == 0))

ltl recoveryLogConsistency {
RECOVERY_LOG_CONSISTENCY(0,1) && RECOVERY_LOG_CONSISTENCY(0,2) && 
RECOVERY_LOG_CONSISTENCY(1,0) && RECOVERY_LOG_CONSISTENCY(1,2) && 
RECOVERY_LOG_CONSISTENCY(2,0) && RECOVERY_LOG_CONSISTENCY(2,1)
}

// Ensure there's always a majority of non-crashed nodes
// For 3 servers, we ensure no more than 1 server is crashed at a time
#define NODES_NOT_CRASHED(id1,id2)!((state[id1] == CRASHED) && (state[id2] == CRASHED))

ltl majorityAlive {
NODES_NOT_CRASHED(0,1) && 
NODES_NOT_CRASHED(0,2) && 
NODES_NOT_CRASHED(1,2)
}

// Verify that a crashed node can eventually become leader after recovery
#define CRASHED_CAN_BECOME_LEADER(id) []((state[id] == CRASHED) -> <> ((state[id] == FOLLOWER) && <> (state[id] == LEADER)))

ltl eventualLeadership {
CRASHED_CAN_BECOME_LEADER(0) || 
CRASHED_CAN_BECOME_LEADER(1) || 
CRASHED_CAN_BECOME_LEADER(2)
}

// New properties based on the requirements

// Property 1: Stability - Leader remains stable when it has enough connections
#define LEADER_STABILITY(id) []((leader[id] == 1 && connect[id] >= NUM_SERVERS / 2) -> [](leader[id] == 1 W state[id] == CRASHED))

ltl stability0 { LEADER_STABILITY(0) }
ltl stability1 { LEADER_STABILITY(1) }
ltl stability2 { LEADER_STABILITY(2) }

// // Property 2: Liveness - Eventually a leader is elected
ltl liveness { <> (isLeader == 1) }

// Property 3: Uniqueness - At most one leader per term
ltl uniqueness { [](leaders <= 1) }
