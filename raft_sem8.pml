#define MAX_TERM 3// 1 to 3
#define MAX_LOG 2// 0 to 1
#define NUM_SERVERS 3// Number of servers in the system
#define MSG_CAPACITY 10// Capacity of message channels
#define MAX_STEPS 100// Maximum number of steps before forced termination

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
mtype:State = { leader,candidate,follower };
mtype:State state[NUM_SERVERS];
byte currentTerm[NUM_SERVERS];
typedef Logs {
	byte logs[2];
};
Logs logs[NUM_SERVERS];
byte commitIndex[NUM_SERVERS];

// Flag to indicate if simulation should terminate
bool terminateSimulation = false;
// Counter for servers that have reached max term
byte maxTermServers = 0;
// Step counter to force termination
int stepCounter = 0;

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
	bool reachedMaxTerm = false;
	
	do// main loop
:: // timeout
	(!terminateSimulation && state[serverId] == candidate || state[serverId] == follower) -> 
	atomic {
		stepCounter++;
		if
		:: (stepCounter > MAX_STEPS) -> 
			printf("SERVER %d: Maximum steps reached,terminating simulation\n",serverId);
			terminateSimulation = true;
		:: else -> 
			printf("SERVER %d: Timeout occurred,becoming candidate\n",serverId);
			state[serverId] = candidate;
			currentTerm[serverId] = currentTerm[serverId] + 1;
			
// Check if we've reached max term
			if
			:: (currentTerm[serverId] > MAX_TERM && !reachedMaxTerm) -> 
				reachedMaxTerm = true;
				maxTermServers++;
				printf("SERVER %d: Reached max term %d,maxTermServers = %d\n",serverId,currentTerm[serverId],maxTermServers);
				
// If all servers have reached max term, terminate simulation
				if
				:: (maxTermServers == NUM_SERVERS) -> 
					printf("All servers reached max term,terminating simulation\n");
					terminateSimulation = true;
				:: else -> skip;
				fi
			:: else -> skip;
			fi
			
			votedFor = serverId;
// Reset votes and vote for self
			for (i : 0 .. NUM_SERVERS - 1) {
				votesGranted[i] = 0;
			}
			votesGranted[serverId] = 1;
			printf("SERVER %d: Now candidate for term %d,voted for self\n",serverId,currentTerm[serverId]);
		fi
	}
:: // restart
	(!terminateSimulation && state[serverId] == follower) -> 
	atomic {
		stepCounter++;
		if
		:: (stepCounter > MAX_STEPS) -> 
			printf("SERVER %d: Maximum steps reached,terminating simulation\n",serverId);
			terminateSimulation = true;
		:: else -> 
			printf("SERVER %d: Restarting as follower\n",serverId);
		fi
	}
:: // request vote
	(!terminateSimulation && state[serverId] == candidate) -> 
	atomic {
		stepCounter++;
		if
		:: (stepCounter > MAX_STEPS) -> 
			printf("SERVER %d: Maximum steps reached,terminating simulation\n",serverId);
			terminateSimulation = true;
		:: else -> 
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
		fi
	}
:: // become leader
	(!terminateSimulation && state[serverId] == candidate) -> 
	atomic {
		stepCounter++;
		if
		:: (stepCounter > MAX_STEPS) -> 
			printf("SERVER %d: Maximum steps reached,terminating simulation\n",serverId);
			terminateSimulation = true;
		:: else -> 
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
		fi
	}
:: // handle incoming messages
	(!terminateSimulation && toNodes[serverId]?[msg]) -> 
	atomic {
		stepCounter++;
		if
		:: (stepCounter > MAX_STEPS) -> 
			printf("SERVER %d: Maximum steps reached,terminating simulation\n",serverId);
			terminateSimulation = true;
		:: else -> 
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
					
// Check if we've reached max term
					if
					:: (currentTerm[serverId] > MAX_TERM && !reachedMaxTerm) -> 
						reachedMaxTerm = true;
						maxTermServers++;
						printf("SERVER %d: Reached max term %d,maxTermServers = %d\n",serverId,currentTerm[serverId],maxTermServers);
						
// If all servers have reached max term, terminate simulation
						if
						:: (maxTermServers == NUM_SERVERS) -> 
							printf("All servers reached max term,terminating simulation\n");
							terminateSimulation = true;
						:: else -> skip;
						fi
					:: else -> skip;
					fi
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
					
// Check if we've reached max term
					if
					:: (currentTerm[serverId] > MAX_TERM && !reachedMaxTerm) -> 
						reachedMaxTerm = true;
						maxTermServers++;
						printf("SERVER %d: Reached max term %d,maxTermServers = %d\n",serverId,currentTerm[serverId],maxTermServers);
						
// If all servers have reached max term, terminate simulation
						if
						:: (maxTermServers == NUM_SERVERS) -> 
							printf("All servers reached max term,terminating simulation\n");
							terminateSimulation = true;
						:: else -> skip;
						fi
					:: else -> skip;
					fi
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
					
// Check if we've reached max term
					if
					:: (currentTerm[serverId] > MAX_TERM && !reachedMaxTerm) -> 
						reachedMaxTerm = true;
						maxTermServers++;
						printf("SERVER %d: Reached max term %d,maxTermServers = %d\n",serverId,currentTerm[serverId],maxTermServers);
						
// If all servers have reached max term, terminate simulation
						if
						:: (maxTermServers == NUM_SERVERS) -> 
							printf("All servers reached max term,terminating simulation\n");
							terminateSimulation = true;
						:: else -> skip;
						fi
					:: else -> skip;
					fi
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
					
// Check if we've reached max log
					if
					:: (commitIndex[serverId] >= MAX_LOG - 1 && logs[serverId].logs[MAX_LOG - 1] != 0) -> 
						printf("SERVER %d: Reached max log commitment\n",serverId);
// This could be another termination condition if needed
					:: else -> skip;
					fi
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
					
// Check if we've reached max term
					if
					:: (currentTerm[serverId] > MAX_TERM && !reachedMaxTerm) -> 
						reachedMaxTerm = true;
						maxTermServers++;
						printf("SERVER %d: Reached max term %d,maxTermServers = %d\n",serverId,currentTerm[serverId],maxTermServers);
						
// If all servers have reached max term, terminate simulation
						if
						:: (maxTermServers == NUM_SERVERS) -> 
							printf("All servers reached max term,terminating simulation\n");
							terminateSimulation = true;
						:: else -> skip;
						fi
					:: else -> skip;
					fi
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
						
// Check if we've reached max log
						if
						:: (commitIndex[serverId] >= MAX_LOG - 1 && logs[serverId].logs[MAX_LOG - 1] != 0) -> 
							printf("SERVER %d: Reached max log commitment\n",serverId);
// This could be another termination condition if needed
						:: else -> skip;
						fi
					:: else -> 
						printf("SERVER %d: Cannot advance commitIndex further\n",serverId);
						skip;
					fi
				:: else -> 
					printf("SERVER %d: AppendEntriesResponse not successful or not leader\n",serverId);
					skip;
				fi
			fi
		fi
	}
:: // append entries (leader sends to followers)
	(!terminateSimulation && state[serverId] == leader) -> 
	atomic {
		stepCounter++;
		if
		:: (stepCounter > MAX_STEPS) -> 
			printf("SERVER %d: Maximum steps reached,terminating simulation\n",serverId);
			terminateSimulation = true;
		:: else -> 
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
		fi
	}
:: // client request
	(!terminateSimulation && state[serverId] == leader && logs[serverId].logs[1] == 0) -> 
	atomic {
		stepCounter++;
		if
		:: (stepCounter > MAX_STEPS) -> 
			printf("SERVER %d: Maximum steps reached,terminating simulation\n",serverId);
			terminateSimulation = true;
		:: else -> 
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
		fi
	}
:: // termination condition
	(terminateSimulation) -> 
	printf("SERVER %d: Terminating due to global termination flag\n",serverId);
	break;
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
