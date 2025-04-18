	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* CLAIM uniqueness */
;
		
	case 3: // STATE 1
		goto R999;

	case 4: // STATE 10
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* CLAIM electionFairness */
;
		;
		;
		;
		;
		;
		;
		;
		;
		;
		;
		;
		
	case 11: // STATE 27
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* CLAIM fairness */
;
		;
		;
		;
		
	case 14: // STATE 13
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* CLAIM liveness */
;
		;
		
	case 16: // STATE 6
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC :init: */

	case 17: // STATE 2
		;
		((P1 *)_this)->i = trpt->bup.oval;
		;
		goto R999;

	case 18: // STATE 3
		;
		((P1 *)_this)->i = trpt->bup.oval;
		;
		goto R999;

	case 19: // STATE 6
		;
		connect[ Index(((P1 *)_this)->i, 3) ] = trpt->bup.ovals[1];
		leader[ Index(((P1 *)_this)->i, 3) ] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 20: // STATE 7
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 21: // STATE 8
		;
		((P1 *)_this)->i = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 23: // STATE 16
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC server */
;
		;
		
	case 25: // STATE 2
		;
		now.state[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.oval;
		;
		goto R999;

	case 26: // STATE 3
		;
		((P0 *)_this)->votedFor = trpt->bup.oval;
		;
		goto R999;

	case 27: // STATE 4
		;
		now.time_out[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.oval;
		;
		goto R999;

	case 28: // STATE 5
		;
		leader[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.oval;
		;
		goto R999;

	case 29: // STATE 6
		;
		connect[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.oval;
		;
		goto R999;

	case 30: // STATE 7
		;
		now.consecutiveCrashes[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 32: // STATE 16
		;
		((P0 *)_this)->voteCount = trpt->bup.ovals[5];
		;
		;
		((P0 *)_this)->logOk = trpt->bup.ovals[4];
		((P0 *)_this)->lastLogIndex = trpt->bup.ovals[3];
		((P0 *)_this)->lastLogTerm = trpt->bup.ovals[2];
		((P0 *)_this)->votesGranted[0] = trpt->bup.ovals[1];
		((P0 *)_this)->i = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 6);
		goto R999;
;
		;
		
	case 34: // STATE 18
		;
		now.consecutiveCrashes[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.oval;
		;
		goto R999;

	case 35: // STATE 30
		;
		((P0 *)_this)->i = trpt->bup.ovals[5];
		connect[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.ovals[4];
		now.state[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.ovals[3];
		leader[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.ovals[2];
		now.isLeader = trpt->bup.ovals[1];
		now.leaders = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 6);
		goto R999;

	case 36: // STATE 30
		;
		((P0 *)_this)->i = trpt->bup.ovals[2];
		connect[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.ovals[1];
		now.state[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;

	case 37: // STATE 30
		;
		((P0 *)_this)->i = trpt->bup.ovals[2];
		connect[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.ovals[1];
		now.state[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;

	case 38: // STATE 33
		;
		((P0 *)_this)->i = trpt->bup.ovals[1];
		((P0 *)_this)->votesGranted[ Index(((P0 *)_this)->i, 3) ] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 39: // STATE 39
		;
		((P0 *)_this)->votedFor = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 41: // STATE 47
		;
		now.consecutiveCrashes[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.ovals[4];
		connect[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.ovals[3];
		now.time_out[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.ovals[2];
		((P0 *)_this)->votedFor = trpt->bup.ovals[1];
		now.state[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 5);
		goto R999;
;
		;
		
	case 43: // STATE 50
		;
		now.time_out[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 45: // STATE 58
		;
		((P0 *)_this)->i = trpt->bup.ovals[3];
		((P0 *)_this)->votedFor = trpt->bup.ovals[2];
		now.currentTerm[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.ovals[1];
		now.state[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 4);
		goto R999;

	case 46: // STATE 61
		;
		((P0 *)_this)->i = trpt->bup.ovals[1];
		((P0 *)_this)->votesGranted[ Index(((P0 *)_this)->i, 3) ] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 47: // STATE 70
		;
		((P0 *)_this)->outMsg.requestVote.term = trpt->bup.ovals[3];
		((P0 *)_this)->outMsg.sender = trpt->bup.ovals[2];
		((P0 *)_this)->outMsg.messageType = trpt->bup.ovals[1];
		((P0 *)_this)->votesGranted[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 4);
		goto R999;

	case 48: // STATE 82
		;
		((P0 *)_this)->i = trpt->bup.ovals[2];
		((P0 *)_this)->outMsg.requestVote.lastLogIndex = trpt->bup.ovals[1];
		((P0 *)_this)->outMsg.requestVote.lastLogTerm = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;

	case 49: // STATE 82
		;
		((P0 *)_this)->i = trpt->bup.ovals[2];
		((P0 *)_this)->outMsg.requestVote.lastLogIndex = trpt->bup.ovals[1];
		((P0 *)_this)->outMsg.requestVote.lastLogTerm = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;

	case 50: // STATE 82
		;
		((P0 *)_this)->i = trpt->bup.ovals[2];
		((P0 *)_this)->outMsg.requestVote.lastLogIndex = trpt->bup.ovals[1];
		((P0 *)_this)->outMsg.requestVote.lastLogTerm = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;

	case 51: // STATE 82
		;
		((P0 *)_this)->i = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 53: // STATE 85
		;
		((P0 *)_this)->outMsg.receiver = trpt->bup.oval;
		;
		goto R999;

	case 54: // STATE 92
		;
		((P0 *)_this)->i = trpt->bup.oval;
		_m = unsend(now.toNodes[ Index(((int)((P0 *)_this)->i), 3) ]);
		;
		goto R999;

	case 55: // STATE 92
		;
		((P0 *)_this)->i = trpt->bup.oval;
		;
		goto R999;

	case 56: // STATE 92
		;
		((P0 *)_this)->i = trpt->bup.oval;
		;
		goto R999;
;
		;
		;
		;
		
	case 59: // STATE 102
		;
		((P0 *)_this)->i = trpt->bup.ovals[1];
		((P0 *)_this)->voteCount = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;
;
		;
		
	case 61: // STATE 110
		;
		((P0 *)_this)->i = trpt->bup.ovals[1];
		((P0 *)_this)->voteCount = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 62: // STATE 110
		;
		((P0 *)_this)->i = trpt->bup.oval;
		;
		goto R999;

	case 63: // STATE 110
		;
		((P0 *)_this)->i = trpt->bup.oval;
		;
		goto R999;

	case 64: // STATE 122
		;
		((P0 *)_this)->i = trpt->bup.ovals[4];
		leader[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.ovals[3];
		now.isLeader = trpt->bup.ovals[2];
		now.leaders = trpt->bup.ovals[1];
		now.state[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 5);
		goto R999;
;
		;
		
	case 66: // STATE 130
		;
		((P0 *)_this)->outMsg.appendEntry.index = trpt->bup.ovals[5];
		((P0 *)_this)->outMsg.appendEntry.leaderCommit = trpt->bup.ovals[4];
		((P0 *)_this)->outMsg.appendEntry.term = trpt->bup.ovals[3];
		((P0 *)_this)->outMsg.receiver = trpt->bup.ovals[2];
		((P0 *)_this)->outMsg.sender = trpt->bup.ovals[1];
		((P0 *)_this)->outMsg.messageType = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 6);
		goto R999;

	case 67: // STATE 137
		;
		((P0 *)_this)->i = trpt->bup.oval;
		_m = unsend(now.toNodes[ Index(((int)((P0 *)_this)->i), 3) ]);
		;
		goto R999;

	case 68: // STATE 137
		;
		((P0 *)_this)->i = trpt->bup.oval;
		;
		goto R999;

	case 69: // STATE 137
		;
		((P0 *)_this)->i = trpt->bup.oval;
		;
		goto R999;
;
		
	case 70: // STATE 147
		goto R999;

	case 71: // STATE 145
		;
		now.time_out[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 73: // STATE 151
		;
		now.time_out[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 75: // STATE 155
		;
		((P0 *)_this)->_11_7_sender = trpt->bup.ovals[14];
		XX = 1;
		unrecv(now.toNodes[ Index(((int)((P0 *)_this)->serverId), 3) ], XX-1, 0, ((P0 *)_this)->msg.messageType, 1);
		unrecv(now.toNodes[ Index(((int)((P0 *)_this)->serverId), 3) ], XX-1, 1, ((int)((P0 *)_this)->msg.sender), 0);
		unrecv(now.toNodes[ Index(((int)((P0 *)_this)->serverId), 3) ], XX-1, 2, ((int)((P0 *)_this)->msg.receiver), 0);
		unrecv(now.toNodes[ Index(((int)((P0 *)_this)->serverId), 3) ], XX-1, 3, ((int)((P0 *)_this)->msg.appendEntry.term), 0);
		unrecv(now.toNodes[ Index(((int)((P0 *)_this)->serverId), 3) ], XX-1, 4, ((int)((P0 *)_this)->msg.appendEntry.leaderCommit), 0);
		unrecv(now.toNodes[ Index(((int)((P0 *)_this)->serverId), 3) ], XX-1, 5, ((int)((P0 *)_this)->msg.appendEntry.index), 0);
		unrecv(now.toNodes[ Index(((int)((P0 *)_this)->serverId), 3) ], XX-1, 6, ((int)((P0 *)_this)->msg.appendEntry.prevLogTerm), 0);
		unrecv(now.toNodes[ Index(((int)((P0 *)_this)->serverId), 3) ], XX-1, 7, ((int)((P0 *)_this)->msg.appendEntryResponse.term), 0);
		unrecv(now.toNodes[ Index(((int)((P0 *)_this)->serverId), 3) ], XX-1, 8, ((int)((P0 *)_this)->msg.appendEntryResponse.success), 0);
		unrecv(now.toNodes[ Index(((int)((P0 *)_this)->serverId), 3) ], XX-1, 9, ((int)((P0 *)_this)->msg.requestVote.term), 0);
		unrecv(now.toNodes[ Index(((int)((P0 *)_this)->serverId), 3) ], XX-1, 10, ((int)((P0 *)_this)->msg.requestVote.lastLogIndex), 0);
		unrecv(now.toNodes[ Index(((int)((P0 *)_this)->serverId), 3) ], XX-1, 11, ((int)((P0 *)_this)->msg.requestVote.lastLogTerm), 0);
		unrecv(now.toNodes[ Index(((int)((P0 *)_this)->serverId), 3) ], XX-1, 12, ((int)((P0 *)_this)->msg.requestVoteResponse.term), 0);
		unrecv(now.toNodes[ Index(((int)((P0 *)_this)->serverId), 3) ], XX-1, 13, ((int)((P0 *)_this)->msg.requestVoteResponse.voteGranted), 0);
		((P0 *)_this)->msg.messageType = trpt->bup.ovals[0];
		((P0 *)_this)->msg.sender = trpt->bup.ovals[1];
		((P0 *)_this)->msg.receiver = trpt->bup.ovals[2];
		((P0 *)_this)->msg.appendEntry.term = trpt->bup.ovals[3];
		((P0 *)_this)->msg.appendEntry.leaderCommit = trpt->bup.ovals[4];
		((P0 *)_this)->msg.appendEntry.index = trpt->bup.ovals[5];
		((P0 *)_this)->msg.appendEntry.prevLogTerm = trpt->bup.ovals[6];
		((P0 *)_this)->msg.appendEntryResponse.term = trpt->bup.ovals[7];
		((P0 *)_this)->msg.appendEntryResponse.success = trpt->bup.ovals[8];
		((P0 *)_this)->msg.requestVote.term = trpt->bup.ovals[9];
		((P0 *)_this)->msg.requestVote.lastLogIndex = trpt->bup.ovals[10];
		((P0 *)_this)->msg.requestVote.lastLogTerm = trpt->bup.ovals[11];
		((P0 *)_this)->msg.requestVoteResponse.term = trpt->bup.ovals[12];
		((P0 *)_this)->msg.requestVoteResponse.voteGranted = trpt->bup.ovals[13];
		;
		;
		ungrab_ints(trpt->bup.ovals, 15);
		goto R999;
;
		
	case 76: // STATE 156
		goto R999;
;
		
	case 77: // STATE 158
		goto R999;

	case 78: // STATE 171
		;
		now.time_out[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.ovals[6];
		((P0 *)_this)->votedFor = trpt->bup.ovals[5];
		now.state[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.ovals[4];
		now.currentTerm[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.ovals[3];
		leader[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.ovals[2];
		now.isLeader = trpt->bup.ovals[1];
		now.leaders = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 7);
		goto R999;

	case 79: // STATE 171
		;
		now.time_out[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.ovals[3];
		((P0 *)_this)->votedFor = trpt->bup.ovals[2];
		now.state[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.ovals[1];
		now.currentTerm[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 4);
		goto R999;

	case 80: // STATE 171
		;
		now.time_out[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.ovals[3];
		((P0 *)_this)->votedFor = trpt->bup.ovals[2];
		now.state[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.ovals[1];
		now.currentTerm[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 4);
		goto R999;
;
		
	case 81: // STATE 172
		goto R999;

	case 82: // STATE 197
		;
		((P0 *)_this)->outMsg.requestVoteResponse.voteGranted = trpt->bup.ovals[8];
		((P0 *)_this)->outMsg.requestVoteResponse.term = trpt->bup.ovals[7];
		((P0 *)_this)->outMsg.receiver = trpt->bup.ovals[6];
		((P0 *)_this)->outMsg.sender = trpt->bup.ovals[5];
		((P0 *)_this)->outMsg.messageType = trpt->bup.ovals[4];
		((P0 *)_this)->_11_7_voteGranted = trpt->bup.ovals[3];
		((P0 *)_this)->logOk = trpt->bup.ovals[2];
		((P0 *)_this)->lastLogIndex = trpt->bup.ovals[1];
		((P0 *)_this)->lastLogTerm = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 9);
		goto R999;

	case 83: // STATE 197
		;
		((P0 *)_this)->outMsg.requestVoteResponse.voteGranted = trpt->bup.ovals[8];
		((P0 *)_this)->outMsg.requestVoteResponse.term = trpt->bup.ovals[7];
		((P0 *)_this)->outMsg.receiver = trpt->bup.ovals[6];
		((P0 *)_this)->outMsg.sender = trpt->bup.ovals[5];
		((P0 *)_this)->outMsg.messageType = trpt->bup.ovals[4];
		((P0 *)_this)->_11_7_voteGranted = trpt->bup.ovals[3];
		((P0 *)_this)->logOk = trpt->bup.ovals[2];
		((P0 *)_this)->lastLogIndex = trpt->bup.ovals[1];
		((P0 *)_this)->lastLogTerm = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 9);
		goto R999;

	case 84: // STATE 197
		;
		((P0 *)_this)->outMsg.requestVoteResponse.voteGranted = trpt->bup.ovals[8];
		((P0 *)_this)->outMsg.requestVoteResponse.term = trpt->bup.ovals[7];
		((P0 *)_this)->outMsg.receiver = trpt->bup.ovals[6];
		((P0 *)_this)->outMsg.sender = trpt->bup.ovals[5];
		((P0 *)_this)->outMsg.messageType = trpt->bup.ovals[4];
		((P0 *)_this)->_11_7_voteGranted = trpt->bup.ovals[3];
		((P0 *)_this)->logOk = trpt->bup.ovals[2];
		((P0 *)_this)->lastLogIndex = trpt->bup.ovals[1];
		((P0 *)_this)->lastLogTerm = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 9);
		goto R999;

	case 85: // STATE 197
		;
		((P0 *)_this)->outMsg.requestVoteResponse.voteGranted = trpt->bup.ovals[6];
		((P0 *)_this)->outMsg.requestVoteResponse.term = trpt->bup.ovals[5];
		((P0 *)_this)->outMsg.receiver = trpt->bup.ovals[4];
		((P0 *)_this)->outMsg.sender = trpt->bup.ovals[3];
		((P0 *)_this)->outMsg.messageType = trpt->bup.ovals[2];
		((P0 *)_this)->_11_7_voteGranted = trpt->bup.ovals[1];
		((P0 *)_this)->logOk = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 7);
		goto R999;

	case 86: // STATE 199
		;
		((P0 *)_this)->votedFor = trpt->bup.ovals[1];
	/* 0 */	((P0 *)_this)->_11_7_voteGranted = trpt->bup.ovals[0];
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 87: // STATE 201
		;
	/* 0 */	((P0 *)_this)->_11_7_voteGranted = trpt->bup.oval;
		;
		;
		goto R999;

	case 88: // STATE 206
		;
		_m = unsend(now.toNodes[ Index(((int)((P0 *)_this)->_11_7_sender), 3) ]);
		;
		goto R999;
;
		
	case 89: // STATE 325
		goto R999;
;
		
	case 90: // STATE 207
		goto R999;
;
		
	case 91: // STATE 209
		goto R999;

	case 92: // STATE 222
		;
		now.time_out[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.ovals[6];
		((P0 *)_this)->votedFor = trpt->bup.ovals[5];
		now.state[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.ovals[4];
		now.currentTerm[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.ovals[3];
		leader[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.ovals[2];
		now.isLeader = trpt->bup.ovals[1];
		now.leaders = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 7);
		goto R999;

	case 93: // STATE 222
		;
		now.time_out[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.ovals[3];
		((P0 *)_this)->votedFor = trpt->bup.ovals[2];
		now.state[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.ovals[1];
		now.currentTerm[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 4);
		goto R999;

	case 94: // STATE 222
		;
		now.time_out[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.ovals[3];
		((P0 *)_this)->votedFor = trpt->bup.ovals[2];
		now.state[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.ovals[1];
		now.currentTerm[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 4);
		goto R999;
;
		
	case 95: // STATE 230
		goto R999;

	case 96: // STATE 224
		;
		((P0 *)_this)->votesGranted[ Index(((P0 *)_this)->_11_7_sender, 3) ] = trpt->bup.oval;
		;
		goto R999;
;
		;
		;
		
	case 98: // STATE 228
		goto R999;
;
		
	case 99: // STATE 231
		goto R999;
;
		
	case 100: // STATE 233
		goto R999;

	case 101: // STATE 246
		;
		now.time_out[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.ovals[6];
		((P0 *)_this)->votedFor = trpt->bup.ovals[5];
		now.state[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.ovals[4];
		now.currentTerm[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.ovals[3];
		leader[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.ovals[2];
		now.isLeader = trpt->bup.ovals[1];
		now.leaders = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 7);
		goto R999;

	case 102: // STATE 246
		;
		now.time_out[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.ovals[3];
		((P0 *)_this)->votedFor = trpt->bup.ovals[2];
		now.state[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.ovals[1];
		now.currentTerm[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 4);
		goto R999;

	case 103: // STATE 246
		;
		now.time_out[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.ovals[3];
		((P0 *)_this)->votedFor = trpt->bup.ovals[2];
		now.state[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.ovals[1];
		now.currentTerm[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 4);
		goto R999;
;
		
	case 104: // STATE 247
		goto R999;
;
		;
		
	case 106: // STATE 271
		;
		((P0 *)_this)->outMsg.appendEntryResponse.term = trpt->bup.ovals[7];
		((P0 *)_this)->outMsg.receiver = trpt->bup.ovals[6];
		((P0 *)_this)->outMsg.sender = trpt->bup.ovals[5];
		((P0 *)_this)->outMsg.messageType = trpt->bup.ovals[4];
		((P0 *)_this)->logOk = trpt->bup.ovals[3];
		now.time_out[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.ovals[2];
		((P0 *)_this)->votedFor = trpt->bup.ovals[1];
		now.state[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 8);
		goto R999;

	case 107: // STATE 271
		;
		((P0 *)_this)->outMsg.appendEntryResponse.term = trpt->bup.ovals[5];
		((P0 *)_this)->outMsg.receiver = trpt->bup.ovals[4];
		((P0 *)_this)->outMsg.sender = trpt->bup.ovals[3];
		((P0 *)_this)->outMsg.messageType = trpt->bup.ovals[2];
		((P0 *)_this)->logOk = trpt->bup.ovals[1];
		now.time_out[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 6);
		goto R999;

	case 108: // STATE 271
		;
		((P0 *)_this)->outMsg.appendEntryResponse.term = trpt->bup.ovals[5];
		((P0 *)_this)->outMsg.receiver = trpt->bup.ovals[4];
		((P0 *)_this)->outMsg.sender = trpt->bup.ovals[3];
		((P0 *)_this)->outMsg.messageType = trpt->bup.ovals[2];
		((P0 *)_this)->logOk = trpt->bup.ovals[1];
		now.time_out[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 6);
		goto R999;

	case 109: // STATE 271
		;
		((P0 *)_this)->outMsg.appendEntryResponse.term = trpt->bup.ovals[4];
		((P0 *)_this)->outMsg.receiver = trpt->bup.ovals[3];
		((P0 *)_this)->outMsg.sender = trpt->bup.ovals[2];
		((P0 *)_this)->outMsg.messageType = trpt->bup.ovals[1];
		((P0 *)_this)->logOk = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 5);
		goto R999;

	case 110: // STATE 271
		;
		((P0 *)_this)->outMsg.appendEntryResponse.term = trpt->bup.ovals[4];
		((P0 *)_this)->outMsg.receiver = trpt->bup.ovals[3];
		((P0 *)_this)->outMsg.sender = trpt->bup.ovals[2];
		((P0 *)_this)->outMsg.messageType = trpt->bup.ovals[1];
		((P0 *)_this)->logOk = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 5);
		goto R999;

	case 111: // STATE 273
		;
		((P0 *)_this)->outMsg.appendEntryResponse.success = trpt->bup.oval;
		;
		goto R999;

	case 112: // STATE 276
		;
		((P0 *)_this)->outMsg.appendEntryResponse.success = trpt->bup.ovals[1];
	/* 0 */	((P0 *)_this)->logOk = trpt->bup.ovals[0];
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 113: // STATE 284
		;
		now.commitIndex[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.ovals[1];
		now.logs[ Index(((P0 *)_this)->serverId, 3) ].logs[ Index(((P0 *)_this)->msg.appendEntry.index, 2) ] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 114: // STATE 284
		;
		now.commitIndex[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.oval;
		;
		goto R999;

	case 115: // STATE 284
		;
		now.commitIndex[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.oval;
		;
		goto R999;

	case 116: // STATE 288
		;
		_m = unsend(now.toNodes[ Index(((int)((P0 *)_this)->_11_7_sender), 3) ]);
		;
		goto R999;
;
		
	case 117: // STATE 289
		goto R999;
;
		
	case 118: // STATE 291
		goto R999;

	case 119: // STATE 304
		;
		now.time_out[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.ovals[6];
		((P0 *)_this)->votedFor = trpt->bup.ovals[5];
		now.state[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.ovals[4];
		now.currentTerm[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.ovals[3];
		leader[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.ovals[2];
		now.isLeader = trpt->bup.ovals[1];
		now.leaders = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 7);
		goto R999;

	case 120: // STATE 304
		;
		now.time_out[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.ovals[3];
		((P0 *)_this)->votedFor = trpt->bup.ovals[2];
		now.state[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.ovals[1];
		now.currentTerm[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 4);
		goto R999;

	case 121: // STATE 304
		;
		now.time_out[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.ovals[3];
		((P0 *)_this)->votedFor = trpt->bup.ovals[2];
		now.state[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.ovals[1];
		now.currentTerm[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 4);
		goto R999;
;
		
	case 122: // STATE 323
		goto R999;
;
		
	case 123: // STATE 305
		goto R999;
;
		
	case 124: // STATE 307
		goto R999;

	case 125: // STATE 310
		;
		connect[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.oval;
		;
		goto R999;

	case 126: // STATE 312
		;
		now.commitIndex[ Index(((P0 *)_this)->serverId, 3) ] = trpt->bup.ovals[1];
	/* 0 */	((P0 *)_this)->_11_7_sender = trpt->bup.ovals[0];
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;
;
		;
		;
		
	case 128: // STATE 316
		goto R999;
;
		;
		;
		
	case 130: // STATE 321
		goto R999;
;
		;
		
	case 132: // STATE 328
		;
		((P0 *)_this)->i = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 134: // STATE 335
		;
		((P0 *)_this)->outMsg.appendEntry.leaderCommit = trpt->bup.ovals[4];
		((P0 *)_this)->outMsg.appendEntry.term = trpt->bup.ovals[3];
		((P0 *)_this)->outMsg.receiver = trpt->bup.ovals[2];
		((P0 *)_this)->outMsg.sender = trpt->bup.ovals[1];
		((P0 *)_this)->outMsg.messageType = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 5);
		goto R999;

	case 135: // STATE 338
		;
		((P0 *)_this)->outMsg.appendEntry.index = trpt->bup.oval;
		;
		goto R999;

	case 136: // STATE 342
		;
		((P0 *)_this)->outMsg.appendEntry.prevLogTerm = trpt->bup.ovals[1];
		((P0 *)_this)->outMsg.appendEntry.index = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 137: // STATE 345
		;
		((P0 *)_this)->outMsg.appendEntry.index = trpt->bup.oval;
		;
		goto R999;

	case 138: // STATE 354
		;
		((P0 *)_this)->i = trpt->bup.oval;
		_m = unsend(now.toNodes[ Index(((int)((P0 *)_this)->i), 3) ]);
		;
		goto R999;

	case 139: // STATE 354
		;
		((P0 *)_this)->i = trpt->bup.oval;
		;
		goto R999;

	case 140: // STATE 354
		;
		((P0 *)_this)->i = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 142: // STATE 363
		;
		now.logs[ Index(((P0 *)_this)->serverId, 3) ].logs[0] = trpt->bup.oval;
		;
		goto R999;
;
		
	case 143: // STATE 369
		goto R999;

	case 144: // STATE 366
		;
		now.logs[ Index(((P0 *)_this)->serverId, 3) ].logs[1] = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 146: // STATE 376
		;
		p_restor(II);
		;
		;
		goto R999;
	}

