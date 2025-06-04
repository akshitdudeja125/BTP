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

		 /* CLAIM server_usage */
	case 3: // STATE 1 - _spin_nvr.tmp:20 - [(!(((client_served_by[1]>0)||(client_served_by[2]>0))))] (0:0:0 - 1)
		
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
		if (!( !(((((int)now.client_served_by[1])>0)||(((int)now.client_served_by[2])>0)))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 4: // STATE 6 - _spin_nvr.tmp:22 - [-end-] (0:0:0 - 1)
		
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
		reached[5][6] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* CLAIM message_processing */
	case 5: // STATE 1 - _spin_nvr.tmp:13 - [(!((messages_processed>0)))] (0:0:0 - 1)
		
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
		if (!( !((((int)now.messages_processed)>0))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 6: // STATE 6 - _spin_nvr.tmp:15 - [-end-] (0:0:0 - 1)
		
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
		reached[4][6] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* CLAIM no_server_overload */
	case 7: // STATE 1 - _spin_nvr.tmp:3 - [(!(!((server_busy[1]&&server_busy[2]))))] (6:0:0 - 1)
		
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
		if (!( !( !((((int)now.server_busy[1])&&((int)now.server_busy[2]))))))
			continue;
		/* merge: assert(!(!(!((server_busy[1]&&server_busy[2])))))(0, 2, 6) */
		reached[3][2] = 1;
		spin_assert( !( !( !((((int)now.server_busy[1])&&((int)now.server_busy[2]))))), " !( !( !((server_busy[1]&&server_busy[2]))))", II, tt, t);
		/* merge: .(goto)(0, 7, 6) */
		reached[3][7] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 8: // STATE 10 - _spin_nvr.tmp:8 - [-end-] (0:0:0 - 1)
		
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
		reached[3][10] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC :init: */
	case 9: // STATE 1 - test.pml:148 - [(run Server(1))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][1] = 1;
		if (!(addproc(II, 1, 0, 1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 10: // STATE 2 - test.pml:149 - [(run Server(2))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][2] = 1;
		if (!(addproc(II, 1, 0, 2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 11: // STATE 3 - test.pml:150 - [(run Client(1))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][3] = 1;
		if (!(addproc(II, 1, 1, 1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 12: // STATE 4 - test.pml:151 - [(run Client(2))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][4] = 1;
		if (!(addproc(II, 1, 1, 2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 13: // STATE 5 - test.pml:152 - [printf('All processes started. System running...\\n')] (0:0:0 - 1)
		IfNotBlocked
		reached[2][5] = 1;
		Printf("All processes started. System running...\n");
		_m = 3; goto P999; /* 0 */
	case 14: // STATE 7 - test.pml:155 - [printf('System reached init end state.\\n')] (0:0:0 - 1)
		IfNotBlocked
		reached[2][7] = 1;
		Printf("System reached init end state.\n");
		_m = 3; goto P999; /* 0 */
	case 15: // STATE 8 - test.pml:156 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[2][8] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC Client */
	case 16: // STATE 1 - test.pml:102 - [((client_requests[id]<10))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		if (!((((int)now.client_requests[ Index(((int)((P1 *)_this)->id), 3) ])<10)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 17: // STATE 2 - test.pml:104 - [client_to_server1!1,id,_pid] (0:0:0 - 1)
		IfNotBlocked
		reached[1][2] = 1;
		if (q_full(now.client_to_server1))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.client_to_server1);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P1 *)_this)->id)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P1 *)_this)->_pid)); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.client_to_server1, 0, 1, ((int)((P1 *)_this)->id), ((int)((P1 *)_this)->_pid), 3);
		_m = 2; goto P999; /* 0 */
	case 18: // STATE 3 - test.pml:105 - [printf('Client %d (pid %d) sent request to Server 1\\n',id,_pid)] (0:0:0 - 1)
		IfNotBlocked
		reached[1][3] = 1;
		Printf("Client %d (pid %d) sent request to Server 1\n", ((int)((P1 *)_this)->id), ((int)((P1 *)_this)->_pid));
		_m = 3; goto P999; /* 0 */
	case 19: // STATE 4 - test.pml:106 - [client_to_server2!1,id,_pid] (0:0:0 - 1)
		IfNotBlocked
		reached[1][4] = 1;
		if (q_full(now.client_to_server2))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.client_to_server2);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P1 *)_this)->id)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P1 *)_this)->_pid)); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.client_to_server2, 0, 1, ((int)((P1 *)_this)->id), ((int)((P1 *)_this)->_pid), 3);
		_m = 2; goto P999; /* 0 */
	case 20: // STATE 5 - test.pml:107 - [printf('Client %d (pid %d) sent request to Server 2\\n',id,_pid)] (0:0:0 - 1)
		IfNotBlocked
		reached[1][5] = 1;
		Printf("Client %d (pid %d) sent request to Server 2\n", ((int)((P1 *)_this)->id), ((int)((P1 *)_this)->_pid));
		_m = 3; goto P999; /* 0 */
	case 21: // STATE 8 - test.pml:111 - [(server_to_client?[2,_,_pid])] (0:0:0 - 1)
		IfNotBlocked
		reached[1][8] = 1;
		if (!((q_len(now.server_to_client) > 0 \
		&& qrecv(now.server_to_client, 0, 0, 0) == 2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 22: // STATE 9 - test.pml:112 - [server_to_client?msg_type,server_id,dummy] (0:0:5 - 1)
		reached[1][9] = 1;
		if (q_len(now.server_to_client) == 0) continue;

		XX=1;
		(trpt+1)->bup.ovals = grab_ints(5);
		(trpt+1)->bup.ovals[0] = ((int)((P1 *)_this)->msg_type);
		(trpt+1)->bup.ovals[1] = ((int)((P1 *)_this)->server_id);
		(trpt+1)->bup.ovals[2] = ((int)((P1 *)_this)->dummy);
		;
		((P1 *)_this)->msg_type = qrecv(now.server_to_client, XX-1, 0, 0);
#ifdef VAR_RANGES
		logval("Client:msg_type", ((int)((P1 *)_this)->msg_type));
#endif
		;
		((P1 *)_this)->server_id = qrecv(now.server_to_client, XX-1, 1, 0);
#ifdef VAR_RANGES
		logval("Client:server_id", ((int)((P1 *)_this)->server_id));
#endif
		;
		((P1 *)_this)->dummy = qrecv(now.server_to_client, XX-1, 2, 1);
#ifdef VAR_RANGES
		logval("Client:dummy", ((int)((P1 *)_this)->dummy));
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.server_to_client);
		sprintf(simtmp, "%d", ((int)((P1 *)_this)->msg_type)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P1 *)_this)->server_id)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P1 *)_this)->dummy)); strcat(simvals, simtmp);		}
#endif
		;
		if (TstOnly) return 1; /* TT */
		/* dead 2: msg_type */  (trpt+1)->bup.ovals[3] = ((P1 *)_this)->msg_type;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)_this)->msg_type = 0;
		if (TstOnly) return 1; /* TT */
		/* dead 2: dummy */  (trpt+1)->bup.ovals[4] = ((P1 *)_this)->dummy;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)_this)->dummy = 0;
		_m = 4; goto P999; /* 0 */
	case 23: // STATE 10 - test.pml:115 - [requests_handled = (requests_handled+1)] (0:19:3 - 1)
		IfNotBlocked
		reached[1][10] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)((P1 *)_this)->requests_handled);
		((P1 *)_this)->requests_handled = (((int)((P1 *)_this)->requests_handled)+1);
#ifdef VAR_RANGES
		logval("Client:requests_handled", ((int)((P1 *)_this)->requests_handled));
#endif
		;
		/* merge: client_requests[id] = (client_requests[id]+1)(19, 11, 19) */
		reached[1][11] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.client_requests[ Index(((int)((P1 *)_this)->id), 3) ]);
		now.client_requests[ Index(((P1 *)_this)->id, 3) ] = (((int)now.client_requests[ Index(((int)((P1 *)_this)->id), 3) ])+1);
#ifdef VAR_RANGES
		logval("client_requests[Client:id]", ((int)now.client_requests[ Index(((int)((P1 *)_this)->id), 3) ]));
#endif
		;
		/* merge: client_served_by[id] = server_id(19, 12, 19) */
		reached[1][12] = 1;
		(trpt+1)->bup.ovals[2] = ((int)now.client_served_by[ Index(((int)((P1 *)_this)->id), 3) ]);
		now.client_served_by[ Index(((P1 *)_this)->id, 3) ] = ((int)((P1 *)_this)->server_id);
#ifdef VAR_RANGES
		logval("client_served_by[Client:id]", ((int)now.client_served_by[ Index(((int)((P1 *)_this)->id), 3) ]));
#endif
		;
		/* merge: printf('Client %d (pid %d) received response from Server %d (request #%d)\\n',id,_pid,server_id,requests_handled)(19, 13, 19) */
		reached[1][13] = 1;
		Printf("Client %d (pid %d) received response from Server %d (request #%d)\n", ((int)((P1 *)_this)->id), ((int)((P1 *)_this)->_pid), ((int)((P1 *)_this)->server_id), ((int)((P1 *)_this)->requests_handled));
		_m = 3; goto P999; /* 3 */
	case 24: // STATE 14 - test.pml:123 - [((client_requests[id]==10))] (33:0:0 - 1)
		IfNotBlocked
		reached[1][14] = 1;
		if (!((((int)now.client_requests[ Index(((int)((P1 *)_this)->id), 3) ])==10)))
			continue;
		/* merge: printf('Client %d (pid %d) sent 10 requests and is terminating\\n',id,_pid)(33, 15, 33) */
		reached[1][15] = 1;
		Printf("Client %d (pid %d) sent 10 requests and is terminating\n", ((int)((P1 *)_this)->id), ((int)((P1 *)_this)->_pid));
		/* merge: goto end(33, 16, 33) */
		reached[1][16] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 25: // STATE 18 - test.pml:126 - [(1)] (30:0:0 - 1)
		IfNotBlocked
		reached[1][18] = 1;
		if (!(1))
			continue;
		/* merge: .(goto)(0, 20, 30) */
		reached[1][20] = 1;
		;
		/* merge: goto :b2(0, 22, 30) */
		reached[1][22] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 26: // STATE 34 - test.pml:138 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][34] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC Server */
	case 27: // STATE 1 - test.pml:24 - [((((server_requests[id]<10)&&(id==1))&&client_to_server1?[1,_,_]))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		if (!((((((int)now.server_requests[ Index(((int)((P0 *)_this)->id), 3) ])<10)&&(((int)((P0 *)_this)->id)==1))&&(q_len(now.client_to_server1) > 0 \
		&& qrecv(now.client_to_server1, 0, 0, 0) == 1))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 28: // STATE 3 - test.pml:29 - [((server_mutex==1))] (10:0:1 - 1)
		IfNotBlocked
		reached[0][3] = 1;
		if (!((((int)now.server_mutex)==1)))
			continue;
		/* merge: server_mutex = 0(10, 4, 10) */
		reached[0][4] = 1;
		(trpt+1)->bup.oval = ((int)now.server_mutex);
		now.server_mutex = 0;
#ifdef VAR_RANGES
		logval("server_mutex", ((int)now.server_mutex));
#endif
		;
		/* merge: .(goto)(10, 8, 10) */
		reached[0][8] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 29: // STATE 10 - test.pml:34 - [client_to_server1?msg_type,client_id,client_pid] (0:0:4 - 1)
		reached[0][10] = 1;
		if (q_len(now.client_to_server1) == 0) continue;

		XX=1;
		(trpt+1)->bup.ovals = grab_ints(4);
		(trpt+1)->bup.ovals[0] = ((int)((P0 *)_this)->msg_type);
		(trpt+1)->bup.ovals[1] = ((int)((P0 *)_this)->client_id);
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)_this)->client_pid);
		;
		((P0 *)_this)->msg_type = qrecv(now.client_to_server1, XX-1, 0, 0);
#ifdef VAR_RANGES
		logval("Server:msg_type", ((int)((P0 *)_this)->msg_type));
#endif
		;
		((P0 *)_this)->client_id = qrecv(now.client_to_server1, XX-1, 1, 0);
#ifdef VAR_RANGES
		logval("Server:client_id", ((int)((P0 *)_this)->client_id));
#endif
		;
		((P0 *)_this)->client_pid = qrecv(now.client_to_server1, XX-1, 2, 1);
#ifdef VAR_RANGES
		logval("Server:client_pid", ((int)((P0 *)_this)->client_pid));
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.client_to_server1);
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->msg_type)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->client_id)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->client_pid)); strcat(simvals, simtmp);		}
#endif
		;
		if (TstOnly) return 1; /* TT */
		/* dead 2: msg_type */  (trpt+1)->bup.ovals[3] = ((P0 *)_this)->msg_type;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)_this)->msg_type = 0;
		_m = 4; goto P999; /* 0 */
	case 30: // STATE 11 - test.pml:35 - [printf('Server %d (pid %d) processing request from Client %d (pid %d)\\n',id,_pid,client_id,client_pid)] (0:0:0 - 1)
		IfNotBlocked
		reached[0][11] = 1;
		Printf("Server %d (pid %d) processing request from Client %d (pid %d)\n", ((int)((P0 *)_this)->id), ((int)((P0 *)_this)->_pid), ((int)((P0 *)_this)->client_id), ((int)((P0 *)_this)->client_pid));
		_m = 3; goto P999; /* 0 */
	case 31: // STATE 12 - test.pml:38 - [server_busy[id] = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[0][12] = 1;
		(trpt+1)->bup.oval = ((int)now.server_busy[ Index(((int)((P0 *)_this)->id), 3) ]);
		now.server_busy[ Index(((P0 *)_this)->id, 3) ] = 1;
#ifdef VAR_RANGES
		logval("server_busy[Server:id]", ((int)now.server_busy[ Index(((int)((P0 *)_this)->id), 3) ]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 32: // STATE 13 - test.pml:40 - [server_busy[id] = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[0][13] = 1;
		(trpt+1)->bup.oval = ((int)now.server_busy[ Index(((int)((P0 *)_this)->id), 3) ]);
		now.server_busy[ Index(((P0 *)_this)->id, 3) ] = 0;
#ifdef VAR_RANGES
		logval("server_busy[Server:id]", ((int)now.server_busy[ Index(((int)((P0 *)_this)->id), 3) ]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 33: // STATE 14 - test.pml:42 - [server_to_client!2,id,client_pid] (0:0:0 - 1)
		IfNotBlocked
		reached[0][14] = 1;
		if (q_full(now.server_to_client))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.server_to_client);
		sprintf(simtmp, "%d", 2); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->id)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->client_pid)); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.server_to_client, 0, 2, ((int)((P0 *)_this)->id), ((int)((P0 *)_this)->client_pid), 3);
		_m = 2; goto P999; /* 0 */
	case 34: // STATE 15 - test.pml:43 - [server_requests[id] = (server_requests[id]+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][15] = 1;
		(trpt+1)->bup.oval = ((int)now.server_requests[ Index(((int)((P0 *)_this)->id), 3) ]);
		now.server_requests[ Index(((P0 *)_this)->id, 3) ] = (((int)now.server_requests[ Index(((int)((P0 *)_this)->id), 3) ])+1);
#ifdef VAR_RANGES
		logval("server_requests[Server:id]", ((int)now.server_requests[ Index(((int)((P0 *)_this)->id), 3) ]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 35: // STATE 16 - test.pml:44 - [messages_processed = (messages_processed+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][16] = 1;
		(trpt+1)->bup.oval = ((int)now.messages_processed);
		now.messages_processed = (((int)now.messages_processed)+1);
#ifdef VAR_RANGES
		logval("messages_processed", ((int)now.messages_processed));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 36: // STATE 17 - test.pml:47 - [((server_requests[id]==10))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][17] = 1;
		if (!((((int)now.server_requests[ Index(((int)((P0 *)_this)->id), 3) ])==10)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 37: // STATE 18 - test.pml:48 - [printf('Server %d (pid %d) processed 10 messages and is terminating\\n',id,_pid)] (0:0:0 - 1)
		IfNotBlocked
		reached[0][18] = 1;
		Printf("Server %d (pid %d) processed 10 messages and is terminating\n", ((int)((P0 *)_this)->id), ((int)((P0 *)_this)->_pid));
		_m = 3; goto P999; /* 0 */
	case 38: // STATE 19 - test.pml:49 - [server_mutex = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[0][19] = 1;
		(trpt+1)->bup.oval = ((int)now.server_mutex);
		now.server_mutex = 1;
#ifdef VAR_RANGES
		logval("server_mutex", ((int)now.server_mutex));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 39: // STATE 22 - test.pml:52 - [server_mutex = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[0][22] = 1;
		(trpt+1)->bup.oval = ((int)now.server_mutex);
		now.server_mutex = 1;
#ifdef VAR_RANGES
		logval("server_mutex", ((int)now.server_mutex));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 40: // STATE 25 - test.pml:55 - [((((server_requests[id]<10)&&(id==2))&&client_to_server2?[1,_,_]))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][25] = 1;
		if (!((((((int)now.server_requests[ Index(((int)((P0 *)_this)->id), 3) ])<10)&&(((int)((P0 *)_this)->id)==2))&&(q_len(now.client_to_server2) > 0 \
		&& qrecv(now.client_to_server2, 0, 0, 0) == 1))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 41: // STATE 27 - test.pml:60 - [((server_mutex==1))] (34:0:1 - 1)
		IfNotBlocked
		reached[0][27] = 1;
		if (!((((int)now.server_mutex)==1)))
			continue;
		/* merge: server_mutex = 0(34, 28, 34) */
		reached[0][28] = 1;
		(trpt+1)->bup.oval = ((int)now.server_mutex);
		now.server_mutex = 0;
#ifdef VAR_RANGES
		logval("server_mutex", ((int)now.server_mutex));
#endif
		;
		/* merge: .(goto)(34, 32, 34) */
		reached[0][32] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 42: // STATE 34 - test.pml:65 - [client_to_server2?msg_type,client_id,client_pid] (0:0:4 - 1)
		reached[0][34] = 1;
		if (q_len(now.client_to_server2) == 0) continue;

		XX=1;
		(trpt+1)->bup.ovals = grab_ints(4);
		(trpt+1)->bup.ovals[0] = ((int)((P0 *)_this)->msg_type);
		(trpt+1)->bup.ovals[1] = ((int)((P0 *)_this)->client_id);
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)_this)->client_pid);
		;
		((P0 *)_this)->msg_type = qrecv(now.client_to_server2, XX-1, 0, 0);
#ifdef VAR_RANGES
		logval("Server:msg_type", ((int)((P0 *)_this)->msg_type));
#endif
		;
		((P0 *)_this)->client_id = qrecv(now.client_to_server2, XX-1, 1, 0);
#ifdef VAR_RANGES
		logval("Server:client_id", ((int)((P0 *)_this)->client_id));
#endif
		;
		((P0 *)_this)->client_pid = qrecv(now.client_to_server2, XX-1, 2, 1);
#ifdef VAR_RANGES
		logval("Server:client_pid", ((int)((P0 *)_this)->client_pid));
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.client_to_server2);
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->msg_type)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->client_id)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->client_pid)); strcat(simvals, simtmp);		}
#endif
		;
		if (TstOnly) return 1; /* TT */
		/* dead 2: msg_type */  (trpt+1)->bup.ovals[3] = ((P0 *)_this)->msg_type;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)_this)->msg_type = 0;
		_m = 4; goto P999; /* 0 */
	case 43: // STATE 35 - test.pml:66 - [printf('Server %d (pid %d) processing request from Client %d (pid %d)\\n',id,_pid,client_id,client_pid)] (0:0:0 - 1)
		IfNotBlocked
		reached[0][35] = 1;
		Printf("Server %d (pid %d) processing request from Client %d (pid %d)\n", ((int)((P0 *)_this)->id), ((int)((P0 *)_this)->_pid), ((int)((P0 *)_this)->client_id), ((int)((P0 *)_this)->client_pid));
		_m = 3; goto P999; /* 0 */
	case 44: // STATE 36 - test.pml:69 - [server_busy[id] = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[0][36] = 1;
		(trpt+1)->bup.oval = ((int)now.server_busy[ Index(((int)((P0 *)_this)->id), 3) ]);
		now.server_busy[ Index(((P0 *)_this)->id, 3) ] = 1;
#ifdef VAR_RANGES
		logval("server_busy[Server:id]", ((int)now.server_busy[ Index(((int)((P0 *)_this)->id), 3) ]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 45: // STATE 37 - test.pml:71 - [server_busy[id] = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[0][37] = 1;
		(trpt+1)->bup.oval = ((int)now.server_busy[ Index(((int)((P0 *)_this)->id), 3) ]);
		now.server_busy[ Index(((P0 *)_this)->id, 3) ] = 0;
#ifdef VAR_RANGES
		logval("server_busy[Server:id]", ((int)now.server_busy[ Index(((int)((P0 *)_this)->id), 3) ]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 46: // STATE 38 - test.pml:73 - [server_to_client!2,id,client_pid] (0:0:0 - 1)
		IfNotBlocked
		reached[0][38] = 1;
		if (q_full(now.server_to_client))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.server_to_client);
		sprintf(simtmp, "%d", 2); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->id)); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->client_pid)); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.server_to_client, 0, 2, ((int)((P0 *)_this)->id), ((int)((P0 *)_this)->client_pid), 3);
		_m = 2; goto P999; /* 0 */
	case 47: // STATE 39 - test.pml:74 - [server_requests[id] = (server_requests[id]+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][39] = 1;
		(trpt+1)->bup.oval = ((int)now.server_requests[ Index(((int)((P0 *)_this)->id), 3) ]);
		now.server_requests[ Index(((P0 *)_this)->id, 3) ] = (((int)now.server_requests[ Index(((int)((P0 *)_this)->id), 3) ])+1);
#ifdef VAR_RANGES
		logval("server_requests[Server:id]", ((int)now.server_requests[ Index(((int)((P0 *)_this)->id), 3) ]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 48: // STATE 40 - test.pml:75 - [messages_processed = (messages_processed+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][40] = 1;
		(trpt+1)->bup.oval = ((int)now.messages_processed);
		now.messages_processed = (((int)now.messages_processed)+1);
#ifdef VAR_RANGES
		logval("messages_processed", ((int)now.messages_processed));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 49: // STATE 41 - test.pml:78 - [((server_requests[id]==10))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][41] = 1;
		if (!((((int)now.server_requests[ Index(((int)((P0 *)_this)->id), 3) ])==10)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 50: // STATE 42 - test.pml:79 - [printf('Server %d (pid %d) processed 10 messages and is terminating\\n',id,_pid)] (0:0:0 - 1)
		IfNotBlocked
		reached[0][42] = 1;
		Printf("Server %d (pid %d) processed 10 messages and is terminating\n", ((int)((P0 *)_this)->id), ((int)((P0 *)_this)->_pid));
		_m = 3; goto P999; /* 0 */
	case 51: // STATE 43 - test.pml:80 - [server_mutex = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[0][43] = 1;
		(trpt+1)->bup.oval = ((int)now.server_mutex);
		now.server_mutex = 1;
#ifdef VAR_RANGES
		logval("server_mutex", ((int)now.server_mutex));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 52: // STATE 46 - test.pml:83 - [server_mutex = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[0][46] = 1;
		(trpt+1)->bup.oval = ((int)now.server_mutex);
		now.server_mutex = 1;
#ifdef VAR_RANGES
		logval("server_mutex", ((int)now.server_mutex));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 53: // STATE 56 - test.pml:94 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][56] = 1;
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

