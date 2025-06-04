	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* CLAIM server_usage */
;
		;
		
	case 4: // STATE 6
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* CLAIM message_processing */
;
		;
		
	case 6: // STATE 6
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* CLAIM no_server_overload */
;
		
	case 7: // STATE 1
		goto R999;

	case 8: // STATE 10
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC :init: */

	case 9: // STATE 1
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 10: // STATE 2
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 11: // STATE 3
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 12: // STATE 4
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;
;
		;
		;
		;
		
	case 15: // STATE 8
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC Client */
;
		;
		
	case 17: // STATE 2
		;
		_m = unsend(now.client_to_server1);
		;
		goto R999;
;
		;
		
	case 19: // STATE 4
		;
		_m = unsend(now.client_to_server2);
		;
		goto R999;
;
		;
		;
		;
		
	case 22: // STATE 9
		;
	/* 1 */	((P1 *)_this)->dummy = trpt->bup.ovals[4];
	/* 0 */	((P1 *)_this)->msg_type = trpt->bup.ovals[3];
		XX = 1;
		unrecv(now.server_to_client, XX-1, 0, ((int)((P1 *)_this)->msg_type), 1);
		unrecv(now.server_to_client, XX-1, 1, ((int)((P1 *)_this)->server_id), 0);
		unrecv(now.server_to_client, XX-1, 2, ((int)((P1 *)_this)->dummy), 0);
		((P1 *)_this)->msg_type = trpt->bup.ovals[0];
		((P1 *)_this)->server_id = trpt->bup.ovals[1];
		((P1 *)_this)->dummy = trpt->bup.ovals[2];
		;
		;
		ungrab_ints(trpt->bup.ovals, 5);
		goto R999;

	case 23: // STATE 12
		;
		now.client_served_by[ Index(((P1 *)_this)->id, 3) ] = trpt->bup.ovals[2];
		now.client_requests[ Index(((P1 *)_this)->id, 3) ] = trpt->bup.ovals[1];
		((P1 *)_this)->requests_handled = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;
;
		
	case 24: // STATE 14
		goto R999;
;
		
	case 25: // STATE 18
		goto R999;

	case 26: // STATE 34
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC Server */
;
		;
		
	case 28: // STATE 4
		;
		now.server_mutex = trpt->bup.oval;
		;
		goto R999;

	case 29: // STATE 10
		;
	/* 0 */	((P0 *)_this)->msg_type = trpt->bup.ovals[3];
		XX = 1;
		unrecv(now.client_to_server1, XX-1, 0, ((int)((P0 *)_this)->msg_type), 1);
		unrecv(now.client_to_server1, XX-1, 1, ((int)((P0 *)_this)->client_id), 0);
		unrecv(now.client_to_server1, XX-1, 2, ((int)((P0 *)_this)->client_pid), 0);
		((P0 *)_this)->msg_type = trpt->bup.ovals[0];
		((P0 *)_this)->client_id = trpt->bup.ovals[1];
		((P0 *)_this)->client_pid = trpt->bup.ovals[2];
		;
		;
		ungrab_ints(trpt->bup.ovals, 4);
		goto R999;
;
		;
		
	case 31: // STATE 12
		;
		now.server_busy[ Index(((P0 *)_this)->id, 3) ] = trpt->bup.oval;
		;
		goto R999;

	case 32: // STATE 13
		;
		now.server_busy[ Index(((P0 *)_this)->id, 3) ] = trpt->bup.oval;
		;
		goto R999;

	case 33: // STATE 14
		;
		_m = unsend(now.server_to_client);
		;
		goto R999;

	case 34: // STATE 15
		;
		now.server_requests[ Index(((P0 *)_this)->id, 3) ] = trpt->bup.oval;
		;
		goto R999;

	case 35: // STATE 16
		;
		now.messages_processed = trpt->bup.oval;
		;
		goto R999;
;
		;
		;
		;
		
	case 38: // STATE 19
		;
		now.server_mutex = trpt->bup.oval;
		;
		goto R999;

	case 39: // STATE 22
		;
		now.server_mutex = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 41: // STATE 28
		;
		now.server_mutex = trpt->bup.oval;
		;
		goto R999;

	case 42: // STATE 34
		;
	/* 0 */	((P0 *)_this)->msg_type = trpt->bup.ovals[3];
		XX = 1;
		unrecv(now.client_to_server2, XX-1, 0, ((int)((P0 *)_this)->msg_type), 1);
		unrecv(now.client_to_server2, XX-1, 1, ((int)((P0 *)_this)->client_id), 0);
		unrecv(now.client_to_server2, XX-1, 2, ((int)((P0 *)_this)->client_pid), 0);
		((P0 *)_this)->msg_type = trpt->bup.ovals[0];
		((P0 *)_this)->client_id = trpt->bup.ovals[1];
		((P0 *)_this)->client_pid = trpt->bup.ovals[2];
		;
		;
		ungrab_ints(trpt->bup.ovals, 4);
		goto R999;
;
		;
		
	case 44: // STATE 36
		;
		now.server_busy[ Index(((P0 *)_this)->id, 3) ] = trpt->bup.oval;
		;
		goto R999;

	case 45: // STATE 37
		;
		now.server_busy[ Index(((P0 *)_this)->id, 3) ] = trpt->bup.oval;
		;
		goto R999;

	case 46: // STATE 38
		;
		_m = unsend(now.server_to_client);
		;
		goto R999;

	case 47: // STATE 39
		;
		now.server_requests[ Index(((P0 *)_this)->id, 3) ] = trpt->bup.oval;
		;
		goto R999;

	case 48: // STATE 40
		;
		now.messages_processed = trpt->bup.oval;
		;
		goto R999;
;
		;
		;
		;
		
	case 51: // STATE 43
		;
		now.server_mutex = trpt->bup.oval;
		;
		goto R999;

	case 52: // STATE 46
		;
		now.server_mutex = trpt->bup.oval;
		;
		goto R999;

	case 53: // STATE 56
		;
		p_restor(II);
		;
		;
		goto R999;
	}

