#define MAX_TERM 10// 1 to 3
#define MAX_LOG 2// 0 to 1
#define NUM_SERVERS 20// Number of servers in the system
#define MSG_CAPACITY 10// Capacity of message channels

#define NIL 10// a number that won't be used

// Message types
mtype:MessageType = { APPEND_ENTRY,APPEND_ENTRY_RESPONSE,REQUEST_VOTE,REQUEST_VOTE_RESPONSE };

// Variables for safety properties
byte leaders = 0;// Number of leaders in the system
bool isLeader = 0;// Indicates whether there is a leader in the system
bool leader[NUM_SERVERS];// Indicates which nodes are leaders
byte connect[NUM_SERVERS];// Number of network connections for each node
bool termination_flag = false;// Flag to indicate when MAX_TERM is reached

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
:: // terminate if MAX_TERM is reached
	(currentTerm[serverId] >= MAX_TERM || termination_flag) -> 
	atomic {
		printf("SERVER %d: MAX_TERM reached or termination flag set,terminating\n",serverId);
		termination_flag = true;
		break;
	}
:: // crash
	(state[serverId] != CRASHED && !termination_flag) -> 
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
	(state[serverId] == CRASHED && !termination_flag) -> 
	atomic {
		printf("SERVER %d: Recovering from crash,becoming follower\n",serverId);
		state[serverId] = FOLLOWER;
// Don't increment term on recovery, just rejoin with current term
		votedFor = NIL;
		time_out[serverId] = 1;// Reset timeout when recovering
		connect[serverId] = NUM_SERVERS - 1;// Restore connections on recovery
	}
:: // timer ticks down (timeout count down)
	(state[serverId] != CRASHED && state[serverId] != LEADER && time_out[serverId] > 0 && !termination_flag) -> 
	atomic {
		time_out[serverId] = time_out[serverId] - 1;
		printf("SERVER %d: Timer tick,time_out now %d\n",serverId,time_out[serverId]);
	}
:: // timeout occurs (time_out reaches 0)
	(state[serverId] == FOLLOWER && time_out[serverId] == 0 && !termination_flag) -> 
	atomic {
		printf("SERVER %d: Timeout occurred (time_out = 0),becoming candidate\n",serverId);
		state[serverId] = CANDIDATE;
// Check if next term would exceed MAX_TERM
		if (currentTerm[serverId] + 1 >= MAX_TERM) {
				printf("SERVER %d: MAX_TERM would be exceeded,setting termination flag\n",serverId);
				termination_flag = true;
				break;
			}
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
		(state[serverId] == CANDIDATE && time_out[serverId] == 0 && !termination_flag) -> 
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
		(state[serverId] == FOLLOWER && !termination_flag) -> 
		atomic {
			printf("SERVER %d: Restarting as follower,resetting timeout\n",serverId);
			time_out[serverId] = 1;// Reset timeout on restart
		}
	:: // handle incoming messages
		(toNodes[serverId]?[msg] && state[serverId] != CRASHED && !termination_flag) -> // Only process messages if not crashed
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
// Check if received term exceeds MAX_TERM
					if (msg.requestVote.term >= MAX_TERM) {
							printf("SERVER %d: Received term %d >= MAX_TERM,setting termination flag\n",
							serverId,msg.requestVote.term);
							termination_flag = true;
							break;
						}
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
						end_vote_granted: skip;// Valid end state when vote is granted
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
						end_received_vote: skip;// Valid end state when receiving a vote
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
							end_log_updated: skip;// Valid end state when log is updated
						:: else -> skip;
						fi
						
// Update commit index
						commitIndex[serverId] = msg.appendEntry.leaderCommit;
						printf("SERVER %d: Updated commitIndex to %d\n",serverId,commitIndex[serverId]);
						end_committed: skip;// Valid end state when commit index is updated
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
							end_leader_committed: skip;// Valid end state when leader advances commit index
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
			(state[serverId] == LEADER && !termination_flag) -> 
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
				
// Valid end state after leader sends heartbeats to all followers
				end_heartbeat_sent: skip;
			}
		:: // client request
			(state[serverId] == LEADER && logs[serverId].logs[1] == 0 && !termination_flag) -> 
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
				
// Valid end state after client request handling
				end_client_request: skip;
			}
		:: // stable leader with committed entries
			(state[serverId] == LEADER && commitIndex[serverId] > 0 && !termination_flag) -> 
			atomic {
				printf("SERVER %d: Stable leader with committed entries\n",serverId);
				end_stable_leader: skip;// Valid end state for a stable leader
			}
		:: // stable follower with updated logs
			(state[serverId] == FOLLOWER && commitIndex[serverId] > 0 && !termination_flag) -> 
			atomic {
				printf("SERVER %d: Stable follower with committed entries\n",serverId);
				end_stable_follower: skip;// Valid end state for a stable follower
			}
		:: // candidate with majority votes
			(state[serverId] == CANDIDATE && !termination_flag) -> 
			atomic {
// Count votes
				voteCount = 0;
				for (i : 0 .. NUM_SERVERS - 1) {
					if
					:: votesGranted[i] -> voteCount++;
					:: else -> skip;
					fi
				}
				
				if
				:: (voteCount > (NUM_SERVERS / 2)) -> 
					printf("SERVER %d: Candidate with majority votes (%d)\n",serverId,voteCount);
					end_majority_votes: skip;// Valid end state when candidate has majority votes
				:: else -> skip;
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
		
// Valid end state for init process
		end_init: skip;
	}
	
// Add a new termination property - verifies the system will eventually terminate
ltl willTerminate { <> termination_flag }
	