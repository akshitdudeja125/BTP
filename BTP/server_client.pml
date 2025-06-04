// Message types
#define REQUEST 1
#define RESPONSE 2

// Channel declarations
chan client_to_server1 = [2] of {byte,byte,byte};// (msg_type,client_id,pid)
chan client_to_server2 = [2] of {byte,byte,byte};
chan server_to_client = [4] of {byte,byte,byte};// (msg_type,server_id,client_pid)

// Global tracking variables
bool server_busy[3] = false;
bool client_done[3] = false;
byte client_served_by[3] = 0;
byte messages_processed = 0;
byte client_requests[3] = 0;
byte server_requests[3] = 0;
byte server_mutex = 1;

// Server process
proctype Server(byte id) {
	byte msg_type,client_id,client_pid;
	
	do
	:: (server_requests[id] < 10 && id == 1 && client_to_server1?[REQUEST,_,_]) -> 
		end_available1: skip;
		
		atomic {
			if
			:: (server_mutex == 1) -> server_mutex = 0;
			:: else -> goto wait_for_mutex;
			fi;
		}
		
		client_to_server1?msg_type,client_id,client_pid;
		printf("Server %d (pid %d) processing request from Client %d (pid %d)\n",
		id,_pid,client_id,client_pid);
		
		server_busy[id] = true;
// Simulate delay
		server_busy[id] = false;
		
		server_to_client!RESPONSE,id,client_pid;
		server_requests[id]++;
		messages_processed++;
		
		if
		:: (server_requests[id] == 10) -> 
			printf("Server %d (pid %d) processed 10 messages and is terminating\n",id,_pid);
			server_mutex = 1;
			goto end;
		:: else -> 
			server_mutex = 1;
		fi;
		
	:: (server_requests[id] < 10 && id == 2 && client_to_server2?[REQUEST,_,_]) -> 
		end_available2: skip;
		
		atomic {
			if
			:: (server_mutex == 1) -> server_mutex = 0;
			:: else -> goto wait_for_mutex;
			fi;
		}
		
		client_to_server2?msg_type,client_id,client_pid;
		printf("Server %d (pid %d) processing request from Client %d (pid %d)\n",
		id,_pid,client_id,client_pid);
		
		server_busy[id] = true;
// Simulate delay
		server_busy[id] = false;
		
		server_to_client!RESPONSE,id,client_pid;
		server_requests[id]++;
		messages_processed++;
		
		if
		:: (server_requests[id] == 10) -> 
			printf("Server %d (pid %d) processed 10 messages and is terminating\n",id,_pid);
			server_mutex = 1;
			goto end;
		:: else -> 
			server_mutex = 1;
		fi;
		
		wait_for_mutex:
		skip;
		
	:: else -> skip
	od;
	
	end:
	skip;
}

// Client process
proctype Client(byte id) {
	byte msg_type,server_id,dummy;
	byte requests_handled = 0;
	
	do
	:: (client_requests[id] < 10) -> 
		if
		:: client_to_server1!REQUEST,id,_pid;
			printf("Client %d (pid %d) sent request to Server 1\n",id,_pid);
		:: client_to_server2!REQUEST,id,_pid;
			printf("Client %d (pid %d) sent request to Server 2\n",id,_pid);
		fi;
		
		do
		:: server_to_client?[RESPONSE,_,_pid] -> 
			server_to_client?msg_type,server_id,dummy;
			
			atomic {
				requests_handled++;
				client_requests[id]++;
				client_served_by[id] = server_id;
				
				printf("Client %d (pid %d) received response from Server %d (request #%d)\n",
				id,_pid,server_id,requests_handled);
				
				if
				:: (client_requests[id] == 10) -> 
					printf("Client %d (pid %d) sent 10 requests and is terminating\n",id,_pid);
					goto end;
				:: else -> skip
				fi;
			}
			break;
		:: else -> skip
		od;
		
	:: else -> goto end
	od;
	
	end:
	skip;
}

// LTL properties
ltl no_server_overload { []!(server_busy[1] && server_busy[2]) }
ltl message_processing { <> (messages_processed > 0) }
ltl server_usage { <> (client_served_by[1] > 0 || client_served_by[2] > 0) }

// Init process
init {
	atomic {
		run Server(1);
		run Server(2);
		run Client(1);
		run Client(2);
		printf("All processes started. System running...\n");
	}
	
	end: printf("System reached init end state.\n");
}