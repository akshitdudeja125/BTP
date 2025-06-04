#define MAX_TERM 3// 1 to 3
#define MAX_LOG 2// 0 to 1
#define NUM_SERVERS 3// Number of servers in the system
#define MSG_CAPACITY 10// Capacity of message channels
#define MAX_DEPTH 500// Maximum search depth to prevent state space explosion

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
	byte steps = 0;// Step counter to limit path depth
	
	do// main loop
:: // Check if we've exceeded our maximum depth
	(steps >= MAX_DEPTH) -> break;// Exit the loop if we reach max depth
:: // crash
	(state[serverId] != crashed && steps < MAX_DEPTH) -> 
	atomic {
		steps++;// Increment step counter
		printf("SERVER %d: Crashing from state %e\n",serverId,state[serverId]);
		state[serverId] = crashed;
// Reset votes when crashing
		for (i : 0 .. NUM_SERVERS - 1) {
			votesGranted[i] = 0;
		}
		votedFor = NIL;
	}
:: // resume / recover
	(state[serverId] == crashed && steps < MAX_DEPTH) -> 
	atomic {
		steps++;// Increment step counter
		printf("SERVER %d: Recovering from crash,becoming follower\n",serverId);
		state[serverId] = follower;
// Don't increment term on recovery, just rejoin with current term
		votedFor = NIL;
	}
:: // timeout
	(state[serverId] == candidate || state[serverId] == follower) && steps < MAX_DEPTH -> 
	atomic {
		steps++;// Increment step counter
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
			printf("SERVER %d: Last log at index 0,lastLogTerm = %d,lastLogIndex = 1\n",serverId,logs[serverId].logs[0]);
		:: (logs[serverId].logs[0] != 0 && logs[serverId].logs[1] != 0) -> 
			outMsg.requestVote.lastLogTerm = logs[serverId].logs[1];
			outMsg.requestVote.lastLogIndex = 2;
			printf("SERVER %d: Last log at index 1,lastLogTerm = %d,lastLogIndex = 2\n",serverId,logs[serverId].logs[1]);
		fi;
	}
fi;
}

// LTL properties can be updated to use NUM_SERVERS and loops if needed
ltl electionSafety {
[]!(
(state[0] == leader && state[1] == leader && currentTerm[0] == currentTerm[1])
|| (state[0] == leader && state[2] == leader && currentTerm[0] == currentTerm[2])
|| (state[1] == leader && state[2] == leader && currentTerm[1] == currentTerm[2])
)
}

// ... existing commented LTL properties ...