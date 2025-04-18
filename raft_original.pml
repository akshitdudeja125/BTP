/* 
Author: Xingyu Xie
*/ 

#define MAX_TERM 3// 1 to 3
#define MAX_LOG 2// 0 to 1
#define MAX_SERVER// 1 to 3

#define NIL 10// a number that won't be used

// message channels
typedef AppendEntry {
	byte term,leaderCommit,index,prevLogTerm
};
typedef AppendEntryChannels {
chan ch[3] = [1] of { AppendEntry };
};
AppendEntryChannels appendEntryChannels[3];

typedef AppendEntryResponse {
	byte term;
	bool success
};
typedef AppendEntryResponseChannels {
chan ch[3] = [1] of { AppendEntryResponse };
};
AppendEntryResponseChannels appendEntryResponseChannels[3];

typedef RequestVote {
	byte term,lastLogIndex,lastLogTerm
};
typedef RequestVoteChannels {
chan ch[3] = [1] of { RequestVote };
};
RequestVoteChannels requestVoteChannels[3];

typedef RequestVoteResponse {
	byte term;
	bool voteGranted
};
typedef RequestVoteResponseChannels {
chan ch[3] = [1] of { RequestVoteResponse };
};
RequestVoteResponseChannels requestVoteResponse_ch[3];
//Explain above 2 lines with syntax
// This line creates an array of channels, each channel is of type RequestVote and there are N channels in total. The array is indexed by the serverId, so each server has its own channel to send RequestVote messages to other servers.

// The following variables are actually local,
// we move them globally, because SPIN doesn't support
// that represent LTL with local variables.
mtype:State = { leader,candidate,follower };
mtype:State state[3];
byte currentTerm[3];
typedef Logs {
	byte logs[2];
};
Logs logs[3];
byte commitIndex[3];

// If commitIndex reaches MAX_LOG, the whole system is nearly full.
// There's no need to run further.
proctype server(byte serverId) {
	printf("SERVER %d: Starting server process\n",serverId);
	state[serverId] = follower;
	byte votedFor = NIL;
	printf("SERVER %d: Initialized as follower,term = %d,votedFor = %d\n",serverId,currentTerm[serverId],votedFor);
	
// helpers
	byte i;
	
	bool votesGranted[3];
	RequestVote requestVote;
	byte lastLogTerm,lastLogIndex;
	RequestVoteResponse requestVoteResponse;
	bool logOk;
	
	AppendEntry appendEntry;
	AppendEntryResponse appendEntryResponse;
	
	do// main loop
:: // timeout
	(state[serverId] == candidate || state[serverId] == follower) -> 
	atomic {
		printf("SERVER %d: Timeout occurred,becoming candidate\n",serverId);
		state[serverId] = candidate;
		currentTerm[serverId] = currentTerm[serverId] + 1;
		
		end_max_term:   if// end if the limit is reached. Note that MAX_TERM is reachable here,which just shows the design intention
	:: (currentTerm[serverId] <= MAX_TERM) -> skip
	fi
	
	votedFor = serverId;
	votesGranted[0] = 0;votesGranted[1] = 0;votesGranted[2] = 0;
	votesGranted[serverId] = 1;
	printf("SERVER %d: Now candidate for term %d,voted for self\n",serverId,currentTerm[serverId]);
}
:: // restart
state[serverId] = follower -> 
printf("SERVER %d: Restarting as follower\n",serverId);
// When is this code segment executed?
// This code segment is executed when the server is in the candidate or follower state, and the server receives a message from the leader. In this case, the server will change its state to follower.
// Why is there no condition before the assignment?
// There is no condition before the assignment because the server will always change its state to follower when it receives a message from the leader.
:: // request vote
(state[serverId] == candidate) -> 
atomic {
	printf("SERVER %d: Sending RequestVote as candidate for term %d\n",serverId,currentTerm[serverId]);
	requestVote.term = currentTerm[serverId];
	if
	:: (logs[serverId].logs[0] == 0) -> 
		requestVote.lastLogTerm = 0;
		requestVote.lastLogIndex = 0;
		printf("SERVER %d: Last log empty,lastLogTerm = 0,lastLogIndex = 0\n",serverId);
	:: (logs[serverId].logs[0] != 0 && logs[serverId].logs[1] == 0) -> 
		requestVote.lastLogTerm = logs[serverId].logs[0];
		requestVote.lastLogIndex = 1;
		printf("SERVER %d: Last log at index 0,lastLogTerm = %d,lastLogIndex = 1\n",serverId,requestVote.lastLogTerm);
	:: (logs[serverId].logs[0] != 0 && logs[serverId].logs[1] != 0) -> 
		requestVote.lastLogTerm = logs[serverId].logs[1];
		requestVote.lastLogIndex = 2;
		printf("SERVER %d: Last log at index 1,lastLogTerm = %d,lastLogIndex = 2\n",serverId,requestVote.lastLogTerm);
	fi
	
	if
	:: (serverId != 0) -> 
		printf("SERVER %d: Sending RequestVote to server 0\n",serverId);
		end_rv_0:           requestVoteChannels[serverId].ch[0]!requestVote
	:: (serverId != 1) -> 
		printf("SERVER %d: Sending RequestVote to server 1\n",serverId);
		end_rv_1:           requestVoteChannels[serverId].ch[1]!requestVote
	:: (serverId != 2) -> 
		printf("SERVER %d: Sending RequestVote to server 2\n",serverId);
		end_rv_2:           requestVoteChannels[serverId].ch[2]!requestVote
	fi
}
:: // become leader
(state[serverId] == candidate && (votesGranted[0] + votesGranted[1] + votesGranted[2] > 1)) -> 
atomic {
	state[serverId] = leader;
	printf("SERVER %d: Becoming leader for term %d with %d votes\n",serverId,currentTerm[serverId],votesGranted[0] + votesGranted[1] + votesGranted[2]);
}

:: // handle RequestVote
(requestVoteChannels[0].ch[serverId]?[requestVote] || requestVoteChannels[1].ch[serverId]?[requestVote] || requestVoteChannels[2].ch[serverId]?[requestVote]) -> 
atomic {
// calculate the id of the sender
	if
	:: requestVoteChannels[0].ch[serverId]?requestVote -> i = 0
	:: requestVoteChannels[1].ch[serverId]?requestVote -> i = 1
	:: requestVoteChannels[2].ch[serverId]?requestVote -> i = 2
	fi
	assert(i != serverId);
	printf("SERVER %d: Received RequestVote from server %d for term %d\n",serverId,i,requestVote.term);
	
// update terms
	if
	:: (requestVote.term > currentTerm[serverId]) -> 
		printf("SERVER %d: Updating term from %d to %d and becoming follower\n",serverId,currentTerm[serverId],requestVote.term);
		currentTerm[serverId] = requestVote.term;
		state[serverId] = follower;
		votedFor = NIL
	:: (requestVote.term <= currentTerm[serverId]) -> 
		printf("SERVER %d: RequestVote term %d <= current term %d\n",serverId,requestVote.term,currentTerm[serverId]);
		skip
	fi
	
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
	
	logOk = requestVote.lastLogTerm > lastLogTerm || requestVote.lastLogTerm == lastLogTerm && requestVote.lastLogIndex >= lastLogIndex;
	requestVoteResponse.voteGranted = requestVote.term == currentTerm[serverId] && logOk && (votedFor == NIL || votedFor == i);
	
	requestVoteResponse.term = currentTerm[serverId];
	if
	:: requestVoteResponse.voteGranted -> 
		votedFor = i;
		printf("SERVER %d: Granting vote to server %d for term %d\n",serverId,i,currentTerm[serverId]);
	:: !requestVoteResponse.voteGranted -> 
		printf("SERVER %d: Rejecting vote for server %d,term = %d,logOk = %d,votedFor = %d\n",serverId,i,currentTerm[serverId],logOk,votedFor);
		skip
	fi
	end_requestVoteResponse:        requestVoteResponse_ch[serverId].ch[i]!requestVoteResponse
}
:: // handle RequestVoteResponse
(requestVoteResponse_ch[0].ch[serverId]?[requestVoteResponse] || requestVoteResponse_ch[1].ch[serverId]?[requestVoteResponse] || requestVoteResponse_ch[2].ch[serverId]?[requestVoteResponse]) -> 
atomic {
// calculate the id of the sender
	if
	:: requestVoteResponse_ch[0].ch[serverId]?requestVoteResponse -> i = 0
	:: requestVoteResponse_ch[1].ch[serverId]?requestVoteResponse -> i = 1
	:: requestVoteResponse_ch[2].ch[serverId]?requestVoteResponse -> i = 2
	fi
	assert(i != serverId);
	printf("SERVER %d: Received RequestVoteResponse from server %d,term = %d,granted = %d\n",serverId,i,requestVoteResponse.term,requestVoteResponse.voteGranted);
	
	if
	:: (requestVoteResponse.term > currentTerm[serverId]) -> // update terms
		printf("SERVER %d: Updating term from %d to %d and becoming follower\n",serverId,currentTerm[serverId],requestVoteResponse.term);
		currentTerm[serverId] = requestVoteResponse.term;
		state[serverId] = follower;
		votedFor = NIL
	:: (requestVoteResponse.term == currentTerm[serverId] && requestVoteResponse.voteGranted) -> 
		votesGranted[i] = 1;
		printf("SERVER %d: Vote granted by server %d,now have %d votes\n",serverId,i,votesGranted[0] + votesGranted[1] + votesGranted[2]);
	:: !(requestVoteResponse.term > currentTerm[serverId]) && !(requestVoteResponse.term == currentTerm[serverId] && requestVoteResponse.voteGranted) -> 
		printf("SERVER %d: Vote not granted by server %d\n",serverId,i);
		skip
	fi
}

:: // append entries
(state[serverId] == leader) -> 
atomic {
	if
	:: (serverId != 0) -> i = 0
	:: (serverId != 1) -> i = 1
	:: (serverId != 2) -> i = 2
	fi
	
	printf("SERVER %d: Leader sending AppendEntries to server %d\n",serverId,i);
	appendEntry.term = currentTerm[serverId];
	appendEntry.leaderCommit = commitIndex[serverId];
	if
	:: (logs[serverId].logs[0] != logs[i].logs[0]) -> 
		appendEntry.index = 0;
		printf("SERVER %d: Sending log at index 0,term = %d\n",serverId,appendEntry.term);
	:: (logs[serverId].logs[1] != 0 && logs[serverId].logs[0] == logs[i].logs[0] && logs[serverId].logs[1] != logs[i].logs[1]) -> 
		appendEntry.index = 1;
		appendEntry.prevLogTerm = logs[i].logs[0];
		printf("SERVER %d: Sending log at index 1,term = %d,prevLogTerm = %d\n",serverId,appendEntry.term,appendEntry.prevLogTerm);
	:: 
		appendEntry.index = NIL;
		printf("SERVER %d: No new logs to send to server %d\n",serverId,i);
	fi
	end_ae:         appendEntryChannels[serverId].ch[i]!appendEntry
}
:: // handle AppendEntry
(appendEntryChannels[0].ch[serverId]?[appendEntry] || appendEntryChannels[1].ch[serverId]?[appendEntry] || appendEntryChannels[2].ch[serverId]?[appendEntry]) -> 
atomic {
// calculate the id of the sender
	if
	:: appendEntryChannels[0].ch[serverId]?appendEntry -> i = 0
	:: appendEntryChannels[1].ch[serverId]?appendEntry -> i = 1
	:: appendEntryChannels[2].ch[serverId]?appendEntry -> i = 2
	fi
	assert(i != serverId);
	printf("SERVER %d: Received AppendEntries from server %d,term = %d,index = %d\n",serverId,i,appendEntry.term,appendEntry.index);
	
// update terms
	if
	:: (appendEntry.term > currentTerm[serverId]) -> 
		printf("SERVER %d: Updating term from %d to %d and becoming follower\n",serverId,currentTerm[serverId],appendEntry.term);
		currentTerm[serverId] = appendEntry.term;
		state[serverId] = follower;
		votedFor = NIL
	:: (appendEntry.term <= currentTerm[serverId]) -> 
		printf("SERVER %d: AppendEntries term %d <= current term %d\n",serverId,appendEntry.term,currentTerm[serverId]);
		skip
	fi
	assert(appendEntry.term <= currentTerm[serverId]);
	
// return to follower state
	if
	:: (appendEntry.term == currentTerm[serverId] && state[serverId] == candidate) -> 
		printf("SERVER %d: Stepping down from candidate to follower for term %d\n",serverId,currentTerm[serverId]);
		state[serverId] = follower;
		votedFor = NIL
	:: (appendEntry.term != currentTerm[serverId] || state[serverId] != candidate) -> 
		skip
	fi
	assert(!(appendEntry.term == currentTerm[serverId]) || (state[serverId] == follower));
	
	logOk = appendEntry.index == 0 || (appendEntry.index == 1 && appendEntry.prevLogTerm == logs[serverId].logs[0]);
	appendEntryResponse.term = currentTerm[serverId];
	if
	:: (appendEntry.term < currentTerm[i] || appendEntry.term == currentTerm[serverId] && state[serverId] == follower && !logOk) -> // reject request
		appendEntryResponse.success = 0;
		printf("SERVER %d: Rejecting AppendEntries,term = %d,logOk = %d\n",serverId,currentTerm[serverId],logOk);
		end_aer_rej:        appendEntryResponseChannels[serverId].ch[i]!appendEntryResponse
	:: (appendEntry.term == currentTerm[serverId] && state[serverId] == follower && logOk) -> 
		appendEntryResponse.success = 1;
		printf("SERVER %d: Accepting AppendEntries,updating log at index %d to term %d\n",serverId,appendEntry.index,appendEntry.term);
		
		logs[serverId].logs[appendEntry.index] = appendEntry.term;
		
// Direct assignment is admissible here.
// Because our MAX_LOG is small enough (2).
// leaderCommit is either 0 or 1.
// If leaderCommit is 0, commitIndex of the server must be 0.
// If leaderCommit is 1, commitIndex of the server can be 0.
		commitIndex[serverId] = appendEntry.leaderCommit;
		printf("SERVER %d: Updated commitIndex to %d\n",serverId,commitIndex[serverId]);
		
		end_aer_acc:        appendEntryResponseChannels[serverId].ch[i]!appendEntryResponse
	fi
}


:: // handle AppendEntryResponse
(appendEntryResponseChannels[0].ch[serverId]?[appendEntryResponse] || appendEntryResponseChannels[1].ch[serverId]?[appendEntryResponse] || appendEntryResponseChannels[2].ch[serverId]?[appendEntryResponse]) -> 
atomic {
// calculate the id of the sender
	if
	:: appendEntryResponseChannels[0].ch[serverId]?appendEntryResponse -> i = 0
	:: appendEntryResponseChannels[1].ch[serverId]?appendEntryResponse -> i = 1
	:: appendEntryResponseChannels[2].ch[serverId]?appendEntryResponse -> i = 2
	fi
	assert(i != serverId);
	printf("SERVER %d: Received AppendEntriesResponse from server %d,term = %d,success = %d\n",serverId,i,appendEntryResponse.term,appendEntryResponse.success);
	
	if
	:: (appendEntryResponse.term > currentTerm[serverId]) -> // update terms
		printf("SERVER %d: Updating term from %d to %d and becoming follower\n",serverId,currentTerm[serverId],appendEntryResponse.term);
		currentTerm[serverId] = appendEntryResponse.term;
		state[serverId] = follower;
		votedFor = NIL
	:: (appendEntryResponse.term < currentTerm[serverId]) -> 
		printf("SERVER %d: Ignoring AppendEntriesResponse with lower term %d\n",serverId,appendEntryResponse.term);
		skip
	:: (appendEntryResponse.term == currentTerm[serverId] && appendEntryResponse.success && state[serverId] == leader) -> 
// advance commit index
// as we only have 3 servers
// one success AppendEntry means committed
		printf("SERVER %d: Successful AppendEntries,considering commit advancement\n",serverId);
		
		end_commitIndex:    if// end if commitIndex reaches the limit
	:: (commitIndex[serverId] == 0 && logs[i].logs[0] == logs[serverId].logs[0]) -> 
		commitIndex[serverId] = 1;
		printf("SERVER %d: Advanced commitIndex to 1\n",serverId);
// this is a little tricky
// we do NOT skip if commitIndex[serverId] should be 2
	:: (commitIndex[serverId] == 1 && !(logs[serverId].logs[1] != 0 && logs[i].logs[1] == logs[serverId].logs[1])) -> 
		printf("SERVER %d: Cannot advance commitIndex further\n",serverId);
		skip;// actually this case won't be reached
	fi
:: (appendEntryResponse.term == currentTerm[serverId] && !(appendEntryResponse.success && state[serverId] == leader)) -> 
	printf("SERVER %d: AppendEntriesResponse not successful or not leader\n",serverId);
	skip
fi
}
:: // client request
(state[serverId] == leader && logs[serverId].logs[1] == 0) -> 
atomic {
if
:: logs[serverId].logs[0] == 0 -> 
	logs[serverId].logs[0] = currentTerm[serverId];
	printf("SERVER %d: Client request,adding entry at index 0 with term %d\n",serverId,currentTerm[serverId]);
:: logs[serverId].logs[0] != 0 -> 
	logs[serverId].logs[1] = currentTerm[serverId];
	printf("SERVER %d: Client request,adding entry at index 1 with term %d\n",serverId,currentTerm[serverId]);
fi
}
od
};

init {
printf("INIT: Starting Raft simulation with 3 servers\n");
run server(0);
run server(1);
run server(2);
printf("INIT: All servers started\n");
}

ltl electionSafety {
always!(
(state[0] == leader && state[1] == leader && currentTerm[0] == currentTerm[1])
|| (state[0] == leader && state[2] == leader && currentTerm[0] == currentTerm[2])
|| (state[1] == leader && state[2] == leader && currentTerm[1] == currentTerm[2])
)
}

// // for scalability of SPIN, we split the huge complete formula into small formulas
// ltl leaderAppendOnly00 {
// always (
// state[0] == leader implies (
// (logs[0].logs[0] == 0)
// || ((logs[0].logs[0] == 1) weakuntil (state[0] != leader))
// || ((logs[0].logs[0] == 2) weakuntil (state[0] != leader))
// || ((logs[0].logs[0] == 3) weakuntil (state[0] != leader))
// )
// )
// }
// ltl leaderAppendOnly01 {
// always (
// state[0] == leader implies (
// (logs[0].logs[1] == 0)
// || ((logs[0].logs[1] == 1) weakuntil (state[0] != leader))
// || ((logs[0].logs[1] == 2) weakuntil (state[0] != leader))
// || ((logs[0].logs[1] == 3) weakuntil (state[0] != leader))
// )
// )
// }

// // weak until m	eans that the condition must be satisfied at the end of the time interval,but it may not be satisfied at the beginning of the time interval.

// ltl leaderAppendOnly10 {
// always (
// state[1] == leader implies (
// (logs[1].logs[0] == 0)
// || ((logs[1].logs[0] == 1) weakuntil (state[1] != leader))
// || ((logs[1].logs[0] == 2) weakuntil (state[1] != leader))
// || ((logs[1].logs[0] == 3) weakuntil (state[1] != leader))
// )
// )
// }
// ltl leaderAppendOnly11 {
// always (
// state[1] == leader implies (
// (logs[1].logs[1] == 0)
// || ((logs[1].logs[1] == 1) weakuntil (state[1] != leader))
// || ((logs[1].logs[1] == 2) weakuntil (state[1] != leader))
// || ((logs[1].logs[1] == 3) weakuntil (state[1] != leader))
// )
// )
// }
// ltl leaderAppendOnly20 {
// always (
// state[2] == leader implies (
// (logs[2].logs[0] == 0)
// || ((logs[2].logs[0] == 1) weakuntil (state[2] != leader))
// || ((logs[2].logs[0] == 2) weakuntil (state[2] != leader))
// || ((logs[2].logs[0] == 3) weakuntil (state[2] != leader))
// )
// )
// }
// ltl leaderAppendOnly21 {
// always (
// state[2] == leader implies (
// (logs[2].logs[1] == 0)
// || ((logs[2].logs[1] == 1) weakuntil (state[2] != leader))
// || ((logs[2].logs[1] == 2) weakuntil (state[2] != leader))
// || ((logs[2].logs[1] == 3) weakuntil (state[2] != leader))
// )
// )
// }

// // append only meaNS that the logs of a server can only be appended,but not modified or deleted.

// ltl logMatching {
// always (
// ((logs[0].logs[1] != 0 && logs[0].logs[1] == logs[1].logs[1])
// implies (logs[0].logs[0] == logs[1].logs[0]))
// && ((logs[0].logs[1] != 0 && logs[0].logs[1] == logs[2].logs[1])
// implies (logs[0].logs[0] == logs[2].logs[0]))
// && ((logs[1].logs[1] != 0 && logs[1].logs[1] == logs[2].logs[1])
// implies (logs[1].logs[0] == logs[2].logs[0]))
// )
// }

// log matching means that the logs of different servers should be consistent.

// // 这里我们已知被 commit 的 entry 就不会再改了，这需要基于这样一个观察：
// // 每一个 server 在将来都可能成为 leader
// ltl leaderCompleteness {
// always (
// (
// (commitIndex[0] == 1) implies
// always (
// ((state[1] == leader) implies (logs[0].logs[0] == logs[1].logs[0]))
// && ((state[2] == leader) implies (logs[0].logs[0] == logs[2].logs[0]))
// )
// ) && (
// (commitIndex[1] == 1) implies
// always (
// ((state[0] == leader) implies (logs[1].logs[0] == logs[0].logs[0]))
// && ((state[2] == leader) implies (logs[1].logs[0] == logs[2].logs[0]))
// )
// ) && (
// (commitIndex[2] == 1) implies
// always (
// ((state[0] == leader) implies (logs[2].logs[0] == logs[0].logs[0]))
// && ((state[1] == leader) implies (logs[2].logs[0] == logs[1].logs[0]))
// )
// )
// }

// // leader completeness means that the logs of different servers should be consistent.
// // in terms of commit index  it means
// // if a log is committed,then the log should be the same on all servers.


// ltl stateMachineSafety {
// always (
// ((commitIndex[0] == 1 && commitIndex[1] == 1) implies (logs[0].logs[0] == logs[1].logs[0]))
// && ((commitIndex[0] == 1 && commitIndex[2] == 1) implies (logs[0].logs[0] == logs[2].logs[0]))
// && ((commitIndex[1] == 1 && commitIndex[2] == 1) implies (logs[1].logs[0] == logs[2].logs[0]))
// )
// }
