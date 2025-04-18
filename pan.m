#define rand	pan_rand
#define pthread_equal(a,b)	((a)==(b))
#if defined(HAS_CODE) && defined(VERBOSE)
	#ifdef BFS_PAR
		bfs_printf("Pr: %d Tr: %d\n", II, t->forw);
	#else
		cpu_printf("Pr: %d Tr: %d\n", II, t->forw);
	#endif
#endif
	switch (t->forw) {
	default: Uerror("bad forward move");
	case 0:	/* if without executable clauses */
		continue;
	case 1: /* generic 'goto' or 'skip' */
		IfNotBlocked
		_m = 3; goto P999;
	case 2: /* generic 'else' */
		IfNotBlocked
		if (trpt->o_pm&1) continue;
		_m = 3; goto P999;

		 /* CLAIM uniqueness */
	case 3: // STATE 1 - _spin_nvr.tmp:42 - [(!((leaders<=1)))] (6:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported1 = 0;
			if (verbose && !reported1)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported1 = 0;
			if (verbose && !reported1)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[5][1] = 1;
		if (!( !((((int)now.leaders)<=1))))
			continue;
		/* merge: assert(!(!((leaders<=1))))(0, 2, 6) */
		reached[5][2] = 1;
		spin_assert( !( !((((int)now.leaders)<=1))), " !( !((leaders<=1)))", II, tt, t);
		/* merge: .(goto)(0, 7, 6) */
		reached[5][7] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 4: // STATE 10 - _spin_nvr.tmp:47 - [-end-] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported10 = 0;
			if (verbose && !reported10)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported10 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported10 = 0;
			if (verbose && !reported10)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported10 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[5][10] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* CLAIM electionFairness */
	case 5: // STATE 1 - _spin_nvr.tmp:21 - [((!(!((state[2]==3)))&&!((state[2]!=3))))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported1 = 0;
			if (verbose && !reported1)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported1 = 0;
			if (verbose && !reported1)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[4][1] = 1;
		if (!(( !( !((now.state[2]==3)))&& !((now.state[2]!=3)))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 6: // STATE 3 - _spin_nvr.tmp:22 - [((!(!((state[1]==3)))&&!((state[1]!=3))))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported3 = 0;
			if (verbose && !reported3)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported3 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported3 = 0;
			if (verbose && !reported3)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported3 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[4][3] = 1;
		if (!(( !( !((now.state[1]==3)))&& !((now.state[1]!=3)))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 7: // STATE 5 - _spin_nvr.tmp:23 - [((!(!((state[0]==3)))&&!((state[0]!=3))))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported5 = 0;
			if (verbose && !reported5)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported5 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported5 = 0;
			if (verbose && !reported5)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported5 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[4][5] = 1;
		if (!(( !( !((now.state[0]==3)))&& !((now.state[0]!=3)))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 8: // STATE 12 - _spin_nvr.tmp:28 - [((!(!((state[2]==3)))&&!((state[2]!=3))))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported12 = 0;
			if (verbose && !reported12)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported12 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported12 = 0;
			if (verbose && !reported12)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported12 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[4][12] = 1;
		if (!(( !( !((now.state[2]==3)))&& !((now.state[2]!=3)))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 9: // STATE 17 - _spin_nvr.tmp:32 - [((!(!((state[1]==3)))&&!((state[1]!=3))))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported17 = 0;
			if (verbose && !reported17)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported17 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported17 = 0;
			if (verbose && !reported17)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported17 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[4][17] = 1;
		if (!(( !( !((now.state[1]==3)))&& !((now.state[1]!=3)))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 10: // STATE 22 - _spin_nvr.tmp:36 - [((!(!((state[0]==3)))&&!((state[0]!=3))))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported22 = 0;
			if (verbose && !reported22)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported22 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported22 = 0;
			if (verbose && !reported22)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported22 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[4][22] = 1;
		if (!(( !( !((now.state[0]==3)))&& !((now.state[0]!=3)))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 11: // STATE 27 - _spin_nvr.tmp:38 - [-end-] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported27 = 0;
			if (verbose && !reported27)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported27 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported27 = 0;
			if (verbose && !reported27)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported27 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[4][27] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* CLAIM fairness */
	case 12: // STATE 1 - _spin_nvr.tmp:10 - [(!(((((state[0]!=1)&&(state[1]!=1))||((state[0]!=1)&&(state[2]!=1)))||((state[1]!=1)&&(state[2]!=1)))))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported1 = 0;
			if (verbose && !reported1)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported1 = 0;
			if (verbose && !reported1)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[3][1] = 1;
		if (!( !(((((now.state[0]!=1)&&(now.state[1]!=1))||((now.state[0]!=1)&&(now.state[2]!=1)))||((now.state[1]!=1)&&(now.state[2]!=1))))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 13: // STATE 8 - _spin_nvr.tmp:15 - [(!(((((state[0]!=1)&&(state[1]!=1))||((state[0]!=1)&&(state[2]!=1)))||((state[1]!=1)&&(state[2]!=1)))))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported8 = 0;
			if (verbose && !reported8)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported8 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported8 = 0;
			if (verbose && !reported8)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported8 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[3][8] = 1;
		if (!( !(((((now.state[0]!=1)&&(now.state[1]!=1))||((now.state[0]!=1)&&(now.state[2]!=1)))||((now.state[1]!=1)&&(now.state[2]!=1))))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 14: // STATE 13 - _spin_nvr.tmp:17 - [-end-] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported13 = 0;
			if (verbose && !reported13)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported13 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported13 = 0;
			if (verbose && !reported13)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported13 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[3][13] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* CLAIM liveness */
	case 15: // STATE 1 - _spin_nvr.tmp:4 - [(!((isLeader==1)))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported1 = 0;
			if (verbose && !reported1)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported1 = 0;
			if (verbose && !reported1)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[2][1] = 1;
		if (!( !((((int)now.isLeader)==1))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 16: // STATE 6 - _spin_nvr.tmp:6 - [-end-] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported6 = 0;
			if (verbose && !reported6)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported6 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported6 = 0;
			if (verbose && !reported6)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported6 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[2][6] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC :init: */
	case 17: // STATE 1 - raft_sem8.pml:503 - [printf('INIT: Starting Raft simulation with %d servers\\n',3)] (0:14:1 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		Printf("INIT: Starting Raft simulation with %d servers\n", 3);
		/* merge: i = 0(14, 2, 14) */
		reached[1][2] = 1;
		(trpt+1)->bup.oval = ((int)((P1 *)_this)->i);
		((P1 *)_this)->i = 0;
#ifdef VAR_RANGES
		logval(":init::i", ((int)((P1 *)_this)->i));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 18: // STATE 3 - raft_sem8.pml:506 - [i = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[1][3] = 1;
		(trpt+1)->bup.oval = ((int)((P1 *)_this)->i);
		((P1 *)_this)->i = 0;
#ifdef VAR_RANGES
		logval(":init::i", ((int)((P1 *)_this)->i));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 19: // STATE 4 - raft_sem8.pml:506 - [((i<=(3-1)))] (7:0:2 - 1)
		IfNotBlocked
		reached[1][4] = 1;
		if (!((((int)((P1 *)_this)->i)<=(3-1))))
			continue;
		/* merge: leader[i] = 0(7, 5, 7) */
		reached[1][5] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)leader[ Index(((int)((P1 *)_this)->i), 3) ]);
		leader[ Index(((P1 *)_this)->i, 3) ] = 0;
#ifdef VAR_RANGES
		logval("leader[:init::i]", ((int)leader[ Index(((int)((P1 *)_this)->i), 3) ]));
#endif
		;
		/* merge: connect[i] = 0(7, 6, 7) */
		reached[1][6] = 1;
		(trpt+1)->bup.ovals[1] = ((int)connect[ Index(((int)((P1 *)_this)->i), 3) ]);
		connect[ Index(((P1 *)_this)->i, 3) ] = 0;
#ifdef VAR_RANGES
		logval("connect[:init::i]", ((int)connect[ Index(((int)((P1 *)_this)->i), 3) ]));
#endif
		;
		_m = 3; goto P999; /* 2 */
	case 20: // STATE 7 - raft_sem8.pml:509 - [(run server(i))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][7] = 1;
		if (!(addproc(II, 1, 0, ((int)((P1 *)_this)->i))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 21: // STATE 8 - raft_sem8.pml:506 - [i = (i+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[1][8] = 1;
		(trpt+1)->bup.oval = ((int)((P1 *)_this)->i);
		((P1 *)_this)->i = (((int)((P1 *)_this)->i)+1);
#ifdef VAR_RANGES
		logval(":init::i", ((int)((P1 *)_this)->i));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 22: // STATE 15 - raft_sem8.pml:512 - [printf('INIT: All servers started\\n')] (0:0:0 - 1)
		IfNotBlocked
		reached[1][15] = 1;
		Printf("INIT: All servers started\n");
		_m = 3; goto P999; /* 0 */
	case 23: // STATE 16 - raft_sem8.pml:513 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][16] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC server */
	case 24: // STATE 1 - raft_sem8.pml:76 - [printf('SERVER %d: Starting server process\\n',serverId)] (0:0:0 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		Printf("SERVER %d: Starting server process\n", ((int)((P0 *)_this)->serverId));
		_m = 3; goto P999; /* 0 */
	case 25: // STATE 2 - raft_sem8.pml:77 - [state[serverId] = 2] (0:0:1 - 1)
		IfNotBlocked
		reached[0][2] = 1;
		(trpt+1)->bup.oval = now.state[ Index(((int)((P0 *)_this)->serverId), 3) ];
		now.state[ Index(((P0 *)_this)->serverId, 3) ] = 2;
#ifdef VAR_RANGES
		logval("state[server:serverId]", now.state[ Index(((int)((P0 *)_this)->serverId), 3) ]);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 26: // STATE 3 - raft_sem8.pml:79 - [votedFor = 10] (0:0:1 - 1)
		IfNotBlocked
		reached[0][3] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)_this)->votedFor);
		((P0 *)_this)->votedFor = 10;
#ifdef VAR_RANGES
		logval("server:votedFor", ((int)((P0 *)_this)->votedFor));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 27: // STATE 4 - raft_sem8.pml:79 - [time_out[serverId] = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[0][4] = 1;
		(trpt+1)->bup.oval = ((int)now.time_out[ Index(((int)((P0 *)_this)->serverId), 3) ]);
		now.time_out[ Index(((P0 *)_this)->serverId, 3) ] = 1;
#ifdef VAR_RANGES
		logval("time_out[server:serverId]", ((int)now.time_out[ Index(((int)((P0 *)_this)->serverId), 3) ]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 28: // STATE 5 - raft_sem8.pml:80 - [leader[serverId] = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[0][5] = 1;
		(trpt+1)->bup.oval = ((int)leader[ Index(((int)((P0 *)_this)->serverId), 3) ]);
		leader[ Index(((P0 *)_this)->serverId, 3) ] = 0;
#ifdef VAR_RANGES
		logval("leader[server:serverId]", ((int)leader[ Index(((int)((P0 *)_this)->serverId), 3) ]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 29: // STATE 6 - raft_sem8.pml:81 - [connect[serverId] = (3-1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][6] = 1;
		(trpt+1)->bup.oval = ((int)connect[ Index(((int)((P0 *)_this)->serverId), 3) ]);
		connect[ Index(((P0 *)_this)->serverId, 3) ] = (3-1);
#ifdef VAR_RANGES
		logval("connect[server:serverId]", ((int)connect[ Index(((int)((P0 *)_this)->serverId), 3) ]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 30: // STATE 7 - raft_sem8.pml:82 - [consecutiveCrashes[serverId] = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[0][7] = 1;
		(trpt+1)->bup.oval = ((int)now.consecutiveCrashes[ Index(((int)((P0 *)_this)->serverId), 3) ]);
		now.consecutiveCrashes[ Index(((P0 *)_this)->serverId, 3) ] = 0;
#ifdef VAR_RANGES
		logval("consecutiveCrashes[server:serverId]", ((int)now.consecutiveCrashes[ Index(((int)((P0 *)_this)->serverId), 3) ]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 31: // STATE 8 - raft_sem8.pml:83 - [printf('SERVER %d: Initialized as follower,term = %d,votedFor = %d,time_out = %d\\n',serverId,currentTerm[serverId],votedFor,time_out[serverId])] (0:0:0 - 1)
		IfNotBlocked
		reached[0][8] = 1;
		Printf("SERVER %d: Initialized as follower,term = %d,votedFor = %d,time_out = %d\n", ((int)((P0 *)_this)->serverId), ((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]), ((int)((P0 *)_this)->votedFor), ((int)now.time_out[ Index(((int)((P0 *)_this)->serverId), 3) ]));
		_m = 3; goto P999; /* 0 */
	case 32: // STATE 9 - raft_sem8.pml:88 - [i = 0] (0:372:6 - 1)
		IfNotBlocked
		reached[0][9] = 1;
		(trpt+1)->bup.ovals = grab_ints(6);
		(trpt+1)->bup.ovals[0] = ((int)((P0 *)_this)->i);
		((P0 *)_this)->i = 0;
#ifdef VAR_RANGES
		logval("server:i", ((int)((P0 *)_this)->i));
#endif
		;
		/* merge: votesGranted[0] = 0(372, 10, 372) */
		reached[0][10] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P0 *)_this)->votesGranted[0]);
		((P0 *)_this)->votesGranted[0] = 0;
#ifdef VAR_RANGES
		logval("server:votesGranted[0]", ((int)((P0 *)_this)->votesGranted[0]));
#endif
		;
		/* merge: lastLogTerm = 0(372, 11, 372) */
		reached[0][11] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)_this)->lastLogTerm);
		((P0 *)_this)->lastLogTerm = 0;
#ifdef VAR_RANGES
		logval("server:lastLogTerm", ((int)((P0 *)_this)->lastLogTerm));
#endif
		;
		/* merge: lastLogIndex = 0(372, 12, 372) */
		reached[0][12] = 1;
		(trpt+1)->bup.ovals[3] = ((int)((P0 *)_this)->lastLogIndex);
		((P0 *)_this)->lastLogIndex = 0;
#ifdef VAR_RANGES
		logval("server:lastLogIndex", ((int)((P0 *)_this)->lastLogIndex));
#endif
		;
		/* merge: logOk = 0(372, 13, 372) */
		reached[0][13] = 1;
		(trpt+1)->bup.ovals[4] = ((int)((P0 *)_this)->logOk);
		((P0 *)_this)->logOk = 0;
#ifdef VAR_RANGES
		logval("server:logOk", ((int)((P0 *)_this)->logOk));
#endif
		;
		/* merge: (372, 14, 372) */
		reached[0][14] = 1;
		;
		/* merge: (372, 15, 372) */
		reached[0][15] = 1;
		;
		/* merge: voteCount = 0(372, 16, 372) */
		reached[0][16] = 1;
		(trpt+1)->bup.ovals[5] = ((int)((P0 *)_this)->voteCount);
		((P0 *)_this)->voteCount = 0;
#ifdef VAR_RANGES
		logval("server:voteCount", ((int)((P0 *)_this)->voteCount));
#endif
		;
		/* merge: .(goto)(0, 373, 372) */
		reached[0][373] = 1;
		;
		_m = 3; goto P999; /* 8 */
	case 33: // STATE 17 - raft_sem8.pml:96 - [(((state[serverId]!=1)&&(consecutiveCrashes[serverId]<1)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][17] = 1;
		if (!(((now.state[ Index(((int)((P0 *)_this)->serverId), 3) ]!=1)&&(((int)now.consecutiveCrashes[ Index(((int)((P0 *)_this)->serverId), 3) ])<1))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 34: // STATE 18 - raft_sem8.pml:98 - [consecutiveCrashes[serverId] = (consecutiveCrashes[serverId]+1)] (0:26:1 - 1)
		IfNotBlocked
		reached[0][18] = 1;
		(trpt+1)->bup.oval = ((int)now.consecutiveCrashes[ Index(((int)((P0 *)_this)->serverId), 3) ]);
		now.consecutiveCrashes[ Index(((P0 *)_this)->serverId, 3) ] = (((int)now.consecutiveCrashes[ Index(((int)((P0 *)_this)->serverId), 3) ])+1);
#ifdef VAR_RANGES
		logval("consecutiveCrashes[server:serverId]", ((int)now.consecutiveCrashes[ Index(((int)((P0 *)_this)->serverId), 3) ]));
#endif
		;
		/* merge: printf('SERVER %d: Crashing from state %e (crash count: %d)\\n',serverId,state[serverId],consecutiveCrashes[serverId])(26, 19, 26) */
		reached[0][19] = 1;
		Printf("SERVER %d: Crashing from state %e (crash count: %d)\n", ((int)((P0 *)_this)->serverId), now.state[ Index(((int)((P0 *)_this)->serverId), 3) ], ((int)now.consecutiveCrashes[ Index(((int)((P0 *)_this)->serverId), 3) ]));
		_m = 3; goto P999; /* 1 */
	case 35: // STATE 20 - raft_sem8.pml:101 - [((state[serverId]==4))] (36:0:6 - 1)
		IfNotBlocked
		reached[0][20] = 1;
		if (!((now.state[ Index(((int)((P0 *)_this)->serverId), 3) ]==4)))
			continue;
		/* merge: leaders = (leaders-1)(36, 21, 36) */
		reached[0][21] = 1;
		(trpt+1)->bup.ovals = grab_ints(6);
		(trpt+1)->bup.ovals[0] = ((int)now.leaders);
		now.leaders = (((int)now.leaders)-1);
#ifdef VAR_RANGES
		logval("leaders", ((int)now.leaders));
#endif
		;
		/* merge: isLeader = (leaders>0)(36, 22, 36) */
		reached[0][22] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.isLeader);
		now.isLeader = (((int)now.leaders)>0);
#ifdef VAR_RANGES
		logval("isLeader", ((int)now.isLeader));
#endif
		;
		/* merge: leader[serverId] = 0(36, 23, 36) */
		reached[0][23] = 1;
		(trpt+1)->bup.ovals[2] = ((int)leader[ Index(((int)((P0 *)_this)->serverId), 3) ]);
		leader[ Index(((P0 *)_this)->serverId, 3) ] = 0;
#ifdef VAR_RANGES
		logval("leader[server:serverId]", ((int)leader[ Index(((int)((P0 *)_this)->serverId), 3) ]));
#endif
		;
		/* merge: .(goto)(36, 27, 36) */
		reached[0][27] = 1;
		;
		/* merge: state[serverId] = 1(36, 28, 36) */
		reached[0][28] = 1;
		(trpt+1)->bup.ovals[3] = now.state[ Index(((int)((P0 *)_this)->serverId), 3) ];
		now.state[ Index(((P0 *)_this)->serverId, 3) ] = 1;
#ifdef VAR_RANGES
		logval("state[server:serverId]", now.state[ Index(((int)((P0 *)_this)->serverId), 3) ]);
#endif
		;
		/* merge: connect[serverId] = 0(36, 29, 36) */
		reached[0][29] = 1;
		(trpt+1)->bup.ovals[4] = ((int)connect[ Index(((int)((P0 *)_this)->serverId), 3) ]);
		connect[ Index(((P0 *)_this)->serverId, 3) ] = 0;
#ifdef VAR_RANGES
		logval("connect[server:serverId]", ((int)connect[ Index(((int)((P0 *)_this)->serverId), 3) ]));
#endif
		;
		/* merge: i = 0(36, 30, 36) */
		reached[0][30] = 1;
		(trpt+1)->bup.ovals[5] = ((int)((P0 *)_this)->i);
		((P0 *)_this)->i = 0;
#ifdef VAR_RANGES
		logval("server:i", ((int)((P0 *)_this)->i));
#endif
		;
		/* merge: .(goto)(0, 37, 36) */
		reached[0][37] = 1;
		;
		_m = 3; goto P999; /* 8 */
	case 36: // STATE 25 - raft_sem8.pml:105 - [(1)] (36:0:3 - 1)
		IfNotBlocked
		reached[0][25] = 1;
		if (!(1))
			continue;
		/* merge: .(goto)(36, 27, 36) */
		reached[0][27] = 1;
		;
		/* merge: state[serverId] = 1(36, 28, 36) */
		reached[0][28] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = now.state[ Index(((int)((P0 *)_this)->serverId), 3) ];
		now.state[ Index(((P0 *)_this)->serverId, 3) ] = 1;
#ifdef VAR_RANGES
		logval("state[server:serverId]", now.state[ Index(((int)((P0 *)_this)->serverId), 3) ]);
#endif
		;
		/* merge: connect[serverId] = 0(36, 29, 36) */
		reached[0][29] = 1;
		(trpt+1)->bup.ovals[1] = ((int)connect[ Index(((int)((P0 *)_this)->serverId), 3) ]);
		connect[ Index(((P0 *)_this)->serverId, 3) ] = 0;
#ifdef VAR_RANGES
		logval("connect[server:serverId]", ((int)connect[ Index(((int)((P0 *)_this)->serverId), 3) ]));
#endif
		;
		/* merge: i = 0(36, 30, 36) */
		reached[0][30] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)_this)->i);
		((P0 *)_this)->i = 0;
#ifdef VAR_RANGES
		logval("server:i", ((int)((P0 *)_this)->i));
#endif
		;
		/* merge: .(goto)(0, 37, 36) */
		reached[0][37] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 37: // STATE 28 - raft_sem8.pml:107 - [state[serverId] = 1] (0:36:3 - 3)
		IfNotBlocked
		reached[0][28] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = now.state[ Index(((int)((P0 *)_this)->serverId), 3) ];
		now.state[ Index(((P0 *)_this)->serverId, 3) ] = 1;
#ifdef VAR_RANGES
		logval("state[server:serverId]", now.state[ Index(((int)((P0 *)_this)->serverId), 3) ]);
#endif
		;
		/* merge: connect[serverId] = 0(36, 29, 36) */
		reached[0][29] = 1;
		(trpt+1)->bup.ovals[1] = ((int)connect[ Index(((int)((P0 *)_this)->serverId), 3) ]);
		connect[ Index(((P0 *)_this)->serverId, 3) ] = 0;
#ifdef VAR_RANGES
		logval("connect[server:serverId]", ((int)connect[ Index(((int)((P0 *)_this)->serverId), 3) ]));
#endif
		;
		/* merge: i = 0(36, 30, 36) */
		reached[0][30] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)_this)->i);
		((P0 *)_this)->i = 0;
#ifdef VAR_RANGES
		logval("server:i", ((int)((P0 *)_this)->i));
#endif
		;
		/* merge: .(goto)(0, 37, 36) */
		reached[0][37] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 38: // STATE 31 - raft_sem8.pml:110 - [((i<=(3-1)))] (36:0:2 - 1)
		IfNotBlocked
		reached[0][31] = 1;
		if (!((((int)((P0 *)_this)->i)<=(3-1))))
			continue;
		/* merge: votesGranted[i] = 0(36, 32, 36) */
		reached[0][32] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P0 *)_this)->votesGranted[ Index(((int)((P0 *)_this)->i), 3) ]);
		((P0 *)_this)->votesGranted[ Index(((P0 *)_this)->i, 3) ] = 0;
#ifdef VAR_RANGES
		logval("server:votesGranted[server:i]", ((int)((P0 *)_this)->votesGranted[ Index(((int)((P0 *)_this)->i), 3) ]));
#endif
		;
		/* merge: i = (i+1)(36, 33, 36) */
		reached[0][33] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P0 *)_this)->i);
		((P0 *)_this)->i = (((int)((P0 *)_this)->i)+1);
#ifdef VAR_RANGES
		logval("server:i", ((int)((P0 *)_this)->i));
#endif
		;
		/* merge: .(goto)(0, 37, 36) */
		reached[0][37] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 39: // STATE 39 - raft_sem8.pml:113 - [votedFor = 10] (0:0:1 - 1)
		IfNotBlocked
		reached[0][39] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)_this)->votedFor);
		((P0 *)_this)->votedFor = 10;
#ifdef VAR_RANGES
		logval("server:votedFor", ((int)((P0 *)_this)->votedFor));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 40: // STATE 41 - raft_sem8.pml:116 - [((state[serverId]==1))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][41] = 1;
		if (!((now.state[ Index(((int)((P0 *)_this)->serverId), 3) ]==1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 41: // STATE 42 - raft_sem8.pml:118 - [printf('SERVER %d: Recovering from crash,becoming follower\\n',serverId)] (0:372:5 - 1)
		IfNotBlocked
		reached[0][42] = 1;
		Printf("SERVER %d: Recovering from crash,becoming follower\n", ((int)((P0 *)_this)->serverId));
		/* merge: state[serverId] = 2(372, 43, 372) */
		reached[0][43] = 1;
		(trpt+1)->bup.ovals = grab_ints(5);
		(trpt+1)->bup.ovals[0] = now.state[ Index(((int)((P0 *)_this)->serverId), 3) ];
		now.state[ Index(((P0 *)_this)->serverId, 3) ] = 2;
#ifdef VAR_RANGES
		logval("state[server:serverId]", now.state[ Index(((int)((P0 *)_this)->serverId), 3) ]);
#endif
		;
		/* merge: votedFor = 10(372, 44, 372) */
		reached[0][44] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P0 *)_this)->votedFor);
		((P0 *)_this)->votedFor = 10;
#ifdef VAR_RANGES
		logval("server:votedFor", ((int)((P0 *)_this)->votedFor));
#endif
		;
		/* merge: time_out[serverId] = 1(372, 45, 372) */
		reached[0][45] = 1;
		(trpt+1)->bup.ovals[2] = ((int)now.time_out[ Index(((int)((P0 *)_this)->serverId), 3) ]);
		now.time_out[ Index(((P0 *)_this)->serverId, 3) ] = 1;
#ifdef VAR_RANGES
		logval("time_out[server:serverId]", ((int)now.time_out[ Index(((int)((P0 *)_this)->serverId), 3) ]));
#endif
		;
		/* merge: connect[serverId] = (3-1)(372, 46, 372) */
		reached[0][46] = 1;
		(trpt+1)->bup.ovals[3] = ((int)connect[ Index(((int)((P0 *)_this)->serverId), 3) ]);
		connect[ Index(((P0 *)_this)->serverId, 3) ] = (3-1);
#ifdef VAR_RANGES
		logval("connect[server:serverId]", ((int)connect[ Index(((int)((P0 *)_this)->serverId), 3) ]));
#endif
		;
		/* merge: consecutiveCrashes[serverId] = 0(372, 47, 372) */
		reached[0][47] = 1;
		(trpt+1)->bup.ovals[4] = ((int)now.consecutiveCrashes[ Index(((int)((P0 *)_this)->serverId), 3) ]);
		now.consecutiveCrashes[ Index(((P0 *)_this)->serverId, 3) ] = 0;
#ifdef VAR_RANGES
		logval("consecutiveCrashes[server:serverId]", ((int)now.consecutiveCrashes[ Index(((int)((P0 *)_this)->serverId), 3) ]));
#endif
		;
		/* merge: .(goto)(0, 373, 372) */
		reached[0][373] = 1;
		;
		_m = 3; goto P999; /* 6 */
	case 42: // STATE 49 - raft_sem8.pml:127 - [((((state[serverId]!=1)&&(state[serverId]!=4))&&(time_out[serverId]>0)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][49] = 1;
		if (!((((now.state[ Index(((int)((P0 *)_this)->serverId), 3) ]!=1)&&(now.state[ Index(((int)((P0 *)_this)->serverId), 3) ]!=4))&&(((int)now.time_out[ Index(((int)((P0 *)_this)->serverId), 3) ])>0))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 43: // STATE 50 - raft_sem8.pml:129 - [time_out[serverId] = (time_out[serverId]-1)] (0:372:1 - 1)
		IfNotBlocked
		reached[0][50] = 1;
		(trpt+1)->bup.oval = ((int)now.time_out[ Index(((int)((P0 *)_this)->serverId), 3) ]);
		now.time_out[ Index(((P0 *)_this)->serverId, 3) ] = (((int)now.time_out[ Index(((int)((P0 *)_this)->serverId), 3) ])-1);
#ifdef VAR_RANGES
		logval("time_out[server:serverId]", ((int)now.time_out[ Index(((int)((P0 *)_this)->serverId), 3) ]));
#endif
		;
		/* merge: printf('SERVER %d: Timer tick,time_out now %d\\n',serverId,time_out[serverId])(372, 51, 372) */
		reached[0][51] = 1;
		Printf("SERVER %d: Timer tick,time_out now %d\n", ((int)((P0 *)_this)->serverId), ((int)now.time_out[ Index(((int)((P0 *)_this)->serverId), 3) ]));
		/* merge: .(goto)(0, 373, 372) */
		reached[0][373] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 44: // STATE 53 - raft_sem8.pml:133 - [(((state[serverId]==2)&&(time_out[serverId]==0)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][53] = 1;
		if (!(((now.state[ Index(((int)((P0 *)_this)->serverId), 3) ]==2)&&(((int)now.time_out[ Index(((int)((P0 *)_this)->serverId), 3) ])==0))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 45: // STATE 54 - raft_sem8.pml:135 - [printf('SERVER %d: Timeout occurred (time_out = 0),becoming candidate\\n',serverId)] (0:64:4 - 1)
		IfNotBlocked
		reached[0][54] = 1;
		Printf("SERVER %d: Timeout occurred (time_out = 0),becoming candidate\n", ((int)((P0 *)_this)->serverId));
		/* merge: state[serverId] = 3(64, 55, 64) */
		reached[0][55] = 1;
		(trpt+1)->bup.ovals = grab_ints(4);
		(trpt+1)->bup.ovals[0] = now.state[ Index(((int)((P0 *)_this)->serverId), 3) ];
		now.state[ Index(((P0 *)_this)->serverId, 3) ] = 3;
#ifdef VAR_RANGES
		logval("state[server:serverId]", now.state[ Index(((int)((P0 *)_this)->serverId), 3) ]);
#endif
		;
		/* merge: currentTerm[serverId] = (currentTerm[serverId]+1)(64, 56, 64) */
		reached[0][56] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]);
		now.currentTerm[ Index(((P0 *)_this)->serverId, 3) ] = (((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ])+1);
#ifdef VAR_RANGES
		logval("currentTerm[server:serverId]", ((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]));
#endif
		;
		/* merge: votedFor = serverId(64, 57, 64) */
		reached[0][57] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)_this)->votedFor);
		((P0 *)_this)->votedFor = ((int)((P0 *)_this)->serverId);
#ifdef VAR_RANGES
		logval("server:votedFor", ((int)((P0 *)_this)->votedFor));
#endif
		;
		/* merge: i = 0(64, 58, 64) */
		reached[0][58] = 1;
		(trpt+1)->bup.ovals[3] = ((int)((P0 *)_this)->i);
		((P0 *)_this)->i = 0;
#ifdef VAR_RANGES
		logval("server:i", ((int)((P0 *)_this)->i));
#endif
		;
		/* merge: .(goto)(0, 65, 64) */
		reached[0][65] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 46: // STATE 59 - raft_sem8.pml:141 - [((i<=(3-1)))] (64:0:2 - 1)
		IfNotBlocked
		reached[0][59] = 1;
		if (!((((int)((P0 *)_this)->i)<=(3-1))))
			continue;
		/* merge: votesGranted[i] = 0(64, 60, 64) */
		reached[0][60] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P0 *)_this)->votesGranted[ Index(((int)((P0 *)_this)->i), 3) ]);
		((P0 *)_this)->votesGranted[ Index(((P0 *)_this)->i, 3) ] = 0;
#ifdef VAR_RANGES
		logval("server:votesGranted[server:i]", ((int)((P0 *)_this)->votesGranted[ Index(((int)((P0 *)_this)->i), 3) ]));
#endif
		;
		/* merge: i = (i+1)(64, 61, 64) */
		reached[0][61] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P0 *)_this)->i);
		((P0 *)_this)->i = (((int)((P0 *)_this)->i)+1);
#ifdef VAR_RANGES
		logval("server:i", ((int)((P0 *)_this)->i));
#endif
		;
		/* merge: .(goto)(0, 65, 64) */
		reached[0][65] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 47: // STATE 67 - raft_sem8.pml:144 - [votesGranted[serverId] = 1] (0:80:4 - 3)
		IfNotBlocked
		reached[0][67] = 1;
		(trpt+1)->bup.ovals = grab_ints(4);
		(trpt+1)->bup.ovals[0] = ((int)((P0 *)_this)->votesGranted[ Index(((int)((P0 *)_this)->serverId), 3) ]);
		((P0 *)_this)->votesGranted[ Index(((P0 *)_this)->serverId, 3) ] = 1;
#ifdef VAR_RANGES
		logval("server:votesGranted[server:serverId]", ((int)((P0 *)_this)->votesGranted[ Index(((int)((P0 *)_this)->serverId), 3) ]));
#endif
		;
		/* merge: outMsg.messageType = 2(80, 68, 80) */
		reached[0][68] = 1;
		(trpt+1)->bup.ovals[1] = ((P0 *)_this)->outMsg.messageType;
		((P0 *)_this)->outMsg.messageType = 2;
#ifdef VAR_RANGES
		logval("server:outMsg.messageType", ((P0 *)_this)->outMsg.messageType);
#endif
		;
		/* merge: outMsg.sender = serverId(80, 69, 80) */
		reached[0][69] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)_this)->outMsg.sender);
		((P0 *)_this)->outMsg.sender = ((int)((P0 *)_this)->serverId);
#ifdef VAR_RANGES
		logval("server:outMsg.sender", ((int)((P0 *)_this)->outMsg.sender));
#endif
		;
		/* merge: outMsg.requestVote.term = currentTerm[serverId](80, 70, 80) */
		reached[0][70] = 1;
		(trpt+1)->bup.ovals[3] = ((int)((P0 *)_this)->outMsg.requestVote.term);
		((P0 *)_this)->outMsg.requestVote.term = ((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]);
#ifdef VAR_RANGES
		logval("server:outMsg.requestVote.term", ((int)((P0 *)_this)->outMsg.requestVote.term));
#endif
		;
		_m = 3; goto P999; /* 3 */
	case 48: // STATE 71 - raft_sem8.pml:153 - [((logs[serverId].logs[0]==0))] (95:0:3 - 1)
		IfNotBlocked
		reached[0][71] = 1;
		if (!((((int)now.logs[ Index(((int)((P0 *)_this)->serverId), 3) ].logs[0])==0)))
			continue;
		/* merge: outMsg.requestVote.lastLogTerm = 0(95, 72, 95) */
		reached[0][72] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)((P0 *)_this)->outMsg.requestVote.lastLogTerm);
		((P0 *)_this)->outMsg.requestVote.lastLogTerm = 0;
#ifdef VAR_RANGES
		logval("server:outMsg.requestVote.lastLogTerm", ((int)((P0 *)_this)->outMsg.requestVote.lastLogTerm));
#endif
		;
		/* merge: outMsg.requestVote.lastLogIndex = 0(95, 73, 95) */
		reached[0][73] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P0 *)_this)->outMsg.requestVote.lastLogIndex);
		((P0 *)_this)->outMsg.requestVote.lastLogIndex = 0;
#ifdef VAR_RANGES
		logval("server:outMsg.requestVote.lastLogIndex", ((int)((P0 *)_this)->outMsg.requestVote.lastLogIndex));
#endif
		;
		/* merge: .(goto)(95, 81, 95) */
		reached[0][81] = 1;
		;
		/* merge: i = 0(95, 82, 95) */
		reached[0][82] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)_this)->i);
		((P0 *)_this)->i = 0;
#ifdef VAR_RANGES
		logval("server:i", ((int)((P0 *)_this)->i));
#endif
		;
		/* merge: .(goto)(0, 96, 95) */
		reached[0][96] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 49: // STATE 74 - raft_sem8.pml:156 - [(((logs[serverId].logs[0]!=0)&&(logs[serverId].logs[1]==0)))] (95:0:3 - 1)
		IfNotBlocked
		reached[0][74] = 1;
		if (!(((((int)now.logs[ Index(((int)((P0 *)_this)->serverId), 3) ].logs[0])!=0)&&(((int)now.logs[ Index(((int)((P0 *)_this)->serverId), 3) ].logs[1])==0))))
			continue;
		/* merge: outMsg.requestVote.lastLogTerm = logs[serverId].logs[0](95, 75, 95) */
		reached[0][75] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)((P0 *)_this)->outMsg.requestVote.lastLogTerm);
		((P0 *)_this)->outMsg.requestVote.lastLogTerm = ((int)now.logs[ Index(((int)((P0 *)_this)->serverId), 3) ].logs[0]);
#ifdef VAR_RANGES
		logval("server:outMsg.requestVote.lastLogTerm", ((int)((P0 *)_this)->outMsg.requestVote.lastLogTerm));
#endif
		;
		/* merge: outMsg.requestVote.lastLogIndex = 1(95, 76, 95) */
		reached[0][76] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P0 *)_this)->outMsg.requestVote.lastLogIndex);
		((P0 *)_this)->outMsg.requestVote.lastLogIndex = 1;
#ifdef VAR_RANGES
		logval("server:outMsg.requestVote.lastLogIndex", ((int)((P0 *)_this)->outMsg.requestVote.lastLogIndex));
#endif
		;
		/* merge: .(goto)(95, 81, 95) */
		reached[0][81] = 1;
		;
		/* merge: i = 0(95, 82, 95) */
		reached[0][82] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)_this)->i);
		((P0 *)_this)->i = 0;
#ifdef VAR_RANGES
		logval("server:i", ((int)((P0 *)_this)->i));
#endif
		;
		/* merge: .(goto)(0, 96, 95) */
		reached[0][96] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 50: // STATE 77 - raft_sem8.pml:159 - [(((logs[serverId].logs[0]!=0)&&(logs[serverId].logs[1]!=0)))] (95:0:3 - 1)
		IfNotBlocked
		reached[0][77] = 1;
		if (!(((((int)now.logs[ Index(((int)((P0 *)_this)->serverId), 3) ].logs[0])!=0)&&(((int)now.logs[ Index(((int)((P0 *)_this)->serverId), 3) ].logs[1])!=0))))
			continue;
		/* merge: outMsg.requestVote.lastLogTerm = logs[serverId].logs[1](95, 78, 95) */
		reached[0][78] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)((P0 *)_this)->outMsg.requestVote.lastLogTerm);
		((P0 *)_this)->outMsg.requestVote.lastLogTerm = ((int)now.logs[ Index(((int)((P0 *)_this)->serverId), 3) ].logs[1]);
#ifdef VAR_RANGES
		logval("server:outMsg.requestVote.lastLogTerm", ((int)((P0 *)_this)->outMsg.requestVote.lastLogTerm));
#endif
		;
		/* merge: outMsg.requestVote.lastLogIndex = 2(95, 79, 95) */
		reached[0][79] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P0 *)_this)->outMsg.requestVote.lastLogIndex);
		((P0 *)_this)->outMsg.requestVote.lastLogIndex = 2;
#ifdef VAR_RANGES
		logval("server:outMsg.requestVote.lastLogIndex", ((int)((P0 *)_this)->outMsg.requestVote.lastLogIndex));
#endif
		;
		/* merge: .(goto)(95, 81, 95) */
		reached[0][81] = 1;
		;
		/* merge: i = 0(95, 82, 95) */
		reached[0][82] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)_this)->i);
		((P0 *)_this)->i = 0;
#ifdef VAR_RANGES
		logval("server:i", ((int)((P0 *)_this)->i));
#endif
		;
		/* merge: .(goto)(0, 96, 95) */
		reached[0][96] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 51: // STATE 82 - raft_sem8.pml:165 - [i = 0] (0:95:1 - 4)
		IfNotBlocked
		reached[0][82] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)_this)->i);
		((P0 *)_this)->i = 0;
#ifdef VAR_RANGES
		logval("server:i", ((int)((P0 *)_this)->i));
#endif
		;
		/* merge: .(goto)(0, 96, 95) */
		reached[0][96] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 52: // STATE 83 - raft_sem8.pml:165 - [((i<=(3-1)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][83] = 1;
		if (!((((int)((P0 *)_this)->i)<=(3-1))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 53: // STATE 84 - raft_sem8.pml:167 - [((i!=serverId))] (87:0:1 - 1)
		IfNotBlocked
		reached[0][84] = 1;
		if (!((((int)((P0 *)_this)->i)!=((int)((P0 *)_this)->serverId))))
			continue;
		/* merge: outMsg.receiver = i(87, 85, 87) */
		reached[0][85] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)_this)->outMsg.receiver);
		((P0 *)_this)->outMsg.receiver = ((int)((P0 *)_this)->i);
#ifdef VAR_RANGES
		logval("server:outMsg.receiver", ((int)((P0 *)_this)->outMsg.receiver));
#endif
		;
		/* merge: printf('SERVER %d: Sending RequestVote to server %d for term %d\\n',serverId,i,currentTerm[serverId])(87, 86, 87) */
		reached[0][86] = 1;
		Printf("SERVER %d: Sending RequestVote to server %d for term %d\n", ((int)((P0 *)_this)->serverId), ((int)((P0 *)_this)->i), ((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]));
		_m = 3; goto P999; /* 2 */
	case 54: // STATE 87 - raft_sem8.pml:170 - [toNodes[i]!outMsg.messageType,outMsg.sender,outMsg.receiver,outMsg.appendEntry.term,outMsg.appendEntry.leaderCommit,outMsg.appendEntry.index,outMsg.appendEntry.prevLogTerm,outMsg.appendEntryResponse.term,outMsg.appendEntryResponse.success,outMsg.requestVote.term,outMsg.requestVote.lastLogIndex,outMsg.requestVote.lastLogTerm,outMsg.requestVoteResponse.term,outMsg.requestVoteResponse.voteGranted] (95:0:1 - 1)
		IfNotBlocked
		reached[0][87] = 1;
		if (q_full(now.toNodes[ Index(((int)((P0 *)_this)->i), 3) ]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.toNodes[ Index(((int)((P0 *)_this)->i), 3) ]);
		sprintf(simtmp, "%d", ((P0 *)_this)->outMsg.messageType); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->outMsg.sender)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->outMsg.receiver)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->outMsg.appendEntry.term)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->outMsg.appendEntry.leaderCommit)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->outMsg.appendEntry.index)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->outMsg.appendEntry.prevLogTerm)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->outMsg.appendEntryResponse.term)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->outMsg.appendEntryResponse.success)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->outMsg.requestVote.term)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->outMsg.requestVote.lastLogIndex)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->outMsg.requestVote.lastLogTerm)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->outMsg.requestVoteResponse.term)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->outMsg.requestVoteResponse.voteGranted)); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.toNodes[ Index(((int)((P0 *)_this)->i), 3) ], 0, ((P0 *)_this)->outMsg.messageType, ((int)((P0 *)_this)->outMsg.sender), ((int)((P0 *)_this)->outMsg.receiver), ((int)((P0 *)_this)->outMsg.appendEntry.term), ((int)((P0 *)_this)->outMsg.appendEntry.leaderCommit), ((int)((P0 *)_this)->outMsg.appendEntry.index), ((int)((P0 *)_this)->outMsg.appendEntry.prevLogTerm), ((int)((P0 *)_this)->outMsg.appendEntryResponse.term), ((int)((P0 *)_this)->outMsg.appendEntryResponse.success), ((int)((P0 *)_this)->outMsg.requestVote.term), ((int)((P0 *)_this)->outMsg.requestVote.lastLogIndex), ((int)((P0 *)_this)->outMsg.requestVote.lastLogTerm), ((int)((P0 *)_this)->outMsg.requestVoteResponse.term), ((int)((P0 *)_this)->outMsg.requestVoteResponse.voteGranted), 14);
		/* merge: .(goto)(95, 91, 95) */
		reached[0][91] = 1;
		;
		/* merge: i = (i+1)(95, 92, 95) */
		reached[0][92] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)_this)->i);
		((P0 *)_this)->i = (((int)((P0 *)_this)->i)+1);
#ifdef VAR_RANGES
		logval("server:i", ((int)((P0 *)_this)->i));
#endif
		;
		/* merge: .(goto)(0, 96, 95) */
		reached[0][96] = 1;
		;
		_m = 2; goto P999; /* 3 */
	case 55: // STATE 89 - raft_sem8.pml:171 - [(1)] (95:0:1 - 1)
		IfNotBlocked
		reached[0][89] = 1;
		if (!(1))
			continue;
		/* merge: .(goto)(95, 91, 95) */
		reached[0][91] = 1;
		;
		/* merge: i = (i+1)(95, 92, 95) */
		reached[0][92] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)_this)->i);
		((P0 *)_this)->i = (((int)((P0 *)_this)->i)+1);
#ifdef VAR_RANGES
		logval("server:i", ((int)((P0 *)_this)->i));
#endif
		;
		/* merge: .(goto)(0, 96, 95) */
		reached[0][96] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 56: // STATE 92 - raft_sem8.pml:165 - [i = (i+1)] (0:95:1 - 3)
		IfNotBlocked
		reached[0][92] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)_this)->i);
		((P0 *)_this)->i = (((int)((P0 *)_this)->i)+1);
#ifdef VAR_RANGES
		logval("server:i", ((int)((P0 *)_this)->i));
#endif
		;
		/* merge: .(goto)(0, 96, 95) */
		reached[0][96] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 57: // STATE 98 - raft_sem8.pml:175 - [printf('SERVER %d: Now candidate for term %d,voted for self\\n',serverId,currentTerm[serverId])] (0:0:0 - 1)
		IfNotBlocked
		reached[0][98] = 1;
		Printf("SERVER %d: Now candidate for term %d,voted for self\n", ((int)((P0 *)_this)->serverId), ((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]));
		_m = 3; goto P999; /* 0 */
	case 58: // STATE 100 - raft_sem8.pml:178 - [(((state[serverId]==3)&&(time_out[serverId]==0)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][100] = 1;
		if (!(((now.state[ Index(((int)((P0 *)_this)->serverId), 3) ]==3)&&(((int)now.time_out[ Index(((int)((P0 *)_this)->serverId), 3) ])==0))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 59: // STATE 101 - raft_sem8.pml:181 - [voteCount = 0] (0:113:2 - 1)
		IfNotBlocked
		reached[0][101] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P0 *)_this)->voteCount);
		((P0 *)_this)->voteCount = 0;
#ifdef VAR_RANGES
		logval("server:voteCount", ((int)((P0 *)_this)->voteCount));
#endif
		;
		/* merge: i = 0(113, 102, 113) */
		reached[0][102] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P0 *)_this)->i);
		((P0 *)_this)->i = 0;
#ifdef VAR_RANGES
		logval("server:i", ((int)((P0 *)_this)->i));
#endif
		;
		/* merge: .(goto)(0, 114, 113) */
		reached[0][114] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 60: // STATE 103 - raft_sem8.pml:182 - [((i<=(3-1)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][103] = 1;
		if (!((((int)((P0 *)_this)->i)<=(3-1))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 61: // STATE 104 - raft_sem8.pml:184 - [(votesGranted[i])] (113:0:2 - 1)
		IfNotBlocked
		reached[0][104] = 1;
		if (!(((int)((P0 *)_this)->votesGranted[ Index(((int)((P0 *)_this)->i), 3) ])))
			continue;
		/* merge: voteCount = (voteCount+1)(113, 105, 113) */
		reached[0][105] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P0 *)_this)->voteCount);
		((P0 *)_this)->voteCount = (((int)((P0 *)_this)->voteCount)+1);
#ifdef VAR_RANGES
		logval("server:voteCount", ((int)((P0 *)_this)->voteCount));
#endif
		;
		/* merge: .(goto)(113, 109, 113) */
		reached[0][109] = 1;
		;
		/* merge: i = (i+1)(113, 110, 113) */
		reached[0][110] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P0 *)_this)->i);
		((P0 *)_this)->i = (((int)((P0 *)_this)->i)+1);
#ifdef VAR_RANGES
		logval("server:i", ((int)((P0 *)_this)->i));
#endif
		;
		/* merge: .(goto)(0, 114, 113) */
		reached[0][114] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 62: // STATE 107 - raft_sem8.pml:185 - [(1)] (113:0:1 - 1)
		IfNotBlocked
		reached[0][107] = 1;
		if (!(1))
			continue;
		/* merge: .(goto)(113, 109, 113) */
		reached[0][109] = 1;
		;
		/* merge: i = (i+1)(113, 110, 113) */
		reached[0][110] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)_this)->i);
		((P0 *)_this)->i = (((int)((P0 *)_this)->i)+1);
#ifdef VAR_RANGES
		logval("server:i", ((int)((P0 *)_this)->i));
#endif
		;
		/* merge: .(goto)(0, 114, 113) */
		reached[0][114] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 63: // STATE 110 - raft_sem8.pml:182 - [i = (i+1)] (0:113:1 - 3)
		IfNotBlocked
		reached[0][110] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)_this)->i);
		((P0 *)_this)->i = (((int)((P0 *)_this)->i)+1);
#ifdef VAR_RANGES
		logval("server:i", ((int)((P0 *)_this)->i));
#endif
		;
		/* merge: .(goto)(0, 114, 113) */
		reached[0][114] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 64: // STATE 116 - raft_sem8.pml:191 - [((voteCount>(3/2)))] (140:0:5 - 1)
		IfNotBlocked
		reached[0][116] = 1;
		if (!((((int)((P0 *)_this)->voteCount)>(3/2))))
			continue;
		/* merge: state[serverId] = 4(140, 117, 140) */
		reached[0][117] = 1;
		(trpt+1)->bup.ovals = grab_ints(5);
		(trpt+1)->bup.ovals[0] = now.state[ Index(((int)((P0 *)_this)->serverId), 3) ];
		now.state[ Index(((P0 *)_this)->serverId, 3) ] = 4;
#ifdef VAR_RANGES
		logval("state[server:serverId]", now.state[ Index(((int)((P0 *)_this)->serverId), 3) ]);
#endif
		;
		/* merge: leaders = (leaders+1)(140, 118, 140) */
		reached[0][118] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.leaders);
		now.leaders = (((int)now.leaders)+1);
#ifdef VAR_RANGES
		logval("leaders", ((int)now.leaders));
#endif
		;
		/* merge: isLeader = 1(140, 119, 140) */
		reached[0][119] = 1;
		(trpt+1)->bup.ovals[2] = ((int)now.isLeader);
		now.isLeader = 1;
#ifdef VAR_RANGES
		logval("isLeader", ((int)now.isLeader));
#endif
		;
		/* merge: leader[serverId] = 1(140, 120, 140) */
		reached[0][120] = 1;
		(trpt+1)->bup.ovals[3] = ((int)leader[ Index(((int)((P0 *)_this)->serverId), 3) ]);
		leader[ Index(((P0 *)_this)->serverId, 3) ] = 1;
#ifdef VAR_RANGES
		logval("leader[server:serverId]", ((int)leader[ Index(((int)((P0 *)_this)->serverId), 3) ]));
#endif
		;
		/* merge: printf('SERVER %d: Becoming leader for term %d with %d votes\\n',serverId,currentTerm[serverId],voteCount)(140, 121, 140) */
		reached[0][121] = 1;
		Printf("SERVER %d: Becoming leader for term %d with %d votes\n", ((int)((P0 *)_this)->serverId), ((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]), ((int)((P0 *)_this)->voteCount));
		/* merge: i = 0(140, 122, 140) */
		reached[0][122] = 1;
		(trpt+1)->bup.ovals[4] = ((int)((P0 *)_this)->i);
		((P0 *)_this)->i = 0;
#ifdef VAR_RANGES
		logval("server:i", ((int)((P0 *)_this)->i));
#endif
		;
		/* merge: .(goto)(0, 141, 140) */
		reached[0][141] = 1;
		;
		_m = 3; goto P999; /* 7 */
	case 65: // STATE 123 - raft_sem8.pml:198 - [((i<=(3-1)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][123] = 1;
		if (!((((int)((P0 *)_this)->i)<=(3-1))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 66: // STATE 124 - raft_sem8.pml:200 - [((i!=serverId))] (132:0:6 - 1)
		IfNotBlocked
		reached[0][124] = 1;
		if (!((((int)((P0 *)_this)->i)!=((int)((P0 *)_this)->serverId))))
			continue;
		/* merge: outMsg.messageType = 4(132, 125, 132) */
		reached[0][125] = 1;
		(trpt+1)->bup.ovals = grab_ints(6);
		(trpt+1)->bup.ovals[0] = ((P0 *)_this)->outMsg.messageType;
		((P0 *)_this)->outMsg.messageType = 4;
#ifdef VAR_RANGES
		logval("server:outMsg.messageType", ((P0 *)_this)->outMsg.messageType);
#endif
		;
		/* merge: outMsg.sender = serverId(132, 126, 132) */
		reached[0][126] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P0 *)_this)->outMsg.sender);
		((P0 *)_this)->outMsg.sender = ((int)((P0 *)_this)->serverId);
#ifdef VAR_RANGES
		logval("server:outMsg.sender", ((int)((P0 *)_this)->outMsg.sender));
#endif
		;
		/* merge: outMsg.receiver = i(132, 127, 132) */
		reached[0][127] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)_this)->outMsg.receiver);
		((P0 *)_this)->outMsg.receiver = ((int)((P0 *)_this)->i);
#ifdef VAR_RANGES
		logval("server:outMsg.receiver", ((int)((P0 *)_this)->outMsg.receiver));
#endif
		;
		/* merge: outMsg.appendEntry.term = currentTerm[serverId](132, 128, 132) */
		reached[0][128] = 1;
		(trpt+1)->bup.ovals[3] = ((int)((P0 *)_this)->outMsg.appendEntry.term);
		((P0 *)_this)->outMsg.appendEntry.term = ((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]);
#ifdef VAR_RANGES
		logval("server:outMsg.appendEntry.term", ((int)((P0 *)_this)->outMsg.appendEntry.term));
#endif
		;
		/* merge: outMsg.appendEntry.leaderCommit = commitIndex[serverId](132, 129, 132) */
		reached[0][129] = 1;
		(trpt+1)->bup.ovals[4] = ((int)((P0 *)_this)->outMsg.appendEntry.leaderCommit);
		((P0 *)_this)->outMsg.appendEntry.leaderCommit = ((int)now.commitIndex[ Index(((int)((P0 *)_this)->serverId), 3) ]);
#ifdef VAR_RANGES
		logval("server:outMsg.appendEntry.leaderCommit", ((int)((P0 *)_this)->outMsg.appendEntry.leaderCommit));
#endif
		;
		/* merge: outMsg.appendEntry.index = 10(132, 130, 132) */
		reached[0][130] = 1;
		(trpt+1)->bup.ovals[5] = ((int)((P0 *)_this)->outMsg.appendEntry.index);
		((P0 *)_this)->outMsg.appendEntry.index = 10;
#ifdef VAR_RANGES
		logval("server:outMsg.appendEntry.index", ((int)((P0 *)_this)->outMsg.appendEntry.index));
#endif
		;
		/* merge: printf('SERVER %d: Sending initial heartbeat to server %d\\n',serverId,i)(132, 131, 132) */
		reached[0][131] = 1;
		Printf("SERVER %d: Sending initial heartbeat to server %d\n", ((int)((P0 *)_this)->serverId), ((int)((P0 *)_this)->i));
		_m = 3; goto P999; /* 7 */
	case 67: // STATE 132 - raft_sem8.pml:208 - [toNodes[i]!outMsg.messageType,outMsg.sender,outMsg.receiver,outMsg.appendEntry.term,outMsg.appendEntry.leaderCommit,outMsg.appendEntry.index,outMsg.appendEntry.prevLogTerm,outMsg.appendEntryResponse.term,outMsg.appendEntryResponse.success,outMsg.requestVote.term,outMsg.requestVote.lastLogIndex,outMsg.requestVote.lastLogTerm,outMsg.requestVoteResponse.term,outMsg.requestVoteResponse.voteGranted] (140:0:1 - 1)
		IfNotBlocked
		reached[0][132] = 1;
		if (q_full(now.toNodes[ Index(((int)((P0 *)_this)->i), 3) ]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.toNodes[ Index(((int)((P0 *)_this)->i), 3) ]);
		sprintf(simtmp, "%d", ((P0 *)_this)->outMsg.messageType); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->outMsg.sender)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->outMsg.receiver)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->outMsg.appendEntry.term)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->outMsg.appendEntry.leaderCommit)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->outMsg.appendEntry.index)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->outMsg.appendEntry.prevLogTerm)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->outMsg.appendEntryResponse.term)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->outMsg.appendEntryResponse.success)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->outMsg.requestVote.term)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->outMsg.requestVote.lastLogIndex)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->outMsg.requestVote.lastLogTerm)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->outMsg.requestVoteResponse.term)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->outMsg.requestVoteResponse.voteGranted)); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.toNodes[ Index(((int)((P0 *)_this)->i), 3) ], 0, ((P0 *)_this)->outMsg.messageType, ((int)((P0 *)_this)->outMsg.sender), ((int)((P0 *)_this)->outMsg.receiver), ((int)((P0 *)_this)->outMsg.appendEntry.term), ((int)((P0 *)_this)->outMsg.appendEntry.leaderCommit), ((int)((P0 *)_this)->outMsg.appendEntry.index), ((int)((P0 *)_this)->outMsg.appendEntry.prevLogTerm), ((int)((P0 *)_this)->outMsg.appendEntryResponse.term), ((int)((P0 *)_this)->outMsg.appendEntryResponse.success), ((int)((P0 *)_this)->outMsg.requestVote.term), ((int)((P0 *)_this)->outMsg.requestVote.lastLogIndex), ((int)((P0 *)_this)->outMsg.requestVote.lastLogTerm), ((int)((P0 *)_this)->outMsg.requestVoteResponse.term), ((int)((P0 *)_this)->outMsg.requestVoteResponse.voteGranted), 14);
		/* merge: .(goto)(140, 136, 140) */
		reached[0][136] = 1;
		;
		/* merge: i = (i+1)(140, 137, 140) */
		reached[0][137] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)_this)->i);
		((P0 *)_this)->i = (((int)((P0 *)_this)->i)+1);
#ifdef VAR_RANGES
		logval("server:i", ((int)((P0 *)_this)->i));
#endif
		;
		/* merge: .(goto)(0, 141, 140) */
		reached[0][141] = 1;
		;
		_m = 2; goto P999; /* 3 */
	case 68: // STATE 134 - raft_sem8.pml:209 - [(1)] (140:0:1 - 1)
		IfNotBlocked
		reached[0][134] = 1;
		if (!(1))
			continue;
		/* merge: .(goto)(140, 136, 140) */
		reached[0][136] = 1;
		;
		/* merge: i = (i+1)(140, 137, 140) */
		reached[0][137] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)_this)->i);
		((P0 *)_this)->i = (((int)((P0 *)_this)->i)+1);
#ifdef VAR_RANGES
		logval("server:i", ((int)((P0 *)_this)->i));
#endif
		;
		/* merge: .(goto)(0, 141, 140) */
		reached[0][141] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 69: // STATE 137 - raft_sem8.pml:198 - [i = (i+1)] (0:140:1 - 3)
		IfNotBlocked
		reached[0][137] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)_this)->i);
		((P0 *)_this)->i = (((int)((P0 *)_this)->i)+1);
#ifdef VAR_RANGES
		logval("server:i", ((int)((P0 *)_this)->i));
#endif
		;
		/* merge: .(goto)(0, 141, 140) */
		reached[0][141] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 70: // STATE 147 - raft_sem8.pml:217 - [.(goto)] (0:372:0 - 2)
		IfNotBlocked
		reached[0][147] = 1;
		;
		/* merge: .(goto)(0, 373, 372) */
		reached[0][373] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 71: // STATE 144 - raft_sem8.pml:214 - [printf('SERVER %d: Election timeout without majority,restarting election\\n',serverId)] (0:372:1 - 1)
		IfNotBlocked
		reached[0][144] = 1;
		Printf("SERVER %d: Election timeout without majority,restarting election\n", ((int)((P0 *)_this)->serverId));
		/* merge: time_out[serverId] = 1(372, 145, 372) */
		reached[0][145] = 1;
		(trpt+1)->bup.oval = ((int)now.time_out[ Index(((int)((P0 *)_this)->serverId), 3) ]);
		now.time_out[ Index(((P0 *)_this)->serverId, 3) ] = 1;
#ifdef VAR_RANGES
		logval("time_out[server:serverId]", ((int)now.time_out[ Index(((int)((P0 *)_this)->serverId), 3) ]));
#endif
		;
		/* merge: .(goto)(372, 147, 372) */
		reached[0][147] = 1;
		;
		/* merge: .(goto)(0, 373, 372) */
		reached[0][373] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 72: // STATE 149 - raft_sem8.pml:219 - [((state[serverId]==2))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][149] = 1;
		if (!((now.state[ Index(((int)((P0 *)_this)->serverId), 3) ]==2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 73: // STATE 150 - raft_sem8.pml:221 - [printf('SERVER %d: Restarting as follower,resetting timeout\\n',serverId)] (0:372:1 - 1)
		IfNotBlocked
		reached[0][150] = 1;
		Printf("SERVER %d: Restarting as follower,resetting timeout\n", ((int)((P0 *)_this)->serverId));
		/* merge: time_out[serverId] = 1(372, 151, 372) */
		reached[0][151] = 1;
		(trpt+1)->bup.oval = ((int)now.time_out[ Index(((int)((P0 *)_this)->serverId), 3) ]);
		now.time_out[ Index(((P0 *)_this)->serverId, 3) ] = 1;
#ifdef VAR_RANGES
		logval("time_out[server:serverId]", ((int)now.time_out[ Index(((int)((P0 *)_this)->serverId), 3) ]));
#endif
		;
		/* merge: .(goto)(0, 373, 372) */
		reached[0][373] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 74: // STATE 153 - raft_sem8.pml:225 - [((toNodes[serverId]?[msg.messageType,msg.sender,msg.receiver,msg.appendEntry.term,msg.appendEntry.leaderCommit,msg.appendEntry.index,msg.appendEntry.prevLogTerm,msg.appendEntryResponse.term,msg.appendEntryResponse.success,msg.requestVote.term,msg.requestVote.lastLogIndex,msg.requestVote.lastLogTerm,msg.requestVoteResponse.term,msg.requestVoteResponse.voteGranted]&&(state[serverId]!=1)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][153] = 1;
		if (!(((q_len(now.toNodes[ Index(((int)((P0 *)_this)->serverId), 3) ]) > 0)&&(now.state[ Index(((int)((P0 *)_this)->serverId), 3) ]!=1))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 75: // STATE 154 - raft_sem8.pml:227 - [toNodes[serverId]?msg.messageType,msg.sender,msg.receiver,msg.appendEntry.term,msg.appendEntry.leaderCommit,msg.appendEntry.index,msg.appendEntry.prevLogTerm,msg.appendEntryResponse.term,msg.appendEntryResponse.success,msg.requestVote.term,msg.requestVote.lastLogIndex,msg.requestVote.lastLogTerm,msg.requestVoteResponse.term,msg.requestVoteResponse.voteGranted] (324:0:15 - 1)
		reached[0][154] = 1;
		if (q_len(now.toNodes[ Index(((int)((P0 *)_this)->serverId), 3) ]) == 0) continue;

		XX=1;
		(trpt+1)->bup.ovals = grab_ints(15);
		(trpt+1)->bup.ovals[0] = ((P0 *)_this)->msg.messageType;
		(trpt+1)->bup.ovals[1] = ((int)((P0 *)_this)->msg.sender);
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)_this)->msg.receiver);
		(trpt+1)->bup.ovals[3] = ((int)((P0 *)_this)->msg.appendEntry.term);
		(trpt+1)->bup.ovals[4] = ((int)((P0 *)_this)->msg.appendEntry.leaderCommit);
		(trpt+1)->bup.ovals[5] = ((int)((P0 *)_this)->msg.appendEntry.index);
		(trpt+1)->bup.ovals[6] = ((int)((P0 *)_this)->msg.appendEntry.prevLogTerm);
		(trpt+1)->bup.ovals[7] = ((int)((P0 *)_this)->msg.appendEntryResponse.term);
		(trpt+1)->bup.ovals[8] = ((int)((P0 *)_this)->msg.appendEntryResponse.success);
		(trpt+1)->bup.ovals[9] = ((int)((P0 *)_this)->msg.requestVote.term);
		(trpt+1)->bup.ovals[10] = ((int)((P0 *)_this)->msg.requestVote.lastLogIndex);
		(trpt+1)->bup.ovals[11] = ((int)((P0 *)_this)->msg.requestVote.lastLogTerm);
		(trpt+1)->bup.ovals[12] = ((int)((P0 *)_this)->msg.requestVoteResponse.term);
		(trpt+1)->bup.ovals[13] = ((int)((P0 *)_this)->msg.requestVoteResponse.voteGranted);
		;
		((P0 *)_this)->msg.messageType = qrecv(now.toNodes[ Index(((int)((P0 *)_this)->serverId), 3) ], XX-1, 0, 0);
#ifdef VAR_RANGES
		logval("server:msg.messageType", ((P0 *)_this)->msg.messageType);
#endif
		;
		((P0 *)_this)->msg.sender = qrecv(now.toNodes[ Index(((int)((P0 *)_this)->serverId), 3) ], XX-1, 1, 0);
#ifdef VAR_RANGES
		logval("server:msg.sender", ((int)((P0 *)_this)->msg.sender));
#endif
		;
		((P0 *)_this)->msg.receiver = qrecv(now.toNodes[ Index(((int)((P0 *)_this)->serverId), 3) ], XX-1, 2, 0);
#ifdef VAR_RANGES
		logval("server:msg.receiver", ((int)((P0 *)_this)->msg.receiver));
#endif
		;
		((P0 *)_this)->msg.appendEntry.term = qrecv(now.toNodes[ Index(((int)((P0 *)_this)->serverId), 3) ], XX-1, 3, 0);
#ifdef VAR_RANGES
		logval("server:msg.appendEntry.term", ((int)((P0 *)_this)->msg.appendEntry.term));
#endif
		;
		((P0 *)_this)->msg.appendEntry.leaderCommit = qrecv(now.toNodes[ Index(((int)((P0 *)_this)->serverId), 3) ], XX-1, 4, 0);
#ifdef VAR_RANGES
		logval("server:msg.appendEntry.leaderCommit", ((int)((P0 *)_this)->msg.appendEntry.leaderCommit));
#endif
		;
		((P0 *)_this)->msg.appendEntry.index = qrecv(now.toNodes[ Index(((int)((P0 *)_this)->serverId), 3) ], XX-1, 5, 0);
#ifdef VAR_RANGES
		logval("server:msg.appendEntry.index", ((int)((P0 *)_this)->msg.appendEntry.index));
#endif
		;
		((P0 *)_this)->msg.appendEntry.prevLogTerm = qrecv(now.toNodes[ Index(((int)((P0 *)_this)->serverId), 3) ], XX-1, 6, 0);
#ifdef VAR_RANGES
		logval("server:msg.appendEntry.prevLogTerm", ((int)((P0 *)_this)->msg.appendEntry.prevLogTerm));
#endif
		;
		((P0 *)_this)->msg.appendEntryResponse.term = qrecv(now.toNodes[ Index(((int)((P0 *)_this)->serverId), 3) ], XX-1, 7, 0);
#ifdef VAR_RANGES
		logval("server:msg.appendEntryResponse.term", ((int)((P0 *)_this)->msg.appendEntryResponse.term));
#endif
		;
		((P0 *)_this)->msg.appendEntryResponse.success = qrecv(now.toNodes[ Index(((int)((P0 *)_this)->serverId), 3) ], XX-1, 8, 0);
#ifdef VAR_RANGES
		logval("server:msg.appendEntryResponse.success", ((int)((P0 *)_this)->msg.appendEntryResponse.success));
#endif
		;
		((P0 *)_this)->msg.requestVote.term = qrecv(now.toNodes[ Index(((int)((P0 *)_this)->serverId), 3) ], XX-1, 9, 0);
#ifdef VAR_RANGES
		logval("server:msg.requestVote.term", ((int)((P0 *)_this)->msg.requestVote.term));
#endif
		;
		((P0 *)_this)->msg.requestVote.lastLogIndex = qrecv(now.toNodes[ Index(((int)((P0 *)_this)->serverId), 3) ], XX-1, 10, 0);
#ifdef VAR_RANGES
		logval("server:msg.requestVote.lastLogIndex", ((int)((P0 *)_this)->msg.requestVote.lastLogIndex));
#endif
		;
		((P0 *)_this)->msg.requestVote.lastLogTerm = qrecv(now.toNodes[ Index(((int)((P0 *)_this)->serverId), 3) ], XX-1, 11, 0);
#ifdef VAR_RANGES
		logval("server:msg.requestVote.lastLogTerm", ((int)((P0 *)_this)->msg.requestVote.lastLogTerm));
#endif
		;
		((P0 *)_this)->msg.requestVoteResponse.term = qrecv(now.toNodes[ Index(((int)((P0 *)_this)->serverId), 3) ], XX-1, 12, 0);
#ifdef VAR_RANGES
		logval("server:msg.requestVoteResponse.term", ((int)((P0 *)_this)->msg.requestVoteResponse.term));
#endif
		;
		((P0 *)_this)->msg.requestVoteResponse.voteGranted = qrecv(now.toNodes[ Index(((int)((P0 *)_this)->serverId), 3) ], XX-1, 13, 1);
#ifdef VAR_RANGES
		logval("server:msg.requestVoteResponse.voteGranted", ((int)((P0 *)_this)->msg.requestVoteResponse.voteGranted));
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.toNodes[ Index(((int)((P0 *)_this)->serverId), 3) ]);
		sprintf(simtmp, "%d", ((P0 *)_this)->msg.messageType); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->msg.sender)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->msg.receiver)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->msg.appendEntry.term)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->msg.appendEntry.leaderCommit)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->msg.appendEntry.index)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->msg.appendEntry.prevLogTerm)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->msg.appendEntryResponse.term)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->msg.appendEntryResponse.success)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->msg.requestVote.term)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->msg.requestVote.lastLogIndex)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->msg.requestVote.lastLogTerm)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->msg.requestVoteResponse.term)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->msg.requestVoteResponse.voteGranted)); strcat(simvals, simtmp);		}
#endif
		;
		/* merge: sender = msg.sender(0, 155, 324) */
		reached[0][155] = 1;
		(trpt+1)->bup.ovals[14] = ((int)((P0 *)_this)->_11_7_sender);
		((P0 *)_this)->_11_7_sender = ((int)((P0 *)_this)->msg.sender);
#ifdef VAR_RANGES
		logval("server:sender", ((int)((P0 *)_this)->_11_7_sender));
#endif
		;
		_m = 4; goto P999; /* 1 */
	case 76: // STATE 156 - raft_sem8.pml:232 - [((msg.messageType==2))] (175:0:0 - 1)
		IfNotBlocked
		reached[0][156] = 1;
		if (!((((P0 *)_this)->msg.messageType==2)))
			continue;
		/* merge: printf('SERVER %d: Received RequestVote from server %d for term %d\\n',serverId,sender,msg.requestVote.term)(0, 157, 175) */
		reached[0][157] = 1;
		Printf("SERVER %d: Received RequestVote from server %d for term %d\n", ((int)((P0 *)_this)->serverId), ((int)((P0 *)_this)->_11_7_sender), ((int)((P0 *)_this)->msg.requestVote.term));
		_m = 3; goto P999; /* 1 */
	case 77: // STATE 158 - raft_sem8.pml:237 - [((msg.requestVote.term>currentTerm[serverId]))] (166:0:0 - 1)
		IfNotBlocked
		reached[0][158] = 1;
		if (!((((int)((P0 *)_this)->msg.requestVote.term)>((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]))))
			continue;
		/* merge: printf('SERVER %d: Updating term from %d to %d and becoming follower\\n',serverId,currentTerm[serverId],msg.requestVote.term)(0, 159, 166) */
		reached[0][159] = 1;
		Printf("SERVER %d: Updating term from %d to %d and becoming follower\n", ((int)((P0 *)_this)->serverId), ((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]), ((int)((P0 *)_this)->msg.requestVote.term));
		_m = 3; goto P999; /* 1 */
	case 78: // STATE 160 - raft_sem8.pml:240 - [((state[serverId]==4))] (189:0:7 - 1)
		IfNotBlocked
		reached[0][160] = 1;
		if (!((now.state[ Index(((int)((P0 *)_this)->serverId), 3) ]==4)))
			continue;
		/* merge: leaders = (leaders-1)(189, 161, 189) */
		reached[0][161] = 1;
		(trpt+1)->bup.ovals = grab_ints(7);
		(trpt+1)->bup.ovals[0] = ((int)now.leaders);
		now.leaders = (((int)now.leaders)-1);
#ifdef VAR_RANGES
		logval("leaders", ((int)now.leaders));
#endif
		;
		/* merge: isLeader = (leaders>0)(189, 162, 189) */
		reached[0][162] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.isLeader);
		now.isLeader = (((int)now.leaders)>0);
#ifdef VAR_RANGES
		logval("isLeader", ((int)now.isLeader));
#endif
		;
		/* merge: leader[serverId] = 0(189, 163, 189) */
		reached[0][163] = 1;
		(trpt+1)->bup.ovals[2] = ((int)leader[ Index(((int)((P0 *)_this)->serverId), 3) ]);
		leader[ Index(((P0 *)_this)->serverId, 3) ] = 0;
#ifdef VAR_RANGES
		logval("leader[server:serverId]", ((int)leader[ Index(((int)((P0 *)_this)->serverId), 3) ]));
#endif
		;
		/* merge: .(goto)(189, 167, 189) */
		reached[0][167] = 1;
		;
		/* merge: currentTerm[serverId] = msg.requestVote.term(189, 168, 189) */
		reached[0][168] = 1;
		(trpt+1)->bup.ovals[3] = ((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]);
		now.currentTerm[ Index(((P0 *)_this)->serverId, 3) ] = ((int)((P0 *)_this)->msg.requestVote.term);
#ifdef VAR_RANGES
		logval("currentTerm[server:serverId]", ((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]));
#endif
		;
		/* merge: state[serverId] = 2(189, 169, 189) */
		reached[0][169] = 1;
		(trpt+1)->bup.ovals[4] = now.state[ Index(((int)((P0 *)_this)->serverId), 3) ];
		now.state[ Index(((P0 *)_this)->serverId, 3) ] = 2;
#ifdef VAR_RANGES
		logval("state[server:serverId]", now.state[ Index(((int)((P0 *)_this)->serverId), 3) ]);
#endif
		;
		/* merge: votedFor = 10(189, 170, 189) */
		reached[0][170] = 1;
		(trpt+1)->bup.ovals[5] = ((int)((P0 *)_this)->votedFor);
		((P0 *)_this)->votedFor = 10;
#ifdef VAR_RANGES
		logval("server:votedFor", ((int)((P0 *)_this)->votedFor));
#endif
		;
		/* merge: time_out[serverId] = 1(189, 171, 189) */
		reached[0][171] = 1;
		(trpt+1)->bup.ovals[6] = ((int)now.time_out[ Index(((int)((P0 *)_this)->serverId), 3) ]);
		now.time_out[ Index(((P0 *)_this)->serverId, 3) ] = 1;
#ifdef VAR_RANGES
		logval("time_out[server:serverId]", ((int)now.time_out[ Index(((int)((P0 *)_this)->serverId), 3) ]));
#endif
		;
		/* merge: .(goto)(0, 176, 189) */
		reached[0][176] = 1;
		;
		_m = 3; goto P999; /* 9 */
	case 79: // STATE 165 - raft_sem8.pml:244 - [(1)] (189:0:4 - 1)
		IfNotBlocked
		reached[0][165] = 1;
		if (!(1))
			continue;
		/* merge: .(goto)(189, 167, 189) */
		reached[0][167] = 1;
		;
		/* merge: currentTerm[serverId] = msg.requestVote.term(189, 168, 189) */
		reached[0][168] = 1;
		(trpt+1)->bup.ovals = grab_ints(4);
		(trpt+1)->bup.ovals[0] = ((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]);
		now.currentTerm[ Index(((P0 *)_this)->serverId, 3) ] = ((int)((P0 *)_this)->msg.requestVote.term);
#ifdef VAR_RANGES
		logval("currentTerm[server:serverId]", ((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]));
#endif
		;
		/* merge: state[serverId] = 2(189, 169, 189) */
		reached[0][169] = 1;
		(trpt+1)->bup.ovals[1] = now.state[ Index(((int)((P0 *)_this)->serverId), 3) ];
		now.state[ Index(((P0 *)_this)->serverId, 3) ] = 2;
#ifdef VAR_RANGES
		logval("state[server:serverId]", now.state[ Index(((int)((P0 *)_this)->serverId), 3) ]);
#endif
		;
		/* merge: votedFor = 10(189, 170, 189) */
		reached[0][170] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)_this)->votedFor);
		((P0 *)_this)->votedFor = 10;
#ifdef VAR_RANGES
		logval("server:votedFor", ((int)((P0 *)_this)->votedFor));
#endif
		;
		/* merge: time_out[serverId] = 1(189, 171, 189) */
		reached[0][171] = 1;
		(trpt+1)->bup.ovals[3] = ((int)now.time_out[ Index(((int)((P0 *)_this)->serverId), 3) ]);
		now.time_out[ Index(((P0 *)_this)->serverId, 3) ] = 1;
#ifdef VAR_RANGES
		logval("time_out[server:serverId]", ((int)now.time_out[ Index(((int)((P0 *)_this)->serverId), 3) ]));
#endif
		;
		/* merge: .(goto)(0, 176, 189) */
		reached[0][176] = 1;
		;
		_m = 3; goto P999; /* 6 */
	case 80: // STATE 168 - raft_sem8.pml:246 - [currentTerm[serverId] = msg.requestVote.term] (0:189:4 - 3)
		IfNotBlocked
		reached[0][168] = 1;
		(trpt+1)->bup.ovals = grab_ints(4);
		(trpt+1)->bup.ovals[0] = ((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]);
		now.currentTerm[ Index(((P0 *)_this)->serverId, 3) ] = ((int)((P0 *)_this)->msg.requestVote.term);
#ifdef VAR_RANGES
		logval("currentTerm[server:serverId]", ((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]));
#endif
		;
		/* merge: state[serverId] = 2(189, 169, 189) */
		reached[0][169] = 1;
		(trpt+1)->bup.ovals[1] = now.state[ Index(((int)((P0 *)_this)->serverId), 3) ];
		now.state[ Index(((P0 *)_this)->serverId, 3) ] = 2;
#ifdef VAR_RANGES
		logval("state[server:serverId]", now.state[ Index(((int)((P0 *)_this)->serverId), 3) ]);
#endif
		;
		/* merge: votedFor = 10(189, 170, 189) */
		reached[0][170] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)_this)->votedFor);
		((P0 *)_this)->votedFor = 10;
#ifdef VAR_RANGES
		logval("server:votedFor", ((int)((P0 *)_this)->votedFor));
#endif
		;
		/* merge: time_out[serverId] = 1(189, 171, 189) */
		reached[0][171] = 1;
		(trpt+1)->bup.ovals[3] = ((int)now.time_out[ Index(((int)((P0 *)_this)->serverId), 3) ]);
		now.time_out[ Index(((P0 *)_this)->serverId, 3) ] = 1;
#ifdef VAR_RANGES
		logval("time_out[server:serverId]", ((int)now.time_out[ Index(((int)((P0 *)_this)->serverId), 3) ]));
#endif
		;
		/* merge: .(goto)(0, 176, 189) */
		reached[0][176] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 81: // STATE 172 - raft_sem8.pml:250 - [((msg.requestVote.term<=currentTerm[serverId]))] (174:0:0 - 1)
		IfNotBlocked
		reached[0][172] = 1;
		if (!((((int)((P0 *)_this)->msg.requestVote.term)<=((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]))))
			continue;
		/* merge: printf('SERVER %d: RequestVote term %d <= current term %d\\n',serverId,msg.requestVote.term,currentTerm[serverId])(0, 173, 174) */
		reached[0][173] = 1;
		Printf("SERVER %d: RequestVote term %d <= current term %d\n", ((int)((P0 *)_this)->serverId), ((int)((P0 *)_this)->msg.requestVote.term), ((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]));
		_m = 3; goto P999; /* 1 */
	case 82: // STATE 177 - raft_sem8.pml:257 - [((logs[serverId].logs[0]==0))] (204:0:9 - 1)
		IfNotBlocked
		reached[0][177] = 1;
		if (!((((int)now.logs[ Index(((int)((P0 *)_this)->serverId), 3) ].logs[0])==0)))
			continue;
		/* merge: lastLogTerm = 0(204, 178, 204) */
		reached[0][178] = 1;
		(trpt+1)->bup.ovals = grab_ints(9);
		(trpt+1)->bup.ovals[0] = ((int)((P0 *)_this)->lastLogTerm);
		((P0 *)_this)->lastLogTerm = 0;
#ifdef VAR_RANGES
		logval("server:lastLogTerm", ((int)((P0 *)_this)->lastLogTerm));
#endif
		;
		/* merge: lastLogIndex = 0(204, 179, 204) */
		reached[0][179] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P0 *)_this)->lastLogIndex);
		((P0 *)_this)->lastLogIndex = 0;
#ifdef VAR_RANGES
		logval("server:lastLogIndex", ((int)((P0 *)_this)->lastLogIndex));
#endif
		;
		/* merge: printf('SERVER %d: My last log empty,lastLogTerm = 0,lastLogIndex = 0\\n',serverId)(204, 180, 204) */
		reached[0][180] = 1;
		Printf("SERVER %d: My last log empty,lastLogTerm = 0,lastLogIndex = 0\n", ((int)((P0 *)_this)->serverId));
		/* merge: .(goto)(204, 190, 204) */
		reached[0][190] = 1;
		;
		/* merge: logOk = ((msg.requestVote.lastLogTerm>lastLogTerm)||((msg.requestVote.lastLogTerm==lastLogTerm)&&(msg.requestVote.lastLogIndex>=lastLogIndex)))(204, 191, 204) */
		reached[0][191] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)_this)->logOk);
		((P0 *)_this)->logOk = ((((int)((P0 *)_this)->msg.requestVote.lastLogTerm)>((int)((P0 *)_this)->lastLogTerm))||((((int)((P0 *)_this)->msg.requestVote.lastLogTerm)==((int)((P0 *)_this)->lastLogTerm))&&(((int)((P0 *)_this)->msg.requestVote.lastLogIndex)>=((int)((P0 *)_this)->lastLogIndex))));
#ifdef VAR_RANGES
		logval("server:logOk", ((int)((P0 *)_this)->logOk));
#endif
		;
		/* merge: voteGranted = (((msg.requestVote.term==currentTerm[serverId])&&logOk)&&((votedFor==10)||(votedFor==sender)))(204, 192, 204) */
		reached[0][192] = 1;
		(trpt+1)->bup.ovals[3] = ((int)((P0 *)_this)->_11_7_voteGranted);
		((P0 *)_this)->_11_7_voteGranted = (((((int)((P0 *)_this)->msg.requestVote.term)==((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]))&&((int)((P0 *)_this)->logOk))&&((((int)((P0 *)_this)->votedFor)==10)||(((int)((P0 *)_this)->votedFor)==((int)((P0 *)_this)->_11_7_sender))));
#ifdef VAR_RANGES
		logval("server:voteGranted", ((int)((P0 *)_this)->_11_7_voteGranted));
#endif
		;
		/* merge: outMsg.messageType = 1(204, 193, 204) */
		reached[0][193] = 1;
		(trpt+1)->bup.ovals[4] = ((P0 *)_this)->outMsg.messageType;
		((P0 *)_this)->outMsg.messageType = 1;
#ifdef VAR_RANGES
		logval("server:outMsg.messageType", ((P0 *)_this)->outMsg.messageType);
#endif
		;
		/* merge: outMsg.sender = serverId(204, 194, 204) */
		reached[0][194] = 1;
		(trpt+1)->bup.ovals[5] = ((int)((P0 *)_this)->outMsg.sender);
		((P0 *)_this)->outMsg.sender = ((int)((P0 *)_this)->serverId);
#ifdef VAR_RANGES
		logval("server:outMsg.sender", ((int)((P0 *)_this)->outMsg.sender));
#endif
		;
		/* merge: outMsg.receiver = sender(204, 195, 204) */
		reached[0][195] = 1;
		(trpt+1)->bup.ovals[6] = ((int)((P0 *)_this)->outMsg.receiver);
		((P0 *)_this)->outMsg.receiver = ((int)((P0 *)_this)->_11_7_sender);
#ifdef VAR_RANGES
		logval("server:outMsg.receiver", ((int)((P0 *)_this)->outMsg.receiver));
#endif
		;
		/* merge: outMsg.requestVoteResponse.term = currentTerm[serverId](204, 196, 204) */
		reached[0][196] = 1;
		(trpt+1)->bup.ovals[7] = ((int)((P0 *)_this)->outMsg.requestVoteResponse.term);
		((P0 *)_this)->outMsg.requestVoteResponse.term = ((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]);
#ifdef VAR_RANGES
		logval("server:outMsg.requestVoteResponse.term", ((int)((P0 *)_this)->outMsg.requestVoteResponse.term));
#endif
		;
		/* merge: outMsg.requestVoteResponse.voteGranted = voteGranted(204, 197, 204) */
		reached[0][197] = 1;
		(trpt+1)->bup.ovals[8] = ((int)((P0 *)_this)->outMsg.requestVoteResponse.voteGranted);
		((P0 *)_this)->outMsg.requestVoteResponse.voteGranted = ((int)((P0 *)_this)->_11_7_voteGranted);
#ifdef VAR_RANGES
		logval("server:outMsg.requestVoteResponse.voteGranted", ((int)((P0 *)_this)->outMsg.requestVoteResponse.voteGranted));
#endif
		;
		_m = 3; goto P999; /* 11 */
	case 83: // STATE 181 - raft_sem8.pml:261 - [(((logs[serverId].logs[0]!=0)&&(logs[serverId].logs[1]==0)))] (204:0:9 - 1)
		IfNotBlocked
		reached[0][181] = 1;
		if (!(((((int)now.logs[ Index(((int)((P0 *)_this)->serverId), 3) ].logs[0])!=0)&&(((int)now.logs[ Index(((int)((P0 *)_this)->serverId), 3) ].logs[1])==0))))
			continue;
		/* merge: lastLogTerm = logs[serverId].logs[0](204, 182, 204) */
		reached[0][182] = 1;
		(trpt+1)->bup.ovals = grab_ints(9);
		(trpt+1)->bup.ovals[0] = ((int)((P0 *)_this)->lastLogTerm);
		((P0 *)_this)->lastLogTerm = ((int)now.logs[ Index(((int)((P0 *)_this)->serverId), 3) ].logs[0]);
#ifdef VAR_RANGES
		logval("server:lastLogTerm", ((int)((P0 *)_this)->lastLogTerm));
#endif
		;
		/* merge: lastLogIndex = 1(204, 183, 204) */
		reached[0][183] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P0 *)_this)->lastLogIndex);
		((P0 *)_this)->lastLogIndex = 1;
#ifdef VAR_RANGES
		logval("server:lastLogIndex", ((int)((P0 *)_this)->lastLogIndex));
#endif
		;
		/* merge: printf('SERVER %d: My last log at index 0,lastLogTerm = %d,lastLogIndex = 1\\n',serverId,lastLogTerm)(204, 184, 204) */
		reached[0][184] = 1;
		Printf("SERVER %d: My last log at index 0,lastLogTerm = %d,lastLogIndex = 1\n", ((int)((P0 *)_this)->serverId), ((int)((P0 *)_this)->lastLogTerm));
		/* merge: .(goto)(204, 190, 204) */
		reached[0][190] = 1;
		;
		/* merge: logOk = ((msg.requestVote.lastLogTerm>lastLogTerm)||((msg.requestVote.lastLogTerm==lastLogTerm)&&(msg.requestVote.lastLogIndex>=lastLogIndex)))(204, 191, 204) */
		reached[0][191] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)_this)->logOk);
		((P0 *)_this)->logOk = ((((int)((P0 *)_this)->msg.requestVote.lastLogTerm)>((int)((P0 *)_this)->lastLogTerm))||((((int)((P0 *)_this)->msg.requestVote.lastLogTerm)==((int)((P0 *)_this)->lastLogTerm))&&(((int)((P0 *)_this)->msg.requestVote.lastLogIndex)>=((int)((P0 *)_this)->lastLogIndex))));
#ifdef VAR_RANGES
		logval("server:logOk", ((int)((P0 *)_this)->logOk));
#endif
		;
		/* merge: voteGranted = (((msg.requestVote.term==currentTerm[serverId])&&logOk)&&((votedFor==10)||(votedFor==sender)))(204, 192, 204) */
		reached[0][192] = 1;
		(trpt+1)->bup.ovals[3] = ((int)((P0 *)_this)->_11_7_voteGranted);
		((P0 *)_this)->_11_7_voteGranted = (((((int)((P0 *)_this)->msg.requestVote.term)==((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]))&&((int)((P0 *)_this)->logOk))&&((((int)((P0 *)_this)->votedFor)==10)||(((int)((P0 *)_this)->votedFor)==((int)((P0 *)_this)->_11_7_sender))));
#ifdef VAR_RANGES
		logval("server:voteGranted", ((int)((P0 *)_this)->_11_7_voteGranted));
#endif
		;
		/* merge: outMsg.messageType = 1(204, 193, 204) */
		reached[0][193] = 1;
		(trpt+1)->bup.ovals[4] = ((P0 *)_this)->outMsg.messageType;
		((P0 *)_this)->outMsg.messageType = 1;
#ifdef VAR_RANGES
		logval("server:outMsg.messageType", ((P0 *)_this)->outMsg.messageType);
#endif
		;
		/* merge: outMsg.sender = serverId(204, 194, 204) */
		reached[0][194] = 1;
		(trpt+1)->bup.ovals[5] = ((int)((P0 *)_this)->outMsg.sender);
		((P0 *)_this)->outMsg.sender = ((int)((P0 *)_this)->serverId);
#ifdef VAR_RANGES
		logval("server:outMsg.sender", ((int)((P0 *)_this)->outMsg.sender));
#endif
		;
		/* merge: outMsg.receiver = sender(204, 195, 204) */
		reached[0][195] = 1;
		(trpt+1)->bup.ovals[6] = ((int)((P0 *)_this)->outMsg.receiver);
		((P0 *)_this)->outMsg.receiver = ((int)((P0 *)_this)->_11_7_sender);
#ifdef VAR_RANGES
		logval("server:outMsg.receiver", ((int)((P0 *)_this)->outMsg.receiver));
#endif
		;
		/* merge: outMsg.requestVoteResponse.term = currentTerm[serverId](204, 196, 204) */
		reached[0][196] = 1;
		(trpt+1)->bup.ovals[7] = ((int)((P0 *)_this)->outMsg.requestVoteResponse.term);
		((P0 *)_this)->outMsg.requestVoteResponse.term = ((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]);
#ifdef VAR_RANGES
		logval("server:outMsg.requestVoteResponse.term", ((int)((P0 *)_this)->outMsg.requestVoteResponse.term));
#endif
		;
		/* merge: outMsg.requestVoteResponse.voteGranted = voteGranted(204, 197, 204) */
		reached[0][197] = 1;
		(trpt+1)->bup.ovals[8] = ((int)((P0 *)_this)->outMsg.requestVoteResponse.voteGranted);
		((P0 *)_this)->outMsg.requestVoteResponse.voteGranted = ((int)((P0 *)_this)->_11_7_voteGranted);
#ifdef VAR_RANGES
		logval("server:outMsg.requestVoteResponse.voteGranted", ((int)((P0 *)_this)->outMsg.requestVoteResponse.voteGranted));
#endif
		;
		_m = 3; goto P999; /* 11 */
	case 84: // STATE 185 - raft_sem8.pml:265 - [(((logs[serverId].logs[0]!=0)&&(logs[serverId].logs[1]!=0)))] (204:0:9 - 1)
		IfNotBlocked
		reached[0][185] = 1;
		if (!(((((int)now.logs[ Index(((int)((P0 *)_this)->serverId), 3) ].logs[0])!=0)&&(((int)now.logs[ Index(((int)((P0 *)_this)->serverId), 3) ].logs[1])!=0))))
			continue;
		/* merge: lastLogTerm = logs[serverId].logs[1](204, 186, 204) */
		reached[0][186] = 1;
		(trpt+1)->bup.ovals = grab_ints(9);
		(trpt+1)->bup.ovals[0] = ((int)((P0 *)_this)->lastLogTerm);
		((P0 *)_this)->lastLogTerm = ((int)now.logs[ Index(((int)((P0 *)_this)->serverId), 3) ].logs[1]);
#ifdef VAR_RANGES
		logval("server:lastLogTerm", ((int)((P0 *)_this)->lastLogTerm));
#endif
		;
		/* merge: lastLogIndex = 2(204, 187, 204) */
		reached[0][187] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P0 *)_this)->lastLogIndex);
		((P0 *)_this)->lastLogIndex = 2;
#ifdef VAR_RANGES
		logval("server:lastLogIndex", ((int)((P0 *)_this)->lastLogIndex));
#endif
		;
		/* merge: printf('SERVER %d: My last log at index 1,lastLogTerm = %d,lastLogIndex = 2\\n',serverId,lastLogTerm)(204, 188, 204) */
		reached[0][188] = 1;
		Printf("SERVER %d: My last log at index 1,lastLogTerm = %d,lastLogIndex = 2\n", ((int)((P0 *)_this)->serverId), ((int)((P0 *)_this)->lastLogTerm));
		/* merge: .(goto)(204, 190, 204) */
		reached[0][190] = 1;
		;
		/* merge: logOk = ((msg.requestVote.lastLogTerm>lastLogTerm)||((msg.requestVote.lastLogTerm==lastLogTerm)&&(msg.requestVote.lastLogIndex>=lastLogIndex)))(204, 191, 204) */
		reached[0][191] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)_this)->logOk);
		((P0 *)_this)->logOk = ((((int)((P0 *)_this)->msg.requestVote.lastLogTerm)>((int)((P0 *)_this)->lastLogTerm))||((((int)((P0 *)_this)->msg.requestVote.lastLogTerm)==((int)((P0 *)_this)->lastLogTerm))&&(((int)((P0 *)_this)->msg.requestVote.lastLogIndex)>=((int)((P0 *)_this)->lastLogIndex))));
#ifdef VAR_RANGES
		logval("server:logOk", ((int)((P0 *)_this)->logOk));
#endif
		;
		/* merge: voteGranted = (((msg.requestVote.term==currentTerm[serverId])&&logOk)&&((votedFor==10)||(votedFor==sender)))(204, 192, 204) */
		reached[0][192] = 1;
		(trpt+1)->bup.ovals[3] = ((int)((P0 *)_this)->_11_7_voteGranted);
		((P0 *)_this)->_11_7_voteGranted = (((((int)((P0 *)_this)->msg.requestVote.term)==((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]))&&((int)((P0 *)_this)->logOk))&&((((int)((P0 *)_this)->votedFor)==10)||(((int)((P0 *)_this)->votedFor)==((int)((P0 *)_this)->_11_7_sender))));
#ifdef VAR_RANGES
		logval("server:voteGranted", ((int)((P0 *)_this)->_11_7_voteGranted));
#endif
		;
		/* merge: outMsg.messageType = 1(204, 193, 204) */
		reached[0][193] = 1;
		(trpt+1)->bup.ovals[4] = ((P0 *)_this)->outMsg.messageType;
		((P0 *)_this)->outMsg.messageType = 1;
#ifdef VAR_RANGES
		logval("server:outMsg.messageType", ((P0 *)_this)->outMsg.messageType);
#endif
		;
		/* merge: outMsg.sender = serverId(204, 194, 204) */
		reached[0][194] = 1;
		(trpt+1)->bup.ovals[5] = ((int)((P0 *)_this)->outMsg.sender);
		((P0 *)_this)->outMsg.sender = ((int)((P0 *)_this)->serverId);
#ifdef VAR_RANGES
		logval("server:outMsg.sender", ((int)((P0 *)_this)->outMsg.sender));
#endif
		;
		/* merge: outMsg.receiver = sender(204, 195, 204) */
		reached[0][195] = 1;
		(trpt+1)->bup.ovals[6] = ((int)((P0 *)_this)->outMsg.receiver);
		((P0 *)_this)->outMsg.receiver = ((int)((P0 *)_this)->_11_7_sender);
#ifdef VAR_RANGES
		logval("server:outMsg.receiver", ((int)((P0 *)_this)->outMsg.receiver));
#endif
		;
		/* merge: outMsg.requestVoteResponse.term = currentTerm[serverId](204, 196, 204) */
		reached[0][196] = 1;
		(trpt+1)->bup.ovals[7] = ((int)((P0 *)_this)->outMsg.requestVoteResponse.term);
		((P0 *)_this)->outMsg.requestVoteResponse.term = ((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]);
#ifdef VAR_RANGES
		logval("server:outMsg.requestVoteResponse.term", ((int)((P0 *)_this)->outMsg.requestVoteResponse.term));
#endif
		;
		/* merge: outMsg.requestVoteResponse.voteGranted = voteGranted(204, 197, 204) */
		reached[0][197] = 1;
		(trpt+1)->bup.ovals[8] = ((int)((P0 *)_this)->outMsg.requestVoteResponse.voteGranted);
		((P0 *)_this)->outMsg.requestVoteResponse.voteGranted = ((int)((P0 *)_this)->_11_7_voteGranted);
#ifdef VAR_RANGES
		logval("server:outMsg.requestVoteResponse.voteGranted", ((int)((P0 *)_this)->outMsg.requestVoteResponse.voteGranted));
#endif
		;
		_m = 3; goto P999; /* 11 */
	case 85: // STATE 191 - raft_sem8.pml:272 - [logOk = ((msg.requestVote.lastLogTerm>lastLogTerm)||((msg.requestVote.lastLogTerm==lastLogTerm)&&(msg.requestVote.lastLogIndex>=lastLogIndex)))] (0:204:7 - 4)
		IfNotBlocked
		reached[0][191] = 1;
		(trpt+1)->bup.ovals = grab_ints(7);
		(trpt+1)->bup.ovals[0] = ((int)((P0 *)_this)->logOk);
		((P0 *)_this)->logOk = ((((int)((P0 *)_this)->msg.requestVote.lastLogTerm)>((int)((P0 *)_this)->lastLogTerm))||((((int)((P0 *)_this)->msg.requestVote.lastLogTerm)==((int)((P0 *)_this)->lastLogTerm))&&(((int)((P0 *)_this)->msg.requestVote.lastLogIndex)>=((int)((P0 *)_this)->lastLogIndex))));
#ifdef VAR_RANGES
		logval("server:logOk", ((int)((P0 *)_this)->logOk));
#endif
		;
		/* merge: voteGranted = (((msg.requestVote.term==currentTerm[serverId])&&logOk)&&((votedFor==10)||(votedFor==sender)))(204, 192, 204) */
		reached[0][192] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P0 *)_this)->_11_7_voteGranted);
		((P0 *)_this)->_11_7_voteGranted = (((((int)((P0 *)_this)->msg.requestVote.term)==((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]))&&((int)((P0 *)_this)->logOk))&&((((int)((P0 *)_this)->votedFor)==10)||(((int)((P0 *)_this)->votedFor)==((int)((P0 *)_this)->_11_7_sender))));
#ifdef VAR_RANGES
		logval("server:voteGranted", ((int)((P0 *)_this)->_11_7_voteGranted));
#endif
		;
		/* merge: outMsg.messageType = 1(204, 193, 204) */
		reached[0][193] = 1;
		(trpt+1)->bup.ovals[2] = ((P0 *)_this)->outMsg.messageType;
		((P0 *)_this)->outMsg.messageType = 1;
#ifdef VAR_RANGES
		logval("server:outMsg.messageType", ((P0 *)_this)->outMsg.messageType);
#endif
		;
		/* merge: outMsg.sender = serverId(204, 194, 204) */
		reached[0][194] = 1;
		(trpt+1)->bup.ovals[3] = ((int)((P0 *)_this)->outMsg.sender);
		((P0 *)_this)->outMsg.sender = ((int)((P0 *)_this)->serverId);
#ifdef VAR_RANGES
		logval("server:outMsg.sender", ((int)((P0 *)_this)->outMsg.sender));
#endif
		;
		/* merge: outMsg.receiver = sender(204, 195, 204) */
		reached[0][195] = 1;
		(trpt+1)->bup.ovals[4] = ((int)((P0 *)_this)->outMsg.receiver);
		((P0 *)_this)->outMsg.receiver = ((int)((P0 *)_this)->_11_7_sender);
#ifdef VAR_RANGES
		logval("server:outMsg.receiver", ((int)((P0 *)_this)->outMsg.receiver));
#endif
		;
		/* merge: outMsg.requestVoteResponse.term = currentTerm[serverId](204, 196, 204) */
		reached[0][196] = 1;
		(trpt+1)->bup.ovals[5] = ((int)((P0 *)_this)->outMsg.requestVoteResponse.term);
		((P0 *)_this)->outMsg.requestVoteResponse.term = ((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]);
#ifdef VAR_RANGES
		logval("server:outMsg.requestVoteResponse.term", ((int)((P0 *)_this)->outMsg.requestVoteResponse.term));
#endif
		;
		/* merge: outMsg.requestVoteResponse.voteGranted = voteGranted(204, 197, 204) */
		reached[0][197] = 1;
		(trpt+1)->bup.ovals[6] = ((int)((P0 *)_this)->outMsg.requestVoteResponse.voteGranted);
		((P0 *)_this)->outMsg.requestVoteResponse.voteGranted = ((int)((P0 *)_this)->_11_7_voteGranted);
#ifdef VAR_RANGES
		logval("server:outMsg.requestVoteResponse.voteGranted", ((int)((P0 *)_this)->outMsg.requestVoteResponse.voteGranted));
#endif
		;
		_m = 3; goto P999; /* 6 */
	case 86: // STATE 198 - raft_sem8.pml:284 - [(voteGranted)] (206:0:2 - 1)
		IfNotBlocked
		reached[0][198] = 1;
		if (!(((int)((P0 *)_this)->_11_7_voteGranted)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: _11_7_voteGranted */  (trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P0 *)_this)->_11_7_voteGranted;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)_this)->_11_7_voteGranted = 0;
		/* merge: votedFor = sender(206, 199, 206) */
		reached[0][199] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P0 *)_this)->votedFor);
		((P0 *)_this)->votedFor = ((int)((P0 *)_this)->_11_7_sender);
#ifdef VAR_RANGES
		logval("server:votedFor", ((int)((P0 *)_this)->votedFor));
#endif
		;
		/* merge: printf('SERVER %d: Granting vote to server %d for term %d\\n',serverId,sender,currentTerm[serverId])(206, 200, 206) */
		reached[0][200] = 1;
		Printf("SERVER %d: Granting vote to server %d for term %d\n", ((int)((P0 *)_this)->serverId), ((int)((P0 *)_this)->_11_7_sender), ((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]));
		/* merge: .(goto)(0, 205, 206) */
		reached[0][205] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 87: // STATE 201 - raft_sem8.pml:287 - [(!(voteGranted))] (203:0:1 - 1)
		IfNotBlocked
		reached[0][201] = 1;
		if (!( !(((int)((P0 *)_this)->_11_7_voteGranted))))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: _11_7_voteGranted */  (trpt+1)->bup.oval = ((P0 *)_this)->_11_7_voteGranted;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)_this)->_11_7_voteGranted = 0;
		/* merge: printf('SERVER %d: Rejecting vote for server %d,term = %d,logOk = %d,votedFor = %d\\n',serverId,sender,currentTerm[serverId],logOk,votedFor)(0, 202, 203) */
		reached[0][202] = 1;
		Printf("SERVER %d: Rejecting vote for server %d,term = %d,logOk = %d,votedFor = %d\n", ((int)((P0 *)_this)->serverId), ((int)((P0 *)_this)->_11_7_sender), ((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]), ((int)((P0 *)_this)->logOk), ((int)((P0 *)_this)->votedFor));
		_m = 3; goto P999; /* 1 */
	case 88: // STATE 206 - raft_sem8.pml:294 - [toNodes[sender]!outMsg.messageType,outMsg.sender,outMsg.receiver,outMsg.appendEntry.term,outMsg.appendEntry.leaderCommit,outMsg.appendEntry.index,outMsg.appendEntry.prevLogTerm,outMsg.appendEntryResponse.term,outMsg.appendEntryResponse.success,outMsg.requestVote.term,outMsg.requestVote.lastLogIndex,outMsg.requestVote.lastLogTerm,outMsg.requestVoteResponse.term,outMsg.requestVoteResponse.voteGranted] (372:0:0 - 3)
		IfNotBlocked
		reached[0][206] = 1;
		if (q_full(now.toNodes[ Index(((int)((P0 *)_this)->_11_7_sender), 3) ]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.toNodes[ Index(((int)((P0 *)_this)->_11_7_sender), 3) ]);
		sprintf(simtmp, "%d", ((P0 *)_this)->outMsg.messageType); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->outMsg.sender)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->outMsg.receiver)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->outMsg.appendEntry.term)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->outMsg.appendEntry.leaderCommit)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->outMsg.appendEntry.index)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->outMsg.appendEntry.prevLogTerm)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->outMsg.appendEntryResponse.term)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->outMsg.appendEntryResponse.success)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->outMsg.requestVote.term)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->outMsg.requestVote.lastLogIndex)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->outMsg.requestVote.lastLogTerm)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->outMsg.requestVoteResponse.term)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->outMsg.requestVoteResponse.voteGranted)); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.toNodes[ Index(((int)((P0 *)_this)->_11_7_sender), 3) ], 0, ((P0 *)_this)->outMsg.messageType, ((int)((P0 *)_this)->outMsg.sender), ((int)((P0 *)_this)->outMsg.receiver), ((int)((P0 *)_this)->outMsg.appendEntry.term), ((int)((P0 *)_this)->outMsg.appendEntry.leaderCommit), ((int)((P0 *)_this)->outMsg.appendEntry.index), ((int)((P0 *)_this)->outMsg.appendEntry.prevLogTerm), ((int)((P0 *)_this)->outMsg.appendEntryResponse.term), ((int)((P0 *)_this)->outMsg.appendEntryResponse.success), ((int)((P0 *)_this)->outMsg.requestVote.term), ((int)((P0 *)_this)->outMsg.requestVote.lastLogIndex), ((int)((P0 *)_this)->outMsg.requestVote.lastLogTerm), ((int)((P0 *)_this)->outMsg.requestVoteResponse.term), ((int)((P0 *)_this)->outMsg.requestVoteResponse.voteGranted), 14);
		/* merge: .(goto)(372, 325, 372) */
		reached[0][325] = 1;
		;
		/* merge: .(goto)(0, 373, 372) */
		reached[0][373] = 1;
		;
		_m = 2; goto P999; /* 2 */
	case 89: // STATE 325 - raft_sem8.pml:445 - [.(goto)] (0:372:0 - 4)
		IfNotBlocked
		reached[0][325] = 1;
		;
		/* merge: .(goto)(0, 373, 372) */
		reached[0][373] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 90: // STATE 207 - raft_sem8.pml:296 - [((msg.messageType==1))] (229:0:0 - 1)
		IfNotBlocked
		reached[0][207] = 1;
		if (!((((P0 *)_this)->msg.messageType==1)))
			continue;
		/* merge: printf('SERVER %d: Received RequestVoteResponse from server %d,term = %d,granted = %d\\n',serverId,sender,msg.requestVoteResponse.term,msg.requestVoteResponse.voteGranted)(0, 208, 229) */
		reached[0][208] = 1;
		Printf("SERVER %d: Received RequestVoteResponse from server %d,term = %d,granted = %d\n", ((int)((P0 *)_this)->serverId), ((int)((P0 *)_this)->_11_7_sender), ((int)((P0 *)_this)->msg.requestVoteResponse.term), ((int)((P0 *)_this)->msg.requestVoteResponse.voteGranted));
		_m = 3; goto P999; /* 1 */
	case 91: // STATE 209 - raft_sem8.pml:301 - [((msg.requestVoteResponse.term>currentTerm[serverId]))] (217:0:0 - 1)
		IfNotBlocked
		reached[0][209] = 1;
		if (!((((int)((P0 *)_this)->msg.requestVoteResponse.term)>((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]))))
			continue;
		/* merge: printf('SERVER %d: Updating term from %d to %d and becoming follower\\n',serverId,currentTerm[serverId],msg.requestVoteResponse.term)(0, 210, 217) */
		reached[0][210] = 1;
		Printf("SERVER %d: Updating term from %d to %d and becoming follower\n", ((int)((P0 *)_this)->serverId), ((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]), ((int)((P0 *)_this)->msg.requestVoteResponse.term));
		_m = 3; goto P999; /* 1 */
	case 92: // STATE 211 - raft_sem8.pml:305 - [((state[serverId]==4))] (372:0:7 - 1)
		IfNotBlocked
		reached[0][211] = 1;
		if (!((now.state[ Index(((int)((P0 *)_this)->serverId), 3) ]==4)))
			continue;
		/* merge: leaders = (leaders-1)(372, 212, 372) */
		reached[0][212] = 1;
		(trpt+1)->bup.ovals = grab_ints(7);
		(trpt+1)->bup.ovals[0] = ((int)now.leaders);
		now.leaders = (((int)now.leaders)-1);
#ifdef VAR_RANGES
		logval("leaders", ((int)now.leaders));
#endif
		;
		/* merge: isLeader = (leaders>0)(372, 213, 372) */
		reached[0][213] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.isLeader);
		now.isLeader = (((int)now.leaders)>0);
#ifdef VAR_RANGES
		logval("isLeader", ((int)now.isLeader));
#endif
		;
		/* merge: leader[serverId] = 0(372, 214, 372) */
		reached[0][214] = 1;
		(trpt+1)->bup.ovals[2] = ((int)leader[ Index(((int)((P0 *)_this)->serverId), 3) ]);
		leader[ Index(((P0 *)_this)->serverId, 3) ] = 0;
#ifdef VAR_RANGES
		logval("leader[server:serverId]", ((int)leader[ Index(((int)((P0 *)_this)->serverId), 3) ]));
#endif
		;
		/* merge: .(goto)(372, 218, 372) */
		reached[0][218] = 1;
		;
		/* merge: currentTerm[serverId] = msg.requestVoteResponse.term(372, 219, 372) */
		reached[0][219] = 1;
		(trpt+1)->bup.ovals[3] = ((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]);
		now.currentTerm[ Index(((P0 *)_this)->serverId, 3) ] = ((int)((P0 *)_this)->msg.requestVoteResponse.term);
#ifdef VAR_RANGES
		logval("currentTerm[server:serverId]", ((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]));
#endif
		;
		/* merge: state[serverId] = 2(372, 220, 372) */
		reached[0][220] = 1;
		(trpt+1)->bup.ovals[4] = now.state[ Index(((int)((P0 *)_this)->serverId), 3) ];
		now.state[ Index(((P0 *)_this)->serverId, 3) ] = 2;
#ifdef VAR_RANGES
		logval("state[server:serverId]", now.state[ Index(((int)((P0 *)_this)->serverId), 3) ]);
#endif
		;
		/* merge: votedFor = 10(372, 221, 372) */
		reached[0][221] = 1;
		(trpt+1)->bup.ovals[5] = ((int)((P0 *)_this)->votedFor);
		((P0 *)_this)->votedFor = 10;
#ifdef VAR_RANGES
		logval("server:votedFor", ((int)((P0 *)_this)->votedFor));
#endif
		;
		/* merge: time_out[serverId] = 1(372, 222, 372) */
		reached[0][222] = 1;
		(trpt+1)->bup.ovals[6] = ((int)now.time_out[ Index(((int)((P0 *)_this)->serverId), 3) ]);
		now.time_out[ Index(((P0 *)_this)->serverId, 3) ] = 1;
#ifdef VAR_RANGES
		logval("time_out[server:serverId]", ((int)now.time_out[ Index(((int)((P0 *)_this)->serverId), 3) ]));
#endif
		;
		/* merge: .(goto)(372, 230, 372) */
		reached[0][230] = 1;
		;
		/* merge: .(goto)(372, 325, 372) */
		reached[0][325] = 1;
		;
		/* merge: .(goto)(0, 373, 372) */
		reached[0][373] = 1;
		;
		_m = 3; goto P999; /* 11 */
	case 93: // STATE 216 - raft_sem8.pml:309 - [(1)] (372:0:4 - 1)
		IfNotBlocked
		reached[0][216] = 1;
		if (!(1))
			continue;
		/* merge: .(goto)(372, 218, 372) */
		reached[0][218] = 1;
		;
		/* merge: currentTerm[serverId] = msg.requestVoteResponse.term(372, 219, 372) */
		reached[0][219] = 1;
		(trpt+1)->bup.ovals = grab_ints(4);
		(trpt+1)->bup.ovals[0] = ((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]);
		now.currentTerm[ Index(((P0 *)_this)->serverId, 3) ] = ((int)((P0 *)_this)->msg.requestVoteResponse.term);
#ifdef VAR_RANGES
		logval("currentTerm[server:serverId]", ((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]));
#endif
		;
		/* merge: state[serverId] = 2(372, 220, 372) */
		reached[0][220] = 1;
		(trpt+1)->bup.ovals[1] = now.state[ Index(((int)((P0 *)_this)->serverId), 3) ];
		now.state[ Index(((P0 *)_this)->serverId, 3) ] = 2;
#ifdef VAR_RANGES
		logval("state[server:serverId]", now.state[ Index(((int)((P0 *)_this)->serverId), 3) ]);
#endif
		;
		/* merge: votedFor = 10(372, 221, 372) */
		reached[0][221] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)_this)->votedFor);
		((P0 *)_this)->votedFor = 10;
#ifdef VAR_RANGES
		logval("server:votedFor", ((int)((P0 *)_this)->votedFor));
#endif
		;
		/* merge: time_out[serverId] = 1(372, 222, 372) */
		reached[0][222] = 1;
		(trpt+1)->bup.ovals[3] = ((int)now.time_out[ Index(((int)((P0 *)_this)->serverId), 3) ]);
		now.time_out[ Index(((P0 *)_this)->serverId, 3) ] = 1;
#ifdef VAR_RANGES
		logval("time_out[server:serverId]", ((int)now.time_out[ Index(((int)((P0 *)_this)->serverId), 3) ]));
#endif
		;
		/* merge: .(goto)(372, 230, 372) */
		reached[0][230] = 1;
		;
		/* merge: .(goto)(372, 325, 372) */
		reached[0][325] = 1;
		;
		/* merge: .(goto)(0, 373, 372) */
		reached[0][373] = 1;
		;
		_m = 3; goto P999; /* 8 */
	case 94: // STATE 219 - raft_sem8.pml:311 - [currentTerm[serverId] = msg.requestVoteResponse.term] (0:372:4 - 3)
		IfNotBlocked
		reached[0][219] = 1;
		(trpt+1)->bup.ovals = grab_ints(4);
		(trpt+1)->bup.ovals[0] = ((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]);
		now.currentTerm[ Index(((P0 *)_this)->serverId, 3) ] = ((int)((P0 *)_this)->msg.requestVoteResponse.term);
#ifdef VAR_RANGES
		logval("currentTerm[server:serverId]", ((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]));
#endif
		;
		/* merge: state[serverId] = 2(372, 220, 372) */
		reached[0][220] = 1;
		(trpt+1)->bup.ovals[1] = now.state[ Index(((int)((P0 *)_this)->serverId), 3) ];
		now.state[ Index(((P0 *)_this)->serverId, 3) ] = 2;
#ifdef VAR_RANGES
		logval("state[server:serverId]", now.state[ Index(((int)((P0 *)_this)->serverId), 3) ]);
#endif
		;
		/* merge: votedFor = 10(372, 221, 372) */
		reached[0][221] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)_this)->votedFor);
		((P0 *)_this)->votedFor = 10;
#ifdef VAR_RANGES
		logval("server:votedFor", ((int)((P0 *)_this)->votedFor));
#endif
		;
		/* merge: time_out[serverId] = 1(372, 222, 372) */
		reached[0][222] = 1;
		(trpt+1)->bup.ovals[3] = ((int)now.time_out[ Index(((int)((P0 *)_this)->serverId), 3) ]);
		now.time_out[ Index(((P0 *)_this)->serverId, 3) ] = 1;
#ifdef VAR_RANGES
		logval("time_out[server:serverId]", ((int)now.time_out[ Index(((int)((P0 *)_this)->serverId), 3) ]));
#endif
		;
		/* merge: .(goto)(372, 230, 372) */
		reached[0][230] = 1;
		;
		/* merge: .(goto)(372, 325, 372) */
		reached[0][325] = 1;
		;
		/* merge: .(goto)(0, 373, 372) */
		reached[0][373] = 1;
		;
		_m = 3; goto P999; /* 6 */
	case 95: // STATE 230 - raft_sem8.pml:323 - [.(goto)] (0:372:0 - 3)
		IfNotBlocked
		reached[0][230] = 1;
		;
		/* merge: .(goto)(372, 325, 372) */
		reached[0][325] = 1;
		;
		/* merge: .(goto)(0, 373, 372) */
		reached[0][373] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 96: // STATE 223 - raft_sem8.pml:315 - [((((msg.requestVoteResponse.term==currentTerm[serverId])&&msg.requestVoteResponse.voteGranted)&&(state[serverId]==3)))] (372:0:1 - 1)
		IfNotBlocked
		reached[0][223] = 1;
		if (!((((((int)((P0 *)_this)->msg.requestVoteResponse.term)==((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]))&&((int)((P0 *)_this)->msg.requestVoteResponse.voteGranted))&&(now.state[ Index(((int)((P0 *)_this)->serverId), 3) ]==3))))
			continue;
		/* merge: votesGranted[sender] = 1(372, 224, 372) */
		reached[0][224] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)_this)->votesGranted[ Index(((int)((P0 *)_this)->_11_7_sender), 3) ]);
		((P0 *)_this)->votesGranted[ Index(((P0 *)_this)->_11_7_sender, 3) ] = 1;
#ifdef VAR_RANGES
		logval("server:votesGranted[server:sender]", ((int)((P0 *)_this)->votesGranted[ Index(((int)((P0 *)_this)->_11_7_sender), 3) ]));
#endif
		;
		/* merge: printf('SERVER %d: Vote granted by server %d\\n',serverId,sender)(372, 225, 372) */
		reached[0][225] = 1;
		Printf("SERVER %d: Vote granted by server %d\n", ((int)((P0 *)_this)->serverId), ((int)((P0 *)_this)->_11_7_sender));
		/* merge: .(goto)(372, 230, 372) */
		reached[0][230] = 1;
		;
		/* merge: .(goto)(372, 325, 372) */
		reached[0][325] = 1;
		;
		/* merge: .(goto)(0, 373, 372) */
		reached[0][373] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 97: // STATE 227 - raft_sem8.pml:319 - [printf('SERVER %d: Vote not granted by server %d or no longer a candidate\\n',serverId,sender)] (0:0:0 - 1)
		IfNotBlocked
		reached[0][227] = 1;
		Printf("SERVER %d: Vote not granted by server %d or no longer a candidate\n", ((int)((P0 *)_this)->serverId), ((int)((P0 *)_this)->_11_7_sender));
		_m = 3; goto P999; /* 0 */
	case 98: // STATE 228 - raft_sem8.pml:320 - [(1)] (372:0:0 - 1)
		IfNotBlocked
		reached[0][228] = 1;
		if (!(1))
			continue;
		/* merge: .(goto)(372, 230, 372) */
		reached[0][230] = 1;
		;
		/* merge: .(goto)(372, 325, 372) */
		reached[0][325] = 1;
		;
		/* merge: .(goto)(0, 373, 372) */
		reached[0][373] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 99: // STATE 231 - raft_sem8.pml:323 - [((msg.messageType==4))] (250:0:0 - 1)
		IfNotBlocked
		reached[0][231] = 1;
		if (!((((P0 *)_this)->msg.messageType==4)))
			continue;
		/* merge: printf('SERVER %d: Received AppendEntries from server %d,term = %d,index = %d\\n',serverId,sender,msg.appendEntry.term,msg.appendEntry.index)(0, 232, 250) */
		reached[0][232] = 1;
		Printf("SERVER %d: Received AppendEntries from server %d,term = %d,index = %d\n", ((int)((P0 *)_this)->serverId), ((int)((P0 *)_this)->_11_7_sender), ((int)((P0 *)_this)->msg.appendEntry.term), ((int)((P0 *)_this)->msg.appendEntry.index));
		_m = 3; goto P999; /* 1 */
	case 100: // STATE 233 - raft_sem8.pml:329 - [((msg.appendEntry.term>currentTerm[serverId]))] (241:0:0 - 1)
		IfNotBlocked
		reached[0][233] = 1;
		if (!((((int)((P0 *)_this)->msg.appendEntry.term)>((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]))))
			continue;
		/* merge: printf('SERVER %d: Updating term from %d to %d and becoming follower\\n',serverId,currentTerm[serverId],msg.appendEntry.term)(0, 234, 241) */
		reached[0][234] = 1;
		Printf("SERVER %d: Updating term from %d to %d and becoming follower\n", ((int)((P0 *)_this)->serverId), ((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]), ((int)((P0 *)_this)->msg.appendEntry.term));
		_m = 3; goto P999; /* 1 */
	case 101: // STATE 235 - raft_sem8.pml:333 - [((state[serverId]==4))] (265:0:7 - 1)
		IfNotBlocked
		reached[0][235] = 1;
		if (!((now.state[ Index(((int)((P0 *)_this)->serverId), 3) ]==4)))
			continue;
		/* merge: leaders = (leaders-1)(265, 236, 265) */
		reached[0][236] = 1;
		(trpt+1)->bup.ovals = grab_ints(7);
		(trpt+1)->bup.ovals[0] = ((int)now.leaders);
		now.leaders = (((int)now.leaders)-1);
#ifdef VAR_RANGES
		logval("leaders", ((int)now.leaders));
#endif
		;
		/* merge: isLeader = (leaders>0)(265, 237, 265) */
		reached[0][237] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.isLeader);
		now.isLeader = (((int)now.leaders)>0);
#ifdef VAR_RANGES
		logval("isLeader", ((int)now.isLeader));
#endif
		;
		/* merge: leader[serverId] = 0(265, 238, 265) */
		reached[0][238] = 1;
		(trpt+1)->bup.ovals[2] = ((int)leader[ Index(((int)((P0 *)_this)->serverId), 3) ]);
		leader[ Index(((P0 *)_this)->serverId, 3) ] = 0;
#ifdef VAR_RANGES
		logval("leader[server:serverId]", ((int)leader[ Index(((int)((P0 *)_this)->serverId), 3) ]));
#endif
		;
		/* merge: .(goto)(265, 242, 265) */
		reached[0][242] = 1;
		;
		/* merge: currentTerm[serverId] = msg.appendEntry.term(265, 243, 265) */
		reached[0][243] = 1;
		(trpt+1)->bup.ovals[3] = ((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]);
		now.currentTerm[ Index(((P0 *)_this)->serverId, 3) ] = ((int)((P0 *)_this)->msg.appendEntry.term);
#ifdef VAR_RANGES
		logval("currentTerm[server:serverId]", ((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]));
#endif
		;
		/* merge: state[serverId] = 2(265, 244, 265) */
		reached[0][244] = 1;
		(trpt+1)->bup.ovals[4] = now.state[ Index(((int)((P0 *)_this)->serverId), 3) ];
		now.state[ Index(((P0 *)_this)->serverId, 3) ] = 2;
#ifdef VAR_RANGES
		logval("state[server:serverId]", now.state[ Index(((int)((P0 *)_this)->serverId), 3) ]);
#endif
		;
		/* merge: votedFor = 10(265, 245, 265) */
		reached[0][245] = 1;
		(trpt+1)->bup.ovals[5] = ((int)((P0 *)_this)->votedFor);
		((P0 *)_this)->votedFor = 10;
#ifdef VAR_RANGES
		logval("server:votedFor", ((int)((P0 *)_this)->votedFor));
#endif
		;
		/* merge: time_out[serverId] = 1(265, 246, 265) */
		reached[0][246] = 1;
		(trpt+1)->bup.ovals[6] = ((int)now.time_out[ Index(((int)((P0 *)_this)->serverId), 3) ]);
		now.time_out[ Index(((P0 *)_this)->serverId, 3) ] = 1;
#ifdef VAR_RANGES
		logval("time_out[server:serverId]", ((int)now.time_out[ Index(((int)((P0 *)_this)->serverId), 3) ]));
#endif
		;
		/* merge: .(goto)(0, 251, 265) */
		reached[0][251] = 1;
		;
		_m = 3; goto P999; /* 9 */
	case 102: // STATE 240 - raft_sem8.pml:337 - [(1)] (265:0:4 - 1)
		IfNotBlocked
		reached[0][240] = 1;
		if (!(1))
			continue;
		/* merge: .(goto)(265, 242, 265) */
		reached[0][242] = 1;
		;
		/* merge: currentTerm[serverId] = msg.appendEntry.term(265, 243, 265) */
		reached[0][243] = 1;
		(trpt+1)->bup.ovals = grab_ints(4);
		(trpt+1)->bup.ovals[0] = ((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]);
		now.currentTerm[ Index(((P0 *)_this)->serverId, 3) ] = ((int)((P0 *)_this)->msg.appendEntry.term);
#ifdef VAR_RANGES
		logval("currentTerm[server:serverId]", ((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]));
#endif
		;
		/* merge: state[serverId] = 2(265, 244, 265) */
		reached[0][244] = 1;
		(trpt+1)->bup.ovals[1] = now.state[ Index(((int)((P0 *)_this)->serverId), 3) ];
		now.state[ Index(((P0 *)_this)->serverId, 3) ] = 2;
#ifdef VAR_RANGES
		logval("state[server:serverId]", now.state[ Index(((int)((P0 *)_this)->serverId), 3) ]);
#endif
		;
		/* merge: votedFor = 10(265, 245, 265) */
		reached[0][245] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)_this)->votedFor);
		((P0 *)_this)->votedFor = 10;
#ifdef VAR_RANGES
		logval("server:votedFor", ((int)((P0 *)_this)->votedFor));
#endif
		;
		/* merge: time_out[serverId] = 1(265, 246, 265) */
		reached[0][246] = 1;
		(trpt+1)->bup.ovals[3] = ((int)now.time_out[ Index(((int)((P0 *)_this)->serverId), 3) ]);
		now.time_out[ Index(((P0 *)_this)->serverId, 3) ] = 1;
#ifdef VAR_RANGES
		logval("time_out[server:serverId]", ((int)now.time_out[ Index(((int)((P0 *)_this)->serverId), 3) ]));
#endif
		;
		/* merge: .(goto)(0, 251, 265) */
		reached[0][251] = 1;
		;
		_m = 3; goto P999; /* 6 */
	case 103: // STATE 243 - raft_sem8.pml:339 - [currentTerm[serverId] = msg.appendEntry.term] (0:265:4 - 3)
		IfNotBlocked
		reached[0][243] = 1;
		(trpt+1)->bup.ovals = grab_ints(4);
		(trpt+1)->bup.ovals[0] = ((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]);
		now.currentTerm[ Index(((P0 *)_this)->serverId, 3) ] = ((int)((P0 *)_this)->msg.appendEntry.term);
#ifdef VAR_RANGES
		logval("currentTerm[server:serverId]", ((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]));
#endif
		;
		/* merge: state[serverId] = 2(265, 244, 265) */
		reached[0][244] = 1;
		(trpt+1)->bup.ovals[1] = now.state[ Index(((int)((P0 *)_this)->serverId), 3) ];
		now.state[ Index(((P0 *)_this)->serverId, 3) ] = 2;
#ifdef VAR_RANGES
		logval("state[server:serverId]", now.state[ Index(((int)((P0 *)_this)->serverId), 3) ]);
#endif
		;
		/* merge: votedFor = 10(265, 245, 265) */
		reached[0][245] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)_this)->votedFor);
		((P0 *)_this)->votedFor = 10;
#ifdef VAR_RANGES
		logval("server:votedFor", ((int)((P0 *)_this)->votedFor));
#endif
		;
		/* merge: time_out[serverId] = 1(265, 246, 265) */
		reached[0][246] = 1;
		(trpt+1)->bup.ovals[3] = ((int)now.time_out[ Index(((int)((P0 *)_this)->serverId), 3) ]);
		now.time_out[ Index(((P0 *)_this)->serverId, 3) ] = 1;
#ifdef VAR_RANGES
		logval("time_out[server:serverId]", ((int)now.time_out[ Index(((int)((P0 *)_this)->serverId), 3) ]));
#endif
		;
		/* merge: .(goto)(0, 251, 265) */
		reached[0][251] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 104: // STATE 247 - raft_sem8.pml:343 - [((msg.appendEntry.term<=currentTerm[serverId]))] (249:0:0 - 1)
		IfNotBlocked
		reached[0][247] = 1;
		if (!((((int)((P0 *)_this)->msg.appendEntry.term)<=((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]))))
			continue;
		/* merge: printf('SERVER %d: AppendEntries term %d <= current term %d\\n',serverId,msg.appendEntry.term,currentTerm[serverId])(0, 248, 249) */
		reached[0][248] = 1;
		Printf("SERVER %d: AppendEntries term %d <= current term %d\n", ((int)((P0 *)_this)->serverId), ((int)((P0 *)_this)->msg.appendEntry.term), ((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]));
		_m = 3; goto P999; /* 1 */
	case 105: // STATE 252 - raft_sem8.pml:351 - [((msg.appendEntry.term==currentTerm[serverId]))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][252] = 1;
		if (!((((int)((P0 *)_this)->msg.appendEntry.term)==((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 106: // STATE 253 - raft_sem8.pml:353 - [((state[serverId]==3))] (286:0:8 - 1)
		IfNotBlocked
		reached[0][253] = 1;
		if (!((now.state[ Index(((int)((P0 *)_this)->serverId), 3) ]==3)))
			continue;
		/* merge: printf('SERVER %d: Stepping down from candidate to follower for term %d\\n',serverId,currentTerm[serverId])(286, 254, 286) */
		reached[0][254] = 1;
		Printf("SERVER %d: Stepping down from candidate to follower for term %d\n", ((int)((P0 *)_this)->serverId), ((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]));
		/* merge: state[serverId] = 2(286, 255, 286) */
		reached[0][255] = 1;
		(trpt+1)->bup.ovals = grab_ints(8);
		(trpt+1)->bup.ovals[0] = now.state[ Index(((int)((P0 *)_this)->serverId), 3) ];
		now.state[ Index(((P0 *)_this)->serverId, 3) ] = 2;
#ifdef VAR_RANGES
		logval("state[server:serverId]", now.state[ Index(((int)((P0 *)_this)->serverId), 3) ]);
#endif
		;
		/* merge: votedFor = 10(286, 256, 286) */
		reached[0][256] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P0 *)_this)->votedFor);
		((P0 *)_this)->votedFor = 10;
#ifdef VAR_RANGES
		logval("server:votedFor", ((int)((P0 *)_this)->votedFor));
#endif
		;
		/* merge: .(goto)(286, 260, 286) */
		reached[0][260] = 1;
		;
		/* merge: time_out[serverId] = 1(286, 261, 286) */
		reached[0][261] = 1;
		(trpt+1)->bup.ovals[2] = ((int)now.time_out[ Index(((int)((P0 *)_this)->serverId), 3) ]);
		now.time_out[ Index(((P0 *)_this)->serverId, 3) ] = 1;
#ifdef VAR_RANGES
		logval("time_out[server:serverId]", ((int)now.time_out[ Index(((int)((P0 *)_this)->serverId), 3) ]));
#endif
		;
		/* merge: printf('SERVER %d: Reset timeout on AppendEntries from leader\\n',serverId)(286, 262, 286) */
		reached[0][262] = 1;
		Printf("SERVER %d: Reset timeout on AppendEntries from leader\n", ((int)((P0 *)_this)->serverId));
		/* merge: .(goto)(286, 266, 286) */
		reached[0][266] = 1;
		;
		/* merge: logOk = ((msg.appendEntry.index==0)||((msg.appendEntry.index==1)&&(msg.appendEntry.prevLogTerm==logs[serverId].logs[0])))(286, 267, 286) */
		reached[0][267] = 1;
		(trpt+1)->bup.ovals[3] = ((int)((P0 *)_this)->logOk);
		((P0 *)_this)->logOk = ((((int)((P0 *)_this)->msg.appendEntry.index)==0)||((((int)((P0 *)_this)->msg.appendEntry.index)==1)&&(((int)((P0 *)_this)->msg.appendEntry.prevLogTerm)==((int)now.logs[ Index(((int)((P0 *)_this)->serverId), 3) ].logs[0]))));
#ifdef VAR_RANGES
		logval("server:logOk", ((int)((P0 *)_this)->logOk));
#endif
		;
		/* merge: outMsg.messageType = 3(286, 268, 286) */
		reached[0][268] = 1;
		(trpt+1)->bup.ovals[4] = ((P0 *)_this)->outMsg.messageType;
		((P0 *)_this)->outMsg.messageType = 3;
#ifdef VAR_RANGES
		logval("server:outMsg.messageType", ((P0 *)_this)->outMsg.messageType);
#endif
		;
		/* merge: outMsg.sender = serverId(286, 269, 286) */
		reached[0][269] = 1;
		(trpt+1)->bup.ovals[5] = ((int)((P0 *)_this)->outMsg.sender);
		((P0 *)_this)->outMsg.sender = ((int)((P0 *)_this)->serverId);
#ifdef VAR_RANGES
		logval("server:outMsg.sender", ((int)((P0 *)_this)->outMsg.sender));
#endif
		;
		/* merge: outMsg.receiver = sender(286, 270, 286) */
		reached[0][270] = 1;
		(trpt+1)->bup.ovals[6] = ((int)((P0 *)_this)->outMsg.receiver);
		((P0 *)_this)->outMsg.receiver = ((int)((P0 *)_this)->_11_7_sender);
#ifdef VAR_RANGES
		logval("server:outMsg.receiver", ((int)((P0 *)_this)->outMsg.receiver));
#endif
		;
		/* merge: outMsg.appendEntryResponse.term = currentTerm[serverId](286, 271, 286) */
		reached[0][271] = 1;
		(trpt+1)->bup.ovals[7] = ((int)((P0 *)_this)->outMsg.appendEntryResponse.term);
		((P0 *)_this)->outMsg.appendEntryResponse.term = ((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]);
#ifdef VAR_RANGES
		logval("server:outMsg.appendEntryResponse.term", ((int)((P0 *)_this)->outMsg.appendEntryResponse.term));
#endif
		;
		_m = 3; goto P999; /* 12 */
	case 107: // STATE 258 - raft_sem8.pml:358 - [(1)] (286:0:6 - 1)
		IfNotBlocked
		reached[0][258] = 1;
		if (!(1))
			continue;
		/* merge: .(goto)(286, 260, 286) */
		reached[0][260] = 1;
		;
		/* merge: time_out[serverId] = 1(286, 261, 286) */
		reached[0][261] = 1;
		(trpt+1)->bup.ovals = grab_ints(6);
		(trpt+1)->bup.ovals[0] = ((int)now.time_out[ Index(((int)((P0 *)_this)->serverId), 3) ]);
		now.time_out[ Index(((P0 *)_this)->serverId, 3) ] = 1;
#ifdef VAR_RANGES
		logval("time_out[server:serverId]", ((int)now.time_out[ Index(((int)((P0 *)_this)->serverId), 3) ]));
#endif
		;
		/* merge: printf('SERVER %d: Reset timeout on AppendEntries from leader\\n',serverId)(286, 262, 286) */
		reached[0][262] = 1;
		Printf("SERVER %d: Reset timeout on AppendEntries from leader\n", ((int)((P0 *)_this)->serverId));
		/* merge: .(goto)(286, 266, 286) */
		reached[0][266] = 1;
		;
		/* merge: logOk = ((msg.appendEntry.index==0)||((msg.appendEntry.index==1)&&(msg.appendEntry.prevLogTerm==logs[serverId].logs[0])))(286, 267, 286) */
		reached[0][267] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P0 *)_this)->logOk);
		((P0 *)_this)->logOk = ((((int)((P0 *)_this)->msg.appendEntry.index)==0)||((((int)((P0 *)_this)->msg.appendEntry.index)==1)&&(((int)((P0 *)_this)->msg.appendEntry.prevLogTerm)==((int)now.logs[ Index(((int)((P0 *)_this)->serverId), 3) ].logs[0]))));
#ifdef VAR_RANGES
		logval("server:logOk", ((int)((P0 *)_this)->logOk));
#endif
		;
		/* merge: outMsg.messageType = 3(286, 268, 286) */
		reached[0][268] = 1;
		(trpt+1)->bup.ovals[2] = ((P0 *)_this)->outMsg.messageType;
		((P0 *)_this)->outMsg.messageType = 3;
#ifdef VAR_RANGES
		logval("server:outMsg.messageType", ((P0 *)_this)->outMsg.messageType);
#endif
		;
		/* merge: outMsg.sender = serverId(286, 269, 286) */
		reached[0][269] = 1;
		(trpt+1)->bup.ovals[3] = ((int)((P0 *)_this)->outMsg.sender);
		((P0 *)_this)->outMsg.sender = ((int)((P0 *)_this)->serverId);
#ifdef VAR_RANGES
		logval("server:outMsg.sender", ((int)((P0 *)_this)->outMsg.sender));
#endif
		;
		/* merge: outMsg.receiver = sender(286, 270, 286) */
		reached[0][270] = 1;
		(trpt+1)->bup.ovals[4] = ((int)((P0 *)_this)->outMsg.receiver);
		((P0 *)_this)->outMsg.receiver = ((int)((P0 *)_this)->_11_7_sender);
#ifdef VAR_RANGES
		logval("server:outMsg.receiver", ((int)((P0 *)_this)->outMsg.receiver));
#endif
		;
		/* merge: outMsg.appendEntryResponse.term = currentTerm[serverId](286, 271, 286) */
		reached[0][271] = 1;
		(trpt+1)->bup.ovals[5] = ((int)((P0 *)_this)->outMsg.appendEntryResponse.term);
		((P0 *)_this)->outMsg.appendEntryResponse.term = ((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]);
#ifdef VAR_RANGES
		logval("server:outMsg.appendEntryResponse.term", ((int)((P0 *)_this)->outMsg.appendEntryResponse.term));
#endif
		;
		_m = 3; goto P999; /* 9 */
	case 108: // STATE 261 - raft_sem8.pml:361 - [time_out[serverId] = 1] (0:286:6 - 3)
		IfNotBlocked
		reached[0][261] = 1;
		(trpt+1)->bup.ovals = grab_ints(6);
		(trpt+1)->bup.ovals[0] = ((int)now.time_out[ Index(((int)((P0 *)_this)->serverId), 3) ]);
		now.time_out[ Index(((P0 *)_this)->serverId, 3) ] = 1;
#ifdef VAR_RANGES
		logval("time_out[server:serverId]", ((int)now.time_out[ Index(((int)((P0 *)_this)->serverId), 3) ]));
#endif
		;
		/* merge: printf('SERVER %d: Reset timeout on AppendEntries from leader\\n',serverId)(286, 262, 286) */
		reached[0][262] = 1;
		Printf("SERVER %d: Reset timeout on AppendEntries from leader\n", ((int)((P0 *)_this)->serverId));
		/* merge: .(goto)(286, 266, 286) */
		reached[0][266] = 1;
		;
		/* merge: logOk = ((msg.appendEntry.index==0)||((msg.appendEntry.index==1)&&(msg.appendEntry.prevLogTerm==logs[serverId].logs[0])))(286, 267, 286) */
		reached[0][267] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P0 *)_this)->logOk);
		((P0 *)_this)->logOk = ((((int)((P0 *)_this)->msg.appendEntry.index)==0)||((((int)((P0 *)_this)->msg.appendEntry.index)==1)&&(((int)((P0 *)_this)->msg.appendEntry.prevLogTerm)==((int)now.logs[ Index(((int)((P0 *)_this)->serverId), 3) ].logs[0]))));
#ifdef VAR_RANGES
		logval("server:logOk", ((int)((P0 *)_this)->logOk));
#endif
		;
		/* merge: outMsg.messageType = 3(286, 268, 286) */
		reached[0][268] = 1;
		(trpt+1)->bup.ovals[2] = ((P0 *)_this)->outMsg.messageType;
		((P0 *)_this)->outMsg.messageType = 3;
#ifdef VAR_RANGES
		logval("server:outMsg.messageType", ((P0 *)_this)->outMsg.messageType);
#endif
		;
		/* merge: outMsg.sender = serverId(286, 269, 286) */
		reached[0][269] = 1;
		(trpt+1)->bup.ovals[3] = ((int)((P0 *)_this)->outMsg.sender);
		((P0 *)_this)->outMsg.sender = ((int)((P0 *)_this)->serverId);
#ifdef VAR_RANGES
		logval("server:outMsg.sender", ((int)((P0 *)_this)->outMsg.sender));
#endif
		;
		/* merge: outMsg.receiver = sender(286, 270, 286) */
		reached[0][270] = 1;
		(trpt+1)->bup.ovals[4] = ((int)((P0 *)_this)->outMsg.receiver);
		((P0 *)_this)->outMsg.receiver = ((int)((P0 *)_this)->_11_7_sender);
#ifdef VAR_RANGES
		logval("server:outMsg.receiver", ((int)((P0 *)_this)->outMsg.receiver));
#endif
		;
		/* merge: outMsg.appendEntryResponse.term = currentTerm[serverId](286, 271, 286) */
		reached[0][271] = 1;
		(trpt+1)->bup.ovals[5] = ((int)((P0 *)_this)->outMsg.appendEntryResponse.term);
		((P0 *)_this)->outMsg.appendEntryResponse.term = ((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]);
#ifdef VAR_RANGES
		logval("server:outMsg.appendEntryResponse.term", ((int)((P0 *)_this)->outMsg.appendEntryResponse.term));
#endif
		;
		_m = 3; goto P999; /* 7 */
	case 109: // STATE 264 - raft_sem8.pml:363 - [(1)] (286:0:5 - 1)
		IfNotBlocked
		reached[0][264] = 1;
		if (!(1))
			continue;
		/* merge: .(goto)(286, 266, 286) */
		reached[0][266] = 1;
		;
		/* merge: logOk = ((msg.appendEntry.index==0)||((msg.appendEntry.index==1)&&(msg.appendEntry.prevLogTerm==logs[serverId].logs[0])))(286, 267, 286) */
		reached[0][267] = 1;
		(trpt+1)->bup.ovals = grab_ints(5);
		(trpt+1)->bup.ovals[0] = ((int)((P0 *)_this)->logOk);
		((P0 *)_this)->logOk = ((((int)((P0 *)_this)->msg.appendEntry.index)==0)||((((int)((P0 *)_this)->msg.appendEntry.index)==1)&&(((int)((P0 *)_this)->msg.appendEntry.prevLogTerm)==((int)now.logs[ Index(((int)((P0 *)_this)->serverId), 3) ].logs[0]))));
#ifdef VAR_RANGES
		logval("server:logOk", ((int)((P0 *)_this)->logOk));
#endif
		;
		/* merge: outMsg.messageType = 3(286, 268, 286) */
		reached[0][268] = 1;
		(trpt+1)->bup.ovals[1] = ((P0 *)_this)->outMsg.messageType;
		((P0 *)_this)->outMsg.messageType = 3;
#ifdef VAR_RANGES
		logval("server:outMsg.messageType", ((P0 *)_this)->outMsg.messageType);
#endif
		;
		/* merge: outMsg.sender = serverId(286, 269, 286) */
		reached[0][269] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)_this)->outMsg.sender);
		((P0 *)_this)->outMsg.sender = ((int)((P0 *)_this)->serverId);
#ifdef VAR_RANGES
		logval("server:outMsg.sender", ((int)((P0 *)_this)->outMsg.sender));
#endif
		;
		/* merge: outMsg.receiver = sender(286, 270, 286) */
		reached[0][270] = 1;
		(trpt+1)->bup.ovals[3] = ((int)((P0 *)_this)->outMsg.receiver);
		((P0 *)_this)->outMsg.receiver = ((int)((P0 *)_this)->_11_7_sender);
#ifdef VAR_RANGES
		logval("server:outMsg.receiver", ((int)((P0 *)_this)->outMsg.receiver));
#endif
		;
		/* merge: outMsg.appendEntryResponse.term = currentTerm[serverId](286, 271, 286) */
		reached[0][271] = 1;
		(trpt+1)->bup.ovals[4] = ((int)((P0 *)_this)->outMsg.appendEntryResponse.term);
		((P0 *)_this)->outMsg.appendEntryResponse.term = ((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]);
#ifdef VAR_RANGES
		logval("server:outMsg.appendEntryResponse.term", ((int)((P0 *)_this)->outMsg.appendEntryResponse.term));
#endif
		;
		_m = 3; goto P999; /* 6 */
	case 110: // STATE 267 - raft_sem8.pml:367 - [logOk = ((msg.appendEntry.index==0)||((msg.appendEntry.index==1)&&(msg.appendEntry.prevLogTerm==logs[serverId].logs[0])))] (0:286:5 - 3)
		IfNotBlocked
		reached[0][267] = 1;
		(trpt+1)->bup.ovals = grab_ints(5);
		(trpt+1)->bup.ovals[0] = ((int)((P0 *)_this)->logOk);
		((P0 *)_this)->logOk = ((((int)((P0 *)_this)->msg.appendEntry.index)==0)||((((int)((P0 *)_this)->msg.appendEntry.index)==1)&&(((int)((P0 *)_this)->msg.appendEntry.prevLogTerm)==((int)now.logs[ Index(((int)((P0 *)_this)->serverId), 3) ].logs[0]))));
#ifdef VAR_RANGES
		logval("server:logOk", ((int)((P0 *)_this)->logOk));
#endif
		;
		/* merge: outMsg.messageType = 3(286, 268, 286) */
		reached[0][268] = 1;
		(trpt+1)->bup.ovals[1] = ((P0 *)_this)->outMsg.messageType;
		((P0 *)_this)->outMsg.messageType = 3;
#ifdef VAR_RANGES
		logval("server:outMsg.messageType", ((P0 *)_this)->outMsg.messageType);
#endif
		;
		/* merge: outMsg.sender = serverId(286, 269, 286) */
		reached[0][269] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)_this)->outMsg.sender);
		((P0 *)_this)->outMsg.sender = ((int)((P0 *)_this)->serverId);
#ifdef VAR_RANGES
		logval("server:outMsg.sender", ((int)((P0 *)_this)->outMsg.sender));
#endif
		;
		/* merge: outMsg.receiver = sender(286, 270, 286) */
		reached[0][270] = 1;
		(trpt+1)->bup.ovals[3] = ((int)((P0 *)_this)->outMsg.receiver);
		((P0 *)_this)->outMsg.receiver = ((int)((P0 *)_this)->_11_7_sender);
#ifdef VAR_RANGES
		logval("server:outMsg.receiver", ((int)((P0 *)_this)->outMsg.receiver));
#endif
		;
		/* merge: outMsg.appendEntryResponse.term = currentTerm[serverId](286, 271, 286) */
		reached[0][271] = 1;
		(trpt+1)->bup.ovals[4] = ((int)((P0 *)_this)->outMsg.appendEntryResponse.term);
		((P0 *)_this)->outMsg.appendEntryResponse.term = ((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]);
#ifdef VAR_RANGES
		logval("server:outMsg.appendEntryResponse.term", ((int)((P0 *)_this)->outMsg.appendEntryResponse.term));
#endif
		;
		_m = 3; goto P999; /* 4 */
	case 111: // STATE 272 - raft_sem8.pml:378 - [(((msg.appendEntry.term<currentTerm[serverId])||(((msg.appendEntry.term==currentTerm[serverId])&&(state[serverId]==2))&&!(logOk))))] (288:0:1 - 1)
		IfNotBlocked
		reached[0][272] = 1;
		if (!(((((int)((P0 *)_this)->msg.appendEntry.term)<((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]))||(((((int)((P0 *)_this)->msg.appendEntry.term)==((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]))&&(now.state[ Index(((int)((P0 *)_this)->serverId), 3) ]==2))&& !(((int)((P0 *)_this)->logOk))))))
			continue;
		/* merge: outMsg.appendEntryResponse.success = 0(288, 273, 288) */
		reached[0][273] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)_this)->outMsg.appendEntryResponse.success);
		((P0 *)_this)->outMsg.appendEntryResponse.success = 0;
#ifdef VAR_RANGES
		logval("server:outMsg.appendEntryResponse.success", ((int)((P0 *)_this)->outMsg.appendEntryResponse.success));
#endif
		;
		/* merge: printf('SERVER %d: Rejecting AppendEntries,term = %d,logOk = %d\\n',serverId,currentTerm[serverId],logOk)(288, 274, 288) */
		reached[0][274] = 1;
		Printf("SERVER %d: Rejecting AppendEntries,term = %d,logOk = %d\n", ((int)((P0 *)_this)->serverId), ((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]), ((int)((P0 *)_this)->logOk));
		/* merge: .(goto)(0, 287, 288) */
		reached[0][287] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 112: // STATE 275 - raft_sem8.pml:383 - [((((msg.appendEntry.term==currentTerm[serverId])&&(state[serverId]==2))&&logOk))] (282:0:2 - 1)
		IfNotBlocked
		reached[0][275] = 1;
		if (!((((((int)((P0 *)_this)->msg.appendEntry.term)==((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]))&&(now.state[ Index(((int)((P0 *)_this)->serverId), 3) ]==2))&&((int)((P0 *)_this)->logOk))))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: logOk */  (trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P0 *)_this)->logOk;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)_this)->logOk = 0;
		/* merge: outMsg.appendEntryResponse.success = 1(282, 276, 282) */
		reached[0][276] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P0 *)_this)->outMsg.appendEntryResponse.success);
		((P0 *)_this)->outMsg.appendEntryResponse.success = 1;
#ifdef VAR_RANGES
		logval("server:outMsg.appendEntryResponse.success", ((int)((P0 *)_this)->outMsg.appendEntryResponse.success));
#endif
		;
		/* merge: printf('SERVER %d: Accepting AppendEntries,updating log at index %d to term %d\\n',serverId,msg.appendEntry.index,msg.appendEntry.term)(282, 277, 282) */
		reached[0][277] = 1;
		Printf("SERVER %d: Accepting AppendEntries,updating log at index %d to term %d\n", ((int)((P0 *)_this)->serverId), ((int)((P0 *)_this)->msg.appendEntry.index), ((int)((P0 *)_this)->msg.appendEntry.term));
		_m = 3; goto P999; /* 2 */
	case 113: // STATE 278 - raft_sem8.pml:391 - [((msg.appendEntry.index!=10))] (288:0:2 - 1)
		IfNotBlocked
		reached[0][278] = 1;
		if (!((((int)((P0 *)_this)->msg.appendEntry.index)!=10)))
			continue;
		/* merge: logs[serverId].logs[msg.appendEntry.index] = msg.appendEntry.term(288, 279, 288) */
		reached[0][279] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.logs[ Index(((int)((P0 *)_this)->serverId), 3) ].logs[ Index(((int)((P0 *)_this)->msg.appendEntry.index), 2) ]);
		now.logs[ Index(((P0 *)_this)->serverId, 3) ].logs[ Index(((P0 *)_this)->msg.appendEntry.index, 2) ] = ((int)((P0 *)_this)->msg.appendEntry.term);
#ifdef VAR_RANGES
		logval("logs[server:serverId].logs[server:msg.appendEntry.index]", ((int)now.logs[ Index(((int)((P0 *)_this)->serverId), 3) ].logs[ Index(((int)((P0 *)_this)->msg.appendEntry.index), 2) ]));
#endif
		;
		/* merge: .(goto)(288, 283, 288) */
		reached[0][283] = 1;
		;
		/* merge: commitIndex[serverId] = msg.appendEntry.leaderCommit(288, 284, 288) */
		reached[0][284] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.commitIndex[ Index(((int)((P0 *)_this)->serverId), 3) ]);
		now.commitIndex[ Index(((P0 *)_this)->serverId, 3) ] = ((int)((P0 *)_this)->msg.appendEntry.leaderCommit);
#ifdef VAR_RANGES
		logval("commitIndex[server:serverId]", ((int)now.commitIndex[ Index(((int)((P0 *)_this)->serverId), 3) ]));
#endif
		;
		/* merge: printf('SERVER %d: Updated commitIndex to %d\\n',serverId,commitIndex[serverId])(288, 285, 288) */
		reached[0][285] = 1;
		Printf("SERVER %d: Updated commitIndex to %d\n", ((int)((P0 *)_this)->serverId), ((int)now.commitIndex[ Index(((int)((P0 *)_this)->serverId), 3) ]));
		/* merge: .(goto)(0, 287, 288) */
		reached[0][287] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 114: // STATE 281 - raft_sem8.pml:393 - [(1)] (288:0:1 - 1)
		IfNotBlocked
		reached[0][281] = 1;
		if (!(1))
			continue;
		/* merge: .(goto)(288, 283, 288) */
		reached[0][283] = 1;
		;
		/* merge: commitIndex[serverId] = msg.appendEntry.leaderCommit(288, 284, 288) */
		reached[0][284] = 1;
		(trpt+1)->bup.oval = ((int)now.commitIndex[ Index(((int)((P0 *)_this)->serverId), 3) ]);
		now.commitIndex[ Index(((P0 *)_this)->serverId, 3) ] = ((int)((P0 *)_this)->msg.appendEntry.leaderCommit);
#ifdef VAR_RANGES
		logval("commitIndex[server:serverId]", ((int)now.commitIndex[ Index(((int)((P0 *)_this)->serverId), 3) ]));
#endif
		;
		/* merge: printf('SERVER %d: Updated commitIndex to %d\\n',serverId,commitIndex[serverId])(288, 285, 288) */
		reached[0][285] = 1;
		Printf("SERVER %d: Updated commitIndex to %d\n", ((int)((P0 *)_this)->serverId), ((int)now.commitIndex[ Index(((int)((P0 *)_this)->serverId), 3) ]));
		/* merge: .(goto)(0, 287, 288) */
		reached[0][287] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 115: // STATE 284 - raft_sem8.pml:397 - [commitIndex[serverId] = msg.appendEntry.leaderCommit] (0:288:1 - 3)
		IfNotBlocked
		reached[0][284] = 1;
		(trpt+1)->bup.oval = ((int)now.commitIndex[ Index(((int)((P0 *)_this)->serverId), 3) ]);
		now.commitIndex[ Index(((P0 *)_this)->serverId, 3) ] = ((int)((P0 *)_this)->msg.appendEntry.leaderCommit);
#ifdef VAR_RANGES
		logval("commitIndex[server:serverId]", ((int)now.commitIndex[ Index(((int)((P0 *)_this)->serverId), 3) ]));
#endif
		;
		/* merge: printf('SERVER %d: Updated commitIndex to %d\\n',serverId,commitIndex[serverId])(288, 285, 288) */
		reached[0][285] = 1;
		Printf("SERVER %d: Updated commitIndex to %d\n", ((int)((P0 *)_this)->serverId), ((int)now.commitIndex[ Index(((int)((P0 *)_this)->serverId), 3) ]));
		/* merge: .(goto)(0, 287, 288) */
		reached[0][287] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 116: // STATE 288 - raft_sem8.pml:402 - [toNodes[sender]!outMsg.messageType,outMsg.sender,outMsg.receiver,outMsg.appendEntry.term,outMsg.appendEntry.leaderCommit,outMsg.appendEntry.index,outMsg.appendEntry.prevLogTerm,outMsg.appendEntryResponse.term,outMsg.appendEntryResponse.success,outMsg.requestVote.term,outMsg.requestVote.lastLogIndex,outMsg.requestVote.lastLogTerm,outMsg.requestVoteResponse.term,outMsg.requestVoteResponse.voteGranted] (372:0:0 - 3)
		IfNotBlocked
		reached[0][288] = 1;
		if (q_full(now.toNodes[ Index(((int)((P0 *)_this)->_11_7_sender), 3) ]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.toNodes[ Index(((int)((P0 *)_this)->_11_7_sender), 3) ]);
		sprintf(simtmp, "%d", ((P0 *)_this)->outMsg.messageType); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->outMsg.sender)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->outMsg.receiver)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->outMsg.appendEntry.term)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->outMsg.appendEntry.leaderCommit)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->outMsg.appendEntry.index)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->outMsg.appendEntry.prevLogTerm)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->outMsg.appendEntryResponse.term)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->outMsg.appendEntryResponse.success)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->outMsg.requestVote.term)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->outMsg.requestVote.lastLogIndex)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->outMsg.requestVote.lastLogTerm)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->outMsg.requestVoteResponse.term)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->outMsg.requestVoteResponse.voteGranted)); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.toNodes[ Index(((int)((P0 *)_this)->_11_7_sender), 3) ], 0, ((P0 *)_this)->outMsg.messageType, ((int)((P0 *)_this)->outMsg.sender), ((int)((P0 *)_this)->outMsg.receiver), ((int)((P0 *)_this)->outMsg.appendEntry.term), ((int)((P0 *)_this)->outMsg.appendEntry.leaderCommit), ((int)((P0 *)_this)->outMsg.appendEntry.index), ((int)((P0 *)_this)->outMsg.appendEntry.prevLogTerm), ((int)((P0 *)_this)->outMsg.appendEntryResponse.term), ((int)((P0 *)_this)->outMsg.appendEntryResponse.success), ((int)((P0 *)_this)->outMsg.requestVote.term), ((int)((P0 *)_this)->outMsg.requestVote.lastLogIndex), ((int)((P0 *)_this)->outMsg.requestVote.lastLogTerm), ((int)((P0 *)_this)->outMsg.requestVoteResponse.term), ((int)((P0 *)_this)->outMsg.requestVoteResponse.voteGranted), 14);
		/* merge: .(goto)(372, 325, 372) */
		reached[0][325] = 1;
		;
		/* merge: .(goto)(0, 373, 372) */
		reached[0][373] = 1;
		;
		_m = 2; goto P999; /* 2 */
	case 117: // STATE 289 - raft_sem8.pml:404 - [((msg.messageType==3))] (322:0:0 - 1)
		IfNotBlocked
		reached[0][289] = 1;
		if (!((((P0 *)_this)->msg.messageType==3)))
			continue;
		/* merge: printf('SERVER %d: Received AppendEntriesResponse from server %d,term = %d,success = %d\\n',serverId,sender,msg.appendEntryResponse.term,msg.appendEntryResponse.success)(0, 290, 322) */
		reached[0][290] = 1;
		Printf("SERVER %d: Received AppendEntriesResponse from server %d,term = %d,success = %d\n", ((int)((P0 *)_this)->serverId), ((int)((P0 *)_this)->_11_7_sender), ((int)((P0 *)_this)->msg.appendEntryResponse.term), ((int)((P0 *)_this)->msg.appendEntryResponse.success));
		_m = 3; goto P999; /* 1 */
	case 118: // STATE 291 - raft_sem8.pml:409 - [((msg.appendEntryResponse.term>currentTerm[serverId]))] (299:0:0 - 1)
		IfNotBlocked
		reached[0][291] = 1;
		if (!((((int)((P0 *)_this)->msg.appendEntryResponse.term)>((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]))))
			continue;
		/* merge: printf('SERVER %d: Updating term from %d to %d and becoming follower\\n',serverId,currentTerm[serverId],msg.appendEntryResponse.term)(0, 292, 299) */
		reached[0][292] = 1;
		Printf("SERVER %d: Updating term from %d to %d and becoming follower\n", ((int)((P0 *)_this)->serverId), ((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]), ((int)((P0 *)_this)->msg.appendEntryResponse.term));
		_m = 3; goto P999; /* 1 */
	case 119: // STATE 293 - raft_sem8.pml:413 - [((state[serverId]==4))] (372:0:7 - 1)
		IfNotBlocked
		reached[0][293] = 1;
		if (!((now.state[ Index(((int)((P0 *)_this)->serverId), 3) ]==4)))
			continue;
		/* merge: leaders = (leaders-1)(372, 294, 372) */
		reached[0][294] = 1;
		(trpt+1)->bup.ovals = grab_ints(7);
		(trpt+1)->bup.ovals[0] = ((int)now.leaders);
		now.leaders = (((int)now.leaders)-1);
#ifdef VAR_RANGES
		logval("leaders", ((int)now.leaders));
#endif
		;
		/* merge: isLeader = (leaders>0)(372, 295, 372) */
		reached[0][295] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.isLeader);
		now.isLeader = (((int)now.leaders)>0);
#ifdef VAR_RANGES
		logval("isLeader", ((int)now.isLeader));
#endif
		;
		/* merge: leader[serverId] = 0(372, 296, 372) */
		reached[0][296] = 1;
		(trpt+1)->bup.ovals[2] = ((int)leader[ Index(((int)((P0 *)_this)->serverId), 3) ]);
		leader[ Index(((P0 *)_this)->serverId, 3) ] = 0;
#ifdef VAR_RANGES
		logval("leader[server:serverId]", ((int)leader[ Index(((int)((P0 *)_this)->serverId), 3) ]));
#endif
		;
		/* merge: .(goto)(372, 300, 372) */
		reached[0][300] = 1;
		;
		/* merge: currentTerm[serverId] = msg.appendEntryResponse.term(372, 301, 372) */
		reached[0][301] = 1;
		(trpt+1)->bup.ovals[3] = ((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]);
		now.currentTerm[ Index(((P0 *)_this)->serverId, 3) ] = ((int)((P0 *)_this)->msg.appendEntryResponse.term);
#ifdef VAR_RANGES
		logval("currentTerm[server:serverId]", ((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]));
#endif
		;
		/* merge: state[serverId] = 2(372, 302, 372) */
		reached[0][302] = 1;
		(trpt+1)->bup.ovals[4] = now.state[ Index(((int)((P0 *)_this)->serverId), 3) ];
		now.state[ Index(((P0 *)_this)->serverId, 3) ] = 2;
#ifdef VAR_RANGES
		logval("state[server:serverId]", now.state[ Index(((int)((P0 *)_this)->serverId), 3) ]);
#endif
		;
		/* merge: votedFor = 10(372, 303, 372) */
		reached[0][303] = 1;
		(trpt+1)->bup.ovals[5] = ((int)((P0 *)_this)->votedFor);
		((P0 *)_this)->votedFor = 10;
#ifdef VAR_RANGES
		logval("server:votedFor", ((int)((P0 *)_this)->votedFor));
#endif
		;
		/* merge: time_out[serverId] = 1(372, 304, 372) */
		reached[0][304] = 1;
		(trpt+1)->bup.ovals[6] = ((int)now.time_out[ Index(((int)((P0 *)_this)->serverId), 3) ]);
		now.time_out[ Index(((P0 *)_this)->serverId, 3) ] = 1;
#ifdef VAR_RANGES
		logval("time_out[server:serverId]", ((int)now.time_out[ Index(((int)((P0 *)_this)->serverId), 3) ]));
#endif
		;
		/* merge: .(goto)(372, 323, 372) */
		reached[0][323] = 1;
		;
		/* merge: .(goto)(372, 325, 372) */
		reached[0][325] = 1;
		;
		/* merge: .(goto)(0, 373, 372) */
		reached[0][373] = 1;
		;
		_m = 3; goto P999; /* 11 */
	case 120: // STATE 298 - raft_sem8.pml:417 - [(1)] (372:0:4 - 1)
		IfNotBlocked
		reached[0][298] = 1;
		if (!(1))
			continue;
		/* merge: .(goto)(372, 300, 372) */
		reached[0][300] = 1;
		;
		/* merge: currentTerm[serverId] = msg.appendEntryResponse.term(372, 301, 372) */
		reached[0][301] = 1;
		(trpt+1)->bup.ovals = grab_ints(4);
		(trpt+1)->bup.ovals[0] = ((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]);
		now.currentTerm[ Index(((P0 *)_this)->serverId, 3) ] = ((int)((P0 *)_this)->msg.appendEntryResponse.term);
#ifdef VAR_RANGES
		logval("currentTerm[server:serverId]", ((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]));
#endif
		;
		/* merge: state[serverId] = 2(372, 302, 372) */
		reached[0][302] = 1;
		(trpt+1)->bup.ovals[1] = now.state[ Index(((int)((P0 *)_this)->serverId), 3) ];
		now.state[ Index(((P0 *)_this)->serverId, 3) ] = 2;
#ifdef VAR_RANGES
		logval("state[server:serverId]", now.state[ Index(((int)((P0 *)_this)->serverId), 3) ]);
#endif
		;
		/* merge: votedFor = 10(372, 303, 372) */
		reached[0][303] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)_this)->votedFor);
		((P0 *)_this)->votedFor = 10;
#ifdef VAR_RANGES
		logval("server:votedFor", ((int)((P0 *)_this)->votedFor));
#endif
		;
		/* merge: time_out[serverId] = 1(372, 304, 372) */
		reached[0][304] = 1;
		(trpt+1)->bup.ovals[3] = ((int)now.time_out[ Index(((int)((P0 *)_this)->serverId), 3) ]);
		now.time_out[ Index(((P0 *)_this)->serverId, 3) ] = 1;
#ifdef VAR_RANGES
		logval("time_out[server:serverId]", ((int)now.time_out[ Index(((int)((P0 *)_this)->serverId), 3) ]));
#endif
		;
		/* merge: .(goto)(372, 323, 372) */
		reached[0][323] = 1;
		;
		/* merge: .(goto)(372, 325, 372) */
		reached[0][325] = 1;
		;
		/* merge: .(goto)(0, 373, 372) */
		reached[0][373] = 1;
		;
		_m = 3; goto P999; /* 8 */
	case 121: // STATE 301 - raft_sem8.pml:419 - [currentTerm[serverId] = msg.appendEntryResponse.term] (0:372:4 - 3)
		IfNotBlocked
		reached[0][301] = 1;
		(trpt+1)->bup.ovals = grab_ints(4);
		(trpt+1)->bup.ovals[0] = ((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]);
		now.currentTerm[ Index(((P0 *)_this)->serverId, 3) ] = ((int)((P0 *)_this)->msg.appendEntryResponse.term);
#ifdef VAR_RANGES
		logval("currentTerm[server:serverId]", ((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]));
#endif
		;
		/* merge: state[serverId] = 2(372, 302, 372) */
		reached[0][302] = 1;
		(trpt+1)->bup.ovals[1] = now.state[ Index(((int)((P0 *)_this)->serverId), 3) ];
		now.state[ Index(((P0 *)_this)->serverId, 3) ] = 2;
#ifdef VAR_RANGES
		logval("state[server:serverId]", now.state[ Index(((int)((P0 *)_this)->serverId), 3) ]);
#endif
		;
		/* merge: votedFor = 10(372, 303, 372) */
		reached[0][303] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)_this)->votedFor);
		((P0 *)_this)->votedFor = 10;
#ifdef VAR_RANGES
		logval("server:votedFor", ((int)((P0 *)_this)->votedFor));
#endif
		;
		/* merge: time_out[serverId] = 1(372, 304, 372) */
		reached[0][304] = 1;
		(trpt+1)->bup.ovals[3] = ((int)now.time_out[ Index(((int)((P0 *)_this)->serverId), 3) ]);
		now.time_out[ Index(((P0 *)_this)->serverId, 3) ] = 1;
#ifdef VAR_RANGES
		logval("time_out[server:serverId]", ((int)now.time_out[ Index(((int)((P0 *)_this)->serverId), 3) ]));
#endif
		;
		/* merge: .(goto)(372, 323, 372) */
		reached[0][323] = 1;
		;
		/* merge: .(goto)(372, 325, 372) */
		reached[0][325] = 1;
		;
		/* merge: .(goto)(0, 373, 372) */
		reached[0][373] = 1;
		;
		_m = 3; goto P999; /* 6 */
	case 122: // STATE 323 - raft_sem8.pml:444 - [.(goto)] (0:372:0 - 6)
		IfNotBlocked
		reached[0][323] = 1;
		;
		/* merge: .(goto)(372, 325, 372) */
		reached[0][325] = 1;
		;
		/* merge: .(goto)(0, 373, 372) */
		reached[0][373] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 123: // STATE 305 - raft_sem8.pml:423 - [((msg.appendEntryResponse.term<currentTerm[serverId]))] (307:0:0 - 1)
		IfNotBlocked
		reached[0][305] = 1;
		if (!((((int)((P0 *)_this)->msg.appendEntryResponse.term)<((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]))))
			continue;
		/* merge: printf('SERVER %d: Ignoring AppendEntriesResponse with lower term %d\\n',serverId,msg.appendEntryResponse.term)(0, 306, 307) */
		reached[0][306] = 1;
		Printf("SERVER %d: Ignoring AppendEntriesResponse with lower term %d\n", ((int)((P0 *)_this)->serverId), ((int)((P0 *)_this)->msg.appendEntryResponse.term));
		_m = 3; goto P999; /* 1 */
	case 124: // STATE 307 - raft_sem8.pml:426 - [(1)] (372:0:0 - 1)
		IfNotBlocked
		reached[0][307] = 1;
		if (!(1))
			continue;
		/* merge: .(goto)(372, 323, 372) */
		reached[0][323] = 1;
		;
		/* merge: .(goto)(372, 325, 372) */
		reached[0][325] = 1;
		;
		/* merge: .(goto)(0, 373, 372) */
		reached[0][373] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 125: // STATE 308 - raft_sem8.pml:428 - [((((msg.appendEntryResponse.term==currentTerm[serverId])&&msg.appendEntryResponse.success)&&(state[serverId]==4)))] (317:0:1 - 1)
		IfNotBlocked
		reached[0][308] = 1;
		if (!((((((int)((P0 *)_this)->msg.appendEntryResponse.term)==((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]))&&((int)((P0 *)_this)->msg.appendEntryResponse.success))&&(now.state[ Index(((int)((P0 *)_this)->serverId), 3) ]==4))))
			continue;
		/* merge: printf('SERVER %d: Successful AppendEntries,considering commit advancement\\n',serverId)(317, 309, 317) */
		reached[0][309] = 1;
		Printf("SERVER %d: Successful AppendEntries,considering commit advancement\n", ((int)((P0 *)_this)->serverId));
		/* merge: connect[serverId] = (connect[serverId]+1)(317, 310, 317) */
		reached[0][310] = 1;
		(trpt+1)->bup.oval = ((int)connect[ Index(((int)((P0 *)_this)->serverId), 3) ]);
		connect[ Index(((P0 *)_this)->serverId, 3) ] = (((int)connect[ Index(((int)((P0 *)_this)->serverId), 3) ])+1);
#ifdef VAR_RANGES
		logval("connect[server:serverId]", ((int)connect[ Index(((int)((P0 *)_this)->serverId), 3) ]));
#endif
		;
		_m = 3; goto P999; /* 2 */
	case 126: // STATE 311 - raft_sem8.pml:433 - [(((commitIndex[serverId]==0)&&(logs[sender].logs[0]==logs[serverId].logs[0])))] (372:0:2 - 1)
		IfNotBlocked
		reached[0][311] = 1;
		if (!(((((int)now.commitIndex[ Index(((int)((P0 *)_this)->serverId), 3) ])==0)&&(((int)now.logs[ Index(((int)((P0 *)_this)->_11_7_sender), 3) ].logs[0])==((int)now.logs[ Index(((int)((P0 *)_this)->serverId), 3) ].logs[0])))))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: _11_7_sender */  (trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P0 *)_this)->_11_7_sender;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)_this)->_11_7_sender = 0;
		/* merge: commitIndex[serverId] = 1(372, 312, 372) */
		reached[0][312] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.commitIndex[ Index(((int)((P0 *)_this)->serverId), 3) ]);
		now.commitIndex[ Index(((P0 *)_this)->serverId, 3) ] = 1;
#ifdef VAR_RANGES
		logval("commitIndex[server:serverId]", ((int)now.commitIndex[ Index(((int)((P0 *)_this)->serverId), 3) ]));
#endif
		;
		/* merge: printf('SERVER %d: Advanced commitIndex to 1\\n',serverId)(372, 313, 372) */
		reached[0][313] = 1;
		Printf("SERVER %d: Advanced commitIndex to 1\n", ((int)((P0 *)_this)->serverId));
		/* merge: .(goto)(372, 318, 372) */
		reached[0][318] = 1;
		;
		/* merge: .(goto)(372, 323, 372) */
		reached[0][323] = 1;
		;
		/* merge: .(goto)(372, 325, 372) */
		reached[0][325] = 1;
		;
		/* merge: .(goto)(0, 373, 372) */
		reached[0][373] = 1;
		;
		_m = 3; goto P999; /* 6 */
	case 127: // STATE 315 - raft_sem8.pml:437 - [printf('SERVER %d: Cannot advance commitIndex further\\n',serverId)] (0:0:0 - 1)
		IfNotBlocked
		reached[0][315] = 1;
		Printf("SERVER %d: Cannot advance commitIndex further\n", ((int)((P0 *)_this)->serverId));
		_m = 3; goto P999; /* 0 */
	case 128: // STATE 316 - raft_sem8.pml:438 - [(1)] (372:0:0 - 1)
		IfNotBlocked
		reached[0][316] = 1;
		if (!(1))
			continue;
		/* merge: .(goto)(372, 318, 372) */
		reached[0][318] = 1;
		;
		/* merge: .(goto)(372, 323, 372) */
		reached[0][323] = 1;
		;
		/* merge: .(goto)(372, 325, 372) */
		reached[0][325] = 1;
		;
		/* merge: .(goto)(0, 373, 372) */
		reached[0][373] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 129: // STATE 320 - raft_sem8.pml:441 - [printf('SERVER %d: AppendEntriesResponse not successful or not leader\\n',serverId)] (0:0:0 - 1)
		IfNotBlocked
		reached[0][320] = 1;
		Printf("SERVER %d: AppendEntriesResponse not successful or not leader\n", ((int)((P0 *)_this)->serverId));
		_m = 3; goto P999; /* 0 */
	case 130: // STATE 321 - raft_sem8.pml:442 - [(1)] (372:0:0 - 1)
		IfNotBlocked
		reached[0][321] = 1;
		if (!(1))
			continue;
		/* merge: .(goto)(372, 323, 372) */
		reached[0][323] = 1;
		;
		/* merge: .(goto)(372, 325, 372) */
		reached[0][325] = 1;
		;
		/* merge: .(goto)(0, 373, 372) */
		reached[0][373] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 131: // STATE 327 - raft_sem8.pml:447 - [((state[serverId]==4))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][327] = 1;
		if (!((now.state[ Index(((int)((P0 *)_this)->serverId), 3) ]==4)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 132: // STATE 328 - raft_sem8.pml:450 - [i = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[0][328] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)_this)->i);
		((P0 *)_this)->i = 0;
#ifdef VAR_RANGES
		logval("server:i", ((int)((P0 *)_this)->i));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 133: // STATE 329 - raft_sem8.pml:450 - [((i<=(3-1)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][329] = 1;
		if (!((((int)((P0 *)_this)->i)<=(3-1))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 134: // STATE 330 - raft_sem8.pml:452 - [((i!=serverId))] (347:0:5 - 1)
		IfNotBlocked
		reached[0][330] = 1;
		if (!((((int)((P0 *)_this)->i)!=((int)((P0 *)_this)->serverId))))
			continue;
		/* merge: outMsg.messageType = 4(347, 331, 347) */
		reached[0][331] = 1;
		(trpt+1)->bup.ovals = grab_ints(5);
		(trpt+1)->bup.ovals[0] = ((P0 *)_this)->outMsg.messageType;
		((P0 *)_this)->outMsg.messageType = 4;
#ifdef VAR_RANGES
		logval("server:outMsg.messageType", ((P0 *)_this)->outMsg.messageType);
#endif
		;
		/* merge: outMsg.sender = serverId(347, 332, 347) */
		reached[0][332] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P0 *)_this)->outMsg.sender);
		((P0 *)_this)->outMsg.sender = ((int)((P0 *)_this)->serverId);
#ifdef VAR_RANGES
		logval("server:outMsg.sender", ((int)((P0 *)_this)->outMsg.sender));
#endif
		;
		/* merge: outMsg.receiver = i(347, 333, 347) */
		reached[0][333] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)_this)->outMsg.receiver);
		((P0 *)_this)->outMsg.receiver = ((int)((P0 *)_this)->i);
#ifdef VAR_RANGES
		logval("server:outMsg.receiver", ((int)((P0 *)_this)->outMsg.receiver));
#endif
		;
		/* merge: outMsg.appendEntry.term = currentTerm[serverId](347, 334, 347) */
		reached[0][334] = 1;
		(trpt+1)->bup.ovals[3] = ((int)((P0 *)_this)->outMsg.appendEntry.term);
		((P0 *)_this)->outMsg.appendEntry.term = ((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]);
#ifdef VAR_RANGES
		logval("server:outMsg.appendEntry.term", ((int)((P0 *)_this)->outMsg.appendEntry.term));
#endif
		;
		/* merge: outMsg.appendEntry.leaderCommit = commitIndex[serverId](347, 335, 347) */
		reached[0][335] = 1;
		(trpt+1)->bup.ovals[4] = ((int)((P0 *)_this)->outMsg.appendEntry.leaderCommit);
		((P0 *)_this)->outMsg.appendEntry.leaderCommit = ((int)now.commitIndex[ Index(((int)((P0 *)_this)->serverId), 3) ]);
#ifdef VAR_RANGES
		logval("server:outMsg.appendEntry.leaderCommit", ((int)((P0 *)_this)->outMsg.appendEntry.leaderCommit));
#endif
		;
		/* merge: printf('SERVER %d: Leader sending AppendEntries to server %d\\n',serverId,i)(347, 336, 347) */
		reached[0][336] = 1;
		Printf("SERVER %d: Leader sending AppendEntries to server %d\n", ((int)((P0 *)_this)->serverId), ((int)((P0 *)_this)->i));
		_m = 3; goto P999; /* 6 */
	case 135: // STATE 337 - raft_sem8.pml:463 - [((logs[serverId].logs[0]!=logs[i].logs[0]))] (349:0:1 - 1)
		IfNotBlocked
		reached[0][337] = 1;
		if (!((((int)now.logs[ Index(((int)((P0 *)_this)->serverId), 3) ].logs[0])!=((int)now.logs[ Index(((int)((P0 *)_this)->i), 3) ].logs[0]))))
			continue;
		/* merge: outMsg.appendEntry.index = 0(349, 338, 349) */
		reached[0][338] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)_this)->outMsg.appendEntry.index);
		((P0 *)_this)->outMsg.appendEntry.index = 0;
#ifdef VAR_RANGES
		logval("server:outMsg.appendEntry.index", ((int)((P0 *)_this)->outMsg.appendEntry.index));
#endif
		;
		/* merge: printf('SERVER %d: Sending log at index 0,term = %d\\n',serverId,outMsg.appendEntry.term)(349, 339, 349) */
		reached[0][339] = 1;
		Printf("SERVER %d: Sending log at index 0,term = %d\n", ((int)((P0 *)_this)->serverId), ((int)((P0 *)_this)->outMsg.appendEntry.term));
		/* merge: .(goto)(0, 348, 349) */
		reached[0][348] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 136: // STATE 340 - raft_sem8.pml:467 - [((((logs[serverId].logs[1]!=0)&&(logs[serverId].logs[0]==logs[i].logs[0]))&&(logs[serverId].logs[1]!=logs[i].logs[1])))] (349:0:2 - 1)
		IfNotBlocked
		reached[0][340] = 1;
		if (!((((((int)now.logs[ Index(((int)((P0 *)_this)->serverId), 3) ].logs[1])!=0)&&(((int)now.logs[ Index(((int)((P0 *)_this)->serverId), 3) ].logs[0])==((int)now.logs[ Index(((int)((P0 *)_this)->i), 3) ].logs[0])))&&(((int)now.logs[ Index(((int)((P0 *)_this)->serverId), 3) ].logs[1])!=((int)now.logs[ Index(((int)((P0 *)_this)->i), 3) ].logs[1])))))
			continue;
		/* merge: outMsg.appendEntry.index = 1(349, 341, 349) */
		reached[0][341] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P0 *)_this)->outMsg.appendEntry.index);
		((P0 *)_this)->outMsg.appendEntry.index = 1;
#ifdef VAR_RANGES
		logval("server:outMsg.appendEntry.index", ((int)((P0 *)_this)->outMsg.appendEntry.index));
#endif
		;
		/* merge: outMsg.appendEntry.prevLogTerm = logs[i].logs[0](349, 342, 349) */
		reached[0][342] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P0 *)_this)->outMsg.appendEntry.prevLogTerm);
		((P0 *)_this)->outMsg.appendEntry.prevLogTerm = ((int)now.logs[ Index(((int)((P0 *)_this)->i), 3) ].logs[0]);
#ifdef VAR_RANGES
		logval("server:outMsg.appendEntry.prevLogTerm", ((int)((P0 *)_this)->outMsg.appendEntry.prevLogTerm));
#endif
		;
		/* merge: printf('SERVER %d: Sending log at index 1,term = %d,prevLogTerm = %d\\n',serverId,outMsg.appendEntry.term,outMsg.appendEntry.prevLogTerm)(349, 343, 349) */
		reached[0][343] = 1;
		Printf("SERVER %d: Sending log at index 1,term = %d,prevLogTerm = %d\n", ((int)((P0 *)_this)->serverId), ((int)((P0 *)_this)->outMsg.appendEntry.term), ((int)((P0 *)_this)->outMsg.appendEntry.prevLogTerm));
		/* merge: .(goto)(0, 348, 349) */
		reached[0][348] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 137: // STATE 345 - raft_sem8.pml:473 - [outMsg.appendEntry.index = 10] (0:349:1 - 1)
		IfNotBlocked
		reached[0][345] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)_this)->outMsg.appendEntry.index);
		((P0 *)_this)->outMsg.appendEntry.index = 10;
#ifdef VAR_RANGES
		logval("server:outMsg.appendEntry.index", ((int)((P0 *)_this)->outMsg.appendEntry.index));
#endif
		;
		/* merge: printf('SERVER %d: No new logs to send to server %d,sending heartbeat\\n',serverId,i)(349, 346, 349) */
		reached[0][346] = 1;
		Printf("SERVER %d: No new logs to send to server %d,sending heartbeat\n", ((int)((P0 *)_this)->serverId), ((int)((P0 *)_this)->i));
		/* merge: .(goto)(0, 348, 349) */
		reached[0][348] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 138: // STATE 349 - raft_sem8.pml:478 - [toNodes[i]!outMsg.messageType,outMsg.sender,outMsg.receiver,outMsg.appendEntry.term,outMsg.appendEntry.leaderCommit,outMsg.appendEntry.index,outMsg.appendEntry.prevLogTerm,outMsg.appendEntryResponse.term,outMsg.appendEntryResponse.success,outMsg.requestVote.term,outMsg.requestVote.lastLogIndex,outMsg.requestVote.lastLogTerm,outMsg.requestVoteResponse.term,outMsg.requestVoteResponse.voteGranted] (357:0:1 - 4)
		IfNotBlocked
		reached[0][349] = 1;
		if (q_full(now.toNodes[ Index(((int)((P0 *)_this)->i), 3) ]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.toNodes[ Index(((int)((P0 *)_this)->i), 3) ]);
		sprintf(simtmp, "%d", ((P0 *)_this)->outMsg.messageType); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->outMsg.sender)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->outMsg.receiver)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->outMsg.appendEntry.term)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->outMsg.appendEntry.leaderCommit)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->outMsg.appendEntry.index)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->outMsg.appendEntry.prevLogTerm)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->outMsg.appendEntryResponse.term)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->outMsg.appendEntryResponse.success)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->outMsg.requestVote.term)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->outMsg.requestVote.lastLogIndex)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->outMsg.requestVote.lastLogTerm)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->outMsg.requestVoteResponse.term)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->outMsg.requestVoteResponse.voteGranted)); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.toNodes[ Index(((int)((P0 *)_this)->i), 3) ], 0, ((P0 *)_this)->outMsg.messageType, ((int)((P0 *)_this)->outMsg.sender), ((int)((P0 *)_this)->outMsg.receiver), ((int)((P0 *)_this)->outMsg.appendEntry.term), ((int)((P0 *)_this)->outMsg.appendEntry.leaderCommit), ((int)((P0 *)_this)->outMsg.appendEntry.index), ((int)((P0 *)_this)->outMsg.appendEntry.prevLogTerm), ((int)((P0 *)_this)->outMsg.appendEntryResponse.term), ((int)((P0 *)_this)->outMsg.appendEntryResponse.success), ((int)((P0 *)_this)->outMsg.requestVote.term), ((int)((P0 *)_this)->outMsg.requestVote.lastLogIndex), ((int)((P0 *)_this)->outMsg.requestVote.lastLogTerm), ((int)((P0 *)_this)->outMsg.requestVoteResponse.term), ((int)((P0 *)_this)->outMsg.requestVoteResponse.voteGranted), 14);
		/* merge: .(goto)(357, 353, 357) */
		reached[0][353] = 1;
		;
		/* merge: i = (i+1)(357, 354, 357) */
		reached[0][354] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)_this)->i);
		((P0 *)_this)->i = (((int)((P0 *)_this)->i)+1);
#ifdef VAR_RANGES
		logval("server:i", ((int)((P0 *)_this)->i));
#endif
		;
		/* merge: .(goto)(0, 358, 357) */
		reached[0][358] = 1;
		;
		_m = 2; goto P999; /* 3 */
	case 139: // STATE 351 - raft_sem8.pml:479 - [(1)] (357:0:1 - 1)
		IfNotBlocked
		reached[0][351] = 1;
		if (!(1))
			continue;
		/* merge: .(goto)(357, 353, 357) */
		reached[0][353] = 1;
		;
		/* merge: i = (i+1)(357, 354, 357) */
		reached[0][354] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)_this)->i);
		((P0 *)_this)->i = (((int)((P0 *)_this)->i)+1);
#ifdef VAR_RANGES
		logval("server:i", ((int)((P0 *)_this)->i));
#endif
		;
		/* merge: .(goto)(0, 358, 357) */
		reached[0][358] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 140: // STATE 354 - raft_sem8.pml:450 - [i = (i+1)] (0:357:1 - 3)
		IfNotBlocked
		reached[0][354] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)_this)->i);
		((P0 *)_this)->i = (((int)((P0 *)_this)->i)+1);
#ifdef VAR_RANGES
		logval("server:i", ((int)((P0 *)_this)->i));
#endif
		;
		/* merge: .(goto)(0, 358, 357) */
		reached[0][358] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 141: // STATE 361 - raft_sem8.pml:484 - [(((state[serverId]==4)&&(logs[serverId].logs[1]==0)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][361] = 1;
		if (!(((now.state[ Index(((int)((P0 *)_this)->serverId), 3) ]==4)&&(((int)now.logs[ Index(((int)((P0 *)_this)->serverId), 3) ].logs[1])==0))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 142: // STATE 362 - raft_sem8.pml:487 - [((logs[serverId].logs[0]==0))] (370:0:1 - 1)
		IfNotBlocked
		reached[0][362] = 1;
		if (!((((int)now.logs[ Index(((int)((P0 *)_this)->serverId), 3) ].logs[0])==0)))
			continue;
		/* merge: logs[serverId].logs[0] = currentTerm[serverId](370, 363, 370) */
		reached[0][363] = 1;
		(trpt+1)->bup.oval = ((int)now.logs[ Index(((int)((P0 *)_this)->serverId), 3) ].logs[0]);
		now.logs[ Index(((P0 *)_this)->serverId, 3) ].logs[0] = ((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]);
#ifdef VAR_RANGES
		logval("logs[server:serverId].logs[0]", ((int)now.logs[ Index(((int)((P0 *)_this)->serverId), 3) ].logs[0]));
#endif
		;
		/* merge: printf('SERVER %d: Client request,adding entry at index 0 with term %d\\n',serverId,currentTerm[serverId])(370, 364, 370) */
		reached[0][364] = 1;
		Printf("SERVER %d: Client request,adding entry at index 0 with term %d\n", ((int)((P0 *)_this)->serverId), ((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]));
		/* merge: .(goto)(370, 369, 370) */
		reached[0][369] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 143: // STATE 369 - raft_sem8.pml:496 - [.(goto)] (0:370:0 - 2)
		IfNotBlocked
		reached[0][369] = 1;
		;
		_m = 3; goto P999; /* 0 */
	case 144: // STATE 365 - raft_sem8.pml:491 - [((logs[serverId].logs[0]!=0))] (370:0:1 - 1)
		IfNotBlocked
		reached[0][365] = 1;
		if (!((((int)now.logs[ Index(((int)((P0 *)_this)->serverId), 3) ].logs[0])!=0)))
			continue;
		/* merge: logs[serverId].logs[1] = currentTerm[serverId](370, 366, 370) */
		reached[0][366] = 1;
		(trpt+1)->bup.oval = ((int)now.logs[ Index(((int)((P0 *)_this)->serverId), 3) ].logs[1]);
		now.logs[ Index(((P0 *)_this)->serverId, 3) ].logs[1] = ((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]);
#ifdef VAR_RANGES
		logval("logs[server:serverId].logs[1]", ((int)now.logs[ Index(((int)((P0 *)_this)->serverId), 3) ].logs[1]));
#endif
		;
		/* merge: printf('SERVER %d: Client request,adding entry at index 1 with term %d\\n',serverId,currentTerm[serverId])(370, 367, 370) */
		reached[0][367] = 1;
		Printf("SERVER %d: Client request,adding entry at index 1 with term %d\n", ((int)((P0 *)_this)->serverId), ((int)now.currentTerm[ Index(((int)((P0 *)_this)->serverId), 3) ]));
		/* merge: .(goto)(370, 369, 370) */
		reached[0][369] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 145: // STATE 375 - raft_sem8.pml:499 - [printf('SERVER %d: Process terminated\\n',serverId)] (0:0:0 - 1)
		IfNotBlocked
		reached[0][375] = 1;
		Printf("SERVER %d: Process terminated\n", ((int)((P0 *)_this)->serverId));
		_m = 3; goto P999; /* 0 */
	case 146: // STATE 376 - raft_sem8.pml:500 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][376] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */
	case  _T5:	/* np_ */
		if (!((!(trpt->o_pm&4) && !(trpt->tau&128))))
			continue;
		/* else fall through */
	case  _T2:	/* true */
		_m = 3; goto P999;
#undef rand
	}

