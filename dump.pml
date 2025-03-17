#define MSG_CAPACITY 10
#define MAX_TERM 3
#define MAX_LOG 2
#define NUM_SERVERS 3
#define N 3
#define NONE 0
#define TIMEOUT_BOUND 5

mtype:State = { FOLLOWER,CANDIDATE,LEADER,CRASHED };
mtype:State state[NUM_SERVERS];

typedef Logs {
	byte log[2];
}

typedef AppendEntry {
	byte term,leaderCommit,index,prevLogTerm;
}

typedef RequestVote {
	byte term,lastLogIndex,lastLogTerm;
}

typedef AppendEntryResponse {
	byte term;
	bool success;
}

typedef RequestVoteResponse {
	byte term;
	bool voteGranted;
	int leaderId;
}

typedef HeartbeatMessage {
	int term;
	int leaderId;
}

mtype:MessageType = { HEARTBEAT,APPEND_ENTRY,VOTE_REQUEST,VOTE_RESPONSE };

typedef Message {
	int senderID;
	int receiverID;
	mtype messageType;
	AppendEntry appendEntryMsg;
	AppendEntryResponse appendEntryResponseMsg;
	RequestVote requestVoteMsg;
	RequestVoteResponse requestVoteResponseMsg;
	HeartbeatMessage heartbeatMsg;
};


Logs logs[NUM_SERVERS];

int currentTerm[NUM_SERVERS];
int votesReceived[NUM_SERVERS];
int votedFor[NUM_SERVERS];// - 1 means not voted
int leaderID = - 1;
bool isActive[NUM_SERVERS];
chan toNodes[NUM_SERVERS] = [MSG_CAPACITY] of { Message };

inline sleep(time) {
	int i;
	d_step {
		i = 0;
		do
		:: (i < time) -> i++
		:: (i >= time) -> break
		od;
	}
}

inline sendHeartbeats(sid) {
	int j = 0;
	do
	:: j < NUM_SERVERS -> {
			if
			:: j != sid -> {
					Message heartbeatMsg;
					heartbeatMsg.senderID = sid;
					heartbeatMsg.receiverID = j;
					heartbeatMsg.messageType = HEARTBEAT;
					heartbeatMsg.heartbeatMsg.term = currentTerm[sid];
					heartbeatMsg.heartbeatMsg.leaderId = sid;
					toNodes[j]!heartbeatMsg;
					printf("Server %d sent heartbeat to Server %d in term %d\n",sid,j,currentTerm[sid]);
				}
			:: true -> skip;
			fi;
			j++;
		}
	:: j >= NUM_SERVERS -> break;
	od;
}

inline sendVoteRequests(sid) {
	int j = 0;
	do
	:: j < NUM_SERVERS -> {
			if
			:: j != sid -> {
					Message voteRequestMsg;
					voteRequestMsg.senderID = sid;
					voteRequestMsg.receiverID = j;
					voteRequestMsg.messageType = VOTE_REQUEST;
					voteRequestMsg.requestVoteMsg.term = currentTerm[sid];
					voteRequestMsg.requestVoteMsg.lastLogIndex = 0;
					voteRequestMsg.requestVoteMsg.lastLogTerm = 0;
					toNodes[j]!voteRequestMsg;
					printf("Server %d sent vote request to Server %d in term %d\n",sid,j,currentTerm[sid]);
				}
			:: true -> skip;
			fi;
			j++;
		}
	:: j >= NUM_SERVERS -> break;
	od;
}

inline hasMajority(sid) {
	votesReceived[sid] >= ((NUM_SERVERS / 2) + 1);
}

inline resetVotes(sid) {
	votesReceived[sid] = 0;
}

proctype Node(int sid) {
	printf("Node %d started\n",sid);
	
	Message receivedMsg;
	int randomTimeout;
	
	atomic {
		isActive[sid] = true;
		state[sid] = FOLLOWER;
		currentTerm[sid] = 1;// Start at term 1
		votedFor[sid] = - 1;
		randomTimeout = sid + 1;// Different timeout for each node
		
		follower_state:
		state[sid] = FOLLOWER;
		leaderID = - 1;
		resetVotes(sid);
	}
	do
	:: 
		(state[sid] == FOLLOWER) -> 
		atomic{
			printf("Server %d is in follower state\n",sid);
			
			do
			:: true -> {
					sleep(randomTimeout);
					currentTerm[sid] = currentTerm[sid] + 1;
					votedFor[sid] = sid;
					votesReceived[sid] = 1;
					printf("Server %d timed out,incrementing term to %d and transitioning to CANDIDATE\n",sid,currentTerm[sid]);
					state[sid] = CANDIDATE;
					sendVoteRequests(sid);
					break;
				}
			:: toNodes[sid]?receivedMsg -> {
					if
					:: receivedMsg.messageType == HEARTBEAT -> {
							printf("Server %d (Follower) received heartbeat from Server %d in term %d\n",sid,receivedMsg.senderID,receivedMsg.heartbeatMsg.term);
							if
							:: receivedMsg.heartbeatMsg.term >= currentTerm[sid] -> {
									currentTerm[sid] = receivedMsg.heartbeatMsg.term;
									votedFor[sid] = - 1;
									leaderID = receivedMsg.heartbeatMsg.leaderId;
								}
							:: true -> skip;
							fi;
						}
					:: receivedMsg.messageType == VOTE_REQUEST -> {
							printf("Server %d (Follower) received vote request from Server %d in term %d\n",sid,receivedMsg.senderID,receivedMsg.requestVoteMsg.term);
							if
							:: receivedMsg.requestVoteMsg.term < currentTerm[sid] -> {
									Message voteResponseMsg;
									voteResponseMsg.senderID = sid;
									voteResponseMsg.receiverID = receivedMsg.senderID;
									voteResponseMsg.messageType = VOTE_RESPONSE;
									voteResponseMsg.requestVoteResponseMsg.term = currentTerm[sid];
									voteResponseMsg.requestVoteResponseMsg.voteGranted = false;
									if
									:: leaderID != - 1 -> {
											voteResponseMsg.requestVoteResponseMsg.leaderId = leaderID;
										}
									:: else -> skip;
									fi;
									toNodes[receivedMsg.senderID]!voteResponseMsg;
								}
							:: receivedMsg.requestVoteMsg.term > currentTerm[sid] -> {
									currentTerm[sid] = receivedMsg.requestVoteMsg.term;
									votedFor[sid] = - 1;
									leaderID = - 1;
									
// Vote for the requester
									votedFor[sid] = receivedMsg.senderID;
									printf("Server %d (Follower) voted for Server %d in term %d\n",sid,receivedMsg.senderID,currentTerm[sid]);
									
									Message voteResponseMsg;
									voteResponseMsg.senderID = sid;
									voteResponseMsg.receiverID = receivedMsg.senderID;
									voteResponseMsg.messageType = VOTE_RESPONSE;
									voteResponseMsg.requestVoteResponseMsg.term = currentTerm[sid];
									voteResponseMsg.requestVoteResponseMsg.voteGranted = true;
									toNodes[receivedMsg.senderID]!voteResponseMsg;
								}
							:: receivedMsg.requestVoteMsg.term == currentTerm[sid] && votedFor[sid] == - 1 -> {
									votedFor[sid] = receivedMsg.senderID;
									printf("Server %d (Follower) voted for Server %d in term %d\n",sid,receivedMsg.senderID,currentTerm[sid]);
									
									Message voteResponseMsg;
									voteResponseMsg.senderID = sid;
									voteResponseMsg.receiverID = receivedMsg.senderID;
									voteResponseMsg.messageType = VOTE_RESPONSE;
									voteResponseMsg.requestVoteResponseMsg.term = currentTerm[sid];
									voteResponseMsg.requestVoteResponseMsg.voteGranted = true;
									toNodes[receivedMsg.senderID]!voteResponseMsg;
								}
							:: receivedMsg.requestVoteMsg.term == currentTerm[sid] && votedFor[sid] != - 1 -> {
									printf("Server %d (Follower) denied vote to Server %d in term %d (already voted for %d)\n",sid,receivedMsg.senderID,currentTerm[sid],votedFor[sid]);
									
									Message voteResponseMsg;
									voteResponseMsg.senderID = sid;
									voteResponseMsg.receiverID = receivedMsg.senderID;
									voteResponseMsg.messageType = VOTE_RESPONSE;
									voteResponseMsg.requestVoteResponseMsg.term = currentTerm[sid];
									voteResponseMsg.requestVoteResponseMsg.voteGranted = false;
									toNodes[receivedMsg.senderID]!voteResponseMsg;
								}
							fi;
						}
					:: else -> {
							printf("Server %d (Follower) received unknown message of type %d\n",
							sid,receivedMsg.messageType);
						}
					fi;
				}
			od;
		}
	:: 
		(state[sid] == CANDIDATE) -> 
		atomic{
			printf("Server %d is in candidate state\n",sid);
			do
			:: true -> {
					sleep(randomTimeout);
					currentTerm[sid] = currentTerm[sid] + 1;
					votedFor[sid] = sid;
					votesReceived[sid] = 1;
					printf("Server %d timed out,incrementing term to %d and transitioning to CANDIDATE\n",sid,currentTerm[sid]);
					state[sid] = CANDIDATE;
					sendVoteRequests(sid);
					break;
				}
			:: toNodes[sid]?receivedMsg -> {
					if
					:: receivedMsg.messageType == HEARTBEAT -> {
							printf("Server %d (Candidate) received heartbeat from Server %d in term %d\n",sid,receivedMsg.senderID,receivedMsg.heartbeatMsg.term);
							if
							:: receivedMsg.heartbeatMsg.term >= currentTerm[sid] -> {
									currentTerm[sid] = receivedMsg.heartbeatMsg.term;
									votedFor[sid] = - 1;
									leaderID = receivedMsg.heartbeatMsg.leaderId;
									state[sid] = FOLLOWER;
									votesReceived[sid] = 0;
									break;
								}
							:: else -> skip;
							fi;
						}
					:: receivedMsg.messageType == VOTE_REQUEST -> {
							printf("Server %d (Candidate) received vote request from Server %d in term %d\n",sid,receivedMsg.senderID,receivedMsg.requestVoteMsg.term);
							if
							:: receivedMsg.requestVoteMsg.term > currentTerm[sid] -> {
									currentTerm[sid] = receivedMsg.requestVoteMsg.term;
									votedFor[sid] = receivedMsg.senderID;
									leaderID = - 1;
									state[sid] = FOLLOWER;
									votesReceived[sid] = 0;
									
									Message voteResponseMsg;
									voteResponseMsg.senderID = sid;
									voteResponseMsg.receiverID = receivedMsg.senderID;
									voteResponseMsg.messageType = VOTE_RESPONSE;
									voteResponseMsg.requestVoteResponseMsg.term = currentTerm[sid];
									voteResponseMsg.requestVoteResponseMsg.voteGranted = true;
									toNodes[receivedMsg.senderID]!voteResponseMsg;
									break;
								}
							:: else -> {
// For any other case, reject the vote
									Message voteResponseMsg;
									voteResponseMsg.senderID = sid;
									voteResponseMsg.receiverID = receivedMsg.senderID;
									voteResponseMsg.messageType = VOTE_RESPONSE;
									voteResponseMsg.requestVoteResponseMsg.term = currentTerm[sid];
									voteResponseMsg.requestVoteResponseMsg.voteGranted = false;
									toNodes[receivedMsg.senderID]!voteResponseMsg;
								}
							fi;
						}
					:: receivedMsg.messageType == VOTE_RESPONSE -> {
							printf("Server %d (Candidate) received vote response from Server %d in term %d\n",sid,receivedMsg.senderID,receivedMsg.requestVoteResponseMsg.term);
							if
							:: receivedMsg.requestVoteResponseMsg.term > currentTerm[sid] -> {
									currentTerm[sid] = receivedMsg.requestVoteResponseMsg.term;
									votedFor[sid] = - 1;
									state[sid] = FOLLOWER;
									votesReceived[sid] = 0;
									break;
								}
							:: receivedMsg.requestVoteResponseMsg.term == currentTerm[sid] && receivedMsg.requestVoteResponseMsg.voteGranted -> {
									votesReceived[sid] = votesReceived[sid] + 1;
									printf("Server %d (Candidate) received vote from Server %d,now has %d votes\n",
									sid,receivedMsg.senderID,votesReceived[sid]);
									
									if
									:: hasMajority(sid) -> {
											printf("Server %d (Candidate) has majority of votes,transitioning to LEADER\n",sid);
											state[sid] = LEADER;
											leaderID = sid;
											sendHeartbeats(sid);
											break;
										}
									:: else -> skip;
									fi;
								}
							:: else -> skip;
							fi;
						}
					:: else -> {
							printf("Server %d (Candidate) received unknown message of type %d\n",
							sid,receivedMsg.messageType);
						}
					fi;
				}
			od;
		}
	:: 
		(state[sid] == LEADER) -> 
		atomic{
			printf("Server %d is in leader state\n",sid);
			do
			:: true -> {
					sendHeartbeats(sid);
					sleep(randomTimeout);
				}
			:: toNodes[sid]?receivedMsg -> {
					if
					:: receivedMsg.messageType == HEARTBEAT -> {
							printf("Server %d (Leader) received heartbeat from Server %d in term %d\n",sid,receivedMsg.senderID,receivedMsg.heartbeatMsg.term);
							if
							:: receivedMsg.heartbeatMsg.term > currentTerm[sid] -> {
									currentTerm[sid] = receivedMsg.heartbeatMsg.term;
									votedFor[sid] = - 1;
									leaderID = receivedMsg.heartbeatMsg.leaderId;
									state[sid] = FOLLOWER;
									votesReceived[sid] = 0;
									break;
								}
							:: else -> skip;
							fi;
						}
					:: receivedMsg.messageType == VOTE_REQUEST -> {
							printf("Server %d (Leader) received vote request from Server %d in term %d\n",sid,receivedMsg.senderID,receivedMsg.requestVoteMsg.term);
							if
							:: receivedMsg.requestVoteMsg.term > currentTerm[sid] -> {
									currentTerm[sid] = receivedMsg.requestVoteMsg.term;
									votedFor[sid] = receivedMsg.senderID;
									state[sid] = FOLLOWER;
									votesReceived[sid] = 0;
									
									Message voteResponseMsg;
									voteResponseMsg.senderID = sid;
									voteResponseMsg.receiverID = receivedMsg.senderID;
									voteResponseMsg.messageType = VOTE_RESPONSE;
									voteResponseMsg.requestVoteResponseMsg.term = currentTerm[sid];
									voteResponseMsg.requestVoteResponseMsg.voteGranted = true;
									toNodes[receivedMsg.senderID]!voteResponseMsg;
									break;
								}
							:: else -> {
// For any other case, reject the vote
									Message voteResponseMsg;
									voteResponseMsg.senderID = sid;
									voteResponseMsg.receiverID = receivedMsg.senderID;
									voteResponseMsg.messageType = VOTE_RESPONSE;
									voteResponseMsg.requestVoteResponseMsg.term = currentTerm[sid];
									voteResponseMsg.requestVoteResponseMsg.voteGranted = false;
									voteResponseMsg.requestVoteResponseMsg.leaderId = sid;
									toNodes[receivedMsg.senderID]!voteResponseMsg;
								}
							fi;
						}
					:: else -> {
							printf("Server %d (Leader) received unknown message of type %d\n",
							sid,receivedMsg.messageType);
						}
					fi;
				}
			od;
		}
	od;
}

init {
	atomic {
		int i;
		for (i : 0 .. (NUM_SERVERS - 1)) {
			currentTerm[i] = 0;
			votesReceived[i] = 0;
			votedFor[i] = - 1;
			isActive[i] = true;
			state[i] = FOLLOWER;
		}
		
		for (i : 0 .. (NUM_SERVERS - 1)) {
			run Node(i);
		}
	}
}