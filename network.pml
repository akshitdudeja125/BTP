#define NUM_NODES 2// Number of nodes  
#define NUM_MSGS  2// Number of messages each node will send  
#define MSG_CAPACITY 10// Capacity of channels  

// Define the message structure  
typedef MsgType {  
	int senderID;
	int receiverID;
	int msgID;
}  

// Channels for nodes to send messages to the network  
chan toNetwork = [MSG_CAPACITY] of { MsgType };

// Channels for the network to send messages to nodes  
chan toNodes[NUM_NODES] = [MSG_CAPACITY] of { MsgType };

// Channel for the network to send messages to the monitor  
chan toMonitor = [MSG_CAPACITY] of { MsgType };

inline sleep(time) {
	int i;
	d_step {
		i = 0;
		do
		:: (i < time) -> i++
		:: else -> break
		od;
	}
}
// Node process  
proctype Node(int id)  
{  
	int msgID = 0;
	MsgType msg;
	MsgType rcvMsg;
	
// Sending phase: Each node sends NUM_MSGS messages to other nodes  
	do  
	:: (msgID < NUM_MSGS) -> 
		msg.senderID = id;
		msg.msgID = msgID;
// Determine receiverID (send to all other nodes)  
// For simplicity, we define that each node sends messages to all other nodes  
// In case of specific targets, you can adjust the receiverID accordingly  
		int receiverID;
		for (receiverID : 1 .. NUM_NODES) {  
			if  
			:: receiverID != id -> 
				msg.receiverID = receiverID;
				toNetwork!msg;// Send message to the network  
				printf("Sending;%d -> Network = > Message: %d,Sender: %d,Receiver: %d\n",id,msgID,id,receiverID);
// Now block for a random time of 1-5 seconds
				int randomTime;
				if
				:: randomTime = 15000000
				:: randomTime = 3000000
				:: randomTime = 6000000
				:: randomTime = 10000000
				fi;
				
				printf("Node %d will sleep for %d time units\n",id,randomTime / 1000000);
				sleep(randomTime);
			:: else -> 
// printf("Node %d cannot send message to itself\n",id);
				skip;
			fi  
		}  
		msgID++;
	:: else -> 
		break;
	od  
	
// Receiving phase: Each node receives messages intended for it  
	do  
	:: toNodes[id - 1]?rcvMsg -> 
// printf("Node %d received message %d from Node %d\n",id,rcvMsg.msgID,rcvMsg.senderID);
		printf("Recieved;Network -> %d = > Message: %d,Sender: %d,Receiver: %d\n",id,rcvMsg.msgID,rcvMsg.senderID,rcvMsg.receiverID);
	:: timeout -> 
		printf("Nothing to receive for node %d\n",id);
		break;// Exit when there are no more messages  
	od  
	
	printf("Node %d terminating\n",id);
}  

// Network process  
active proctype Network()  
{  
	MsgType msg;
	do  
	:: toNetwork?msg -> 
		printf("Recieved;%d -> Network = > Message: %d,Sender: %d,Receiver: %d\n",msg.senderID,msg.msgID,msg.senderID,msg.receiverID);
// Forward message to the intended recipient node  
		toNodes[msg.receiverID - 1]!msg;
		printf("Sending;Network -> %d = > Message: %d,Sender: %d,Receiver: %d\n",msg.receiverID,msg.msgID,msg.senderID,msg.receiverID);
		
// Send a copy of the message to the monitor  
		toMonitor!msg;
		printf("Sending;Network -> Monitor = > Message: %d,Sender: %d,Receiver: %d\n",msg.msgID,msg.senderID,msg.receiverID);
	:: timeout -> 
// Terminate when all messages have been processed  
		printf("Network has nothing to process1\n")
		break;
// if  
// :: timeout -> 
// 	printf("Network has nothing to process2\n")
// 	break;
// fi  
	od  
	printf("Network terminating\n");
}  

// Monitor process  
active proctype Monitor()  
{  
	MsgType msg;
	do  
	:: toMonitor?msg -> 
// printf("Monitor logged message %d from Node %d to Node %d\n",
// msg.msgID,msg.senderID,msg.receiverID)
		printf("Recieved;Network -> Monitor = > Message: %d,Node -> Monitor = > Message: %d\n",msg.msgID,msg.msgID);
	:: timeout -> // Terminate when all messages have been logged  
		printf("Monitor has nothing to process so breaking")
		break;
	od  
	printf("Monitor terminating\n");
}
// Initialization: Start the nodes  
init {  
	atomic {  
		int i;
// Start Node processes  
		i = 1;
		do  
		:: (i <= NUM_NODES) -> 
			run Node(i);
			i++;
		:: else -> 
			break;
		od  
	}  
}  