#define MAX_TERM 3
#define NUM_SERVERS 3

// Variables for safety properties
byte leaders = 0;// Number of leaders in the system
bool leader[NUM_SERVERS];// Indicates which nodes are leaders
mtype:State = {LEADER,CANDIDATE,FOLLOWER};
mtype:State state[NUM_SERVERS];
byte currentTerm[NUM_SERVERS];

// Mutex to protect leader election
bool mutex = false;

// Simple server process that can become a leader
proctype server(byte id) {
	state[id] = FOLLOWER;
	leader[id] = false;
	
	do
// Become leader - with mutex protection
	:: (state[id] != LEADER && !mutex) -> 
		atomic {
			mutex = true;
// Check again if we can still become leader
			if
			:: (leaders == 0) -> // Only become leader if no other leader exists
				state[id] = LEADER;
				leaders++;
				leader[id] = true;
				printf("SERVER %d: Becoming leader\n",id);
			:: else -> 
				printf("SERVER %d: Cannot become leader,another leader exists\n",id);
			fi;
			mutex = false;
		}
// Step down
	:: (state[id] == LEADER && !mutex) -> 
		atomic {
			mutex = true;
			state[id] = FOLLOWER;
			leaders--;
			leader[id] = false;
			printf("SERVER %d: Stepping down\n",id);
			mutex = false;
		}
	od;
}

init {
	atomic {
		byte i;
		for (i : 0 .. NUM_SERVERS - 1) {
			leader[i] = false;
			state[i] = FOLLOWER;
			currentTerm[i] = 0;
			run server(i);
		}
	}
}

// Property to verify: At most one leader at any time
ltl uniqueness { [](leaders <= 1) } 