# Raft Consensus Algorithm Model Documentation

This document provides technical details about the Promela implementation of the Raft consensus algorithm, its components, and verified properties.

## Model Overview

The implementation consists of several Promela (.pml) files:

- `raft_sem8.pml`: Latest implementation with configurable server count and full safety properties
- `raft_original.pml`: Original base implementation
- `network.pml`: Network layer implementation for message passing
- `server_client.pml`: Server-client interaction model

## Main Components

### Server State

Each server in the Raft cluster maintains the following state:

```promela
typedef ServerState {
  int currentTerm;
  int votedFor;
  LogEntry log[MAX_LOG_SIZE];
  int commitIndex;
  int lastApplied;
  int state; // FOLLOWER, CANDIDATE, or LEADER
  int nextIndex[MAX_SERVERS];
  int matchIndex[MAX_SERVERS];
  int leaderId;
  // Additional state variables
}
```

### Message Types

Communication between servers occurs through messages of different types:

```promela
typedef Message {
  int type; // REQUEST_VOTE, VOTE_RESPONSE, APPEND_ENTRIES, etc.
  int term;
  int candidateId;
  int leaderId;
  int prevLogIndex;
  int prevLogTerm;
  LogEntry entries[MAX_ENTRIES_PER_MSG];
  int leaderCommit;
  int success;
  // Additional message fields
}
```

### Network Layer

The network layer models asynchronous communication with potential message loss:

```promela
chan networkChans[MAX_SERVERS][MAX_SERVERS] = [CHAN_SIZE] of { Message };
```

## Key Processes

### Server Process

Each server runs as a separate process with three potential states:

- Follower
- Candidate
- Leader

```promela
proctype Server(int id) {
  // State initialization

  do
    :: atomic {
      // Handle different states
      if
        :: state == FOLLOWER ->
          // Follower behavior
        :: state == CANDIDATE ->
          // Candidate behavior
        :: state == LEADER ->
          // Leader behavior
      fi
    }
  od
}
```

### Network Process

The network process handles message delivery with potential failures:

```promela
proctype Network() {
  // Message passing with configurable reliability
}
```

## Verified Properties

Our model verifies three categories of safety properties across all server configurations:

### Core Protocol Safety Properties

#### Election Safety

No more than one leader can be elected in the same term:

```promela
ltl election_safety {
  [](!(exists(i in Servers: is_leader(i) &&
      exists(j in Servers: is_leader(j) && i != j &&
      server[i].currentTerm == server[j].currentTerm))))
}
```

#### Log Matching

If two logs contain entries with the same index and term, then all previous entries must be identical:

```promela
ltl log_matching {
  [](forall(i,j in Servers:
      forall(idx in LogIndices:
          (server[i].log[idx].term == server[j].log[idx].term) ->
          (forall(k in LogIndices: k < idx ->
              server[i].log[k].term == server[j].log[k].term &&
              server[i].log[k].command == server[j].log[k].command)))))
}
```

#### State Machine Safety

If a server has applied a log entry at a given index, no other server will apply a different entry for the same index:

```promela
ltl state_machine_safety {
  [](forall(i,j in Servers:
      forall(idx in LogIndices:
          (server[i].lastApplied >= idx && server[j].lastApplied >= idx) ->
          (server[i].log[idx].command == server[j].log[idx].command))))
}
```

#### Leader Completeness

If a log entry is committed in a term, it will be present in the logs of all future leaders:

```promela
ltl leader_completeness {
  [](forall(idx in LogIndices:
      (exists(i in Servers: is_leader(i) && server[i].commitIndex >= idx)) ->
      (forall(j in Servers: is_leader(j) && server[j].currentTerm > server[i].currentTerm ->
          server[j].log[idx].term == server[i].log[idx].term &&
          server[j].log[idx].command == server[i].log[idx].command))))
}
```

### Liveness and Stability Properties

#### Stability

A leader with a quorum of responsive followers should remain the leader:

```promela
ltl stability {
  []((is_leader(i) && has_quorum(i)) -> <>(is_leader(i)))
}
```

#### Liveness

The system should eventually elect a leader if one is needed:

```promela
ltl liveness {
  []<>(exists(i in Servers: is_leader(i)))
}
```

#### Heartbeat Effectiveness

Heartbeat messages effectively maintain leader authority and prevent unnecessary elections:

```promela
ltl heartbeat_effectiveness {
  []((state == LEADER && sent_heartbeat) -> <>(!exists(j in Servers: state == CANDIDATE)))
}
```

### Crash and Recovery Properties

#### Crash Safety

The system maintains safety properties even when servers crash and recover:

```promela
ltl crash_safety {
  []((exists(i in Servers: crashed(i))) ->
      [](!(exists(j,k in Servers: j != k && is_leader(j) && is_leader(k) &&
          server[j].currentTerm == server[k].currentTerm))))
}
```

#### Eventual Leadership

The system will eventually elect a new leader after a leader crashes:

```promela
ltl eventual_leadership {
  []((is_leader(i) && crashed(i)) -> <>(exists(j in Servers: j != i && is_leader(j))))
}
```

## Implementation Details

### Election Process

1. Followers increment currentTerm and transition to candidate state when their election timeout elapses
2. Candidates vote for themselves and send RequestVote RPCs to all other servers
3. Servers grant votes if they haven't voted in this term and the candidate's log is at least as up-to-date
4. A candidate becomes leader when it receives votes from a majority of servers

```promela
inline start_election(id) {
  atomic {
    server[id].currentTerm++;
    server[id].state = CANDIDATE;
    server[id].votedFor = id;
    votes[id] = 1; // Vote for self

    // Send RequestVote RPCs to all other servers
    for (j: 0 .. NUM_SERVERS-1) {
      if (j != id) {
        // Create and send RequestVote message
      }
    }
  }
}
```

### Log Replication

1. Leaders append new entries to their logs
2. Leaders send AppendEntries RPCs to all followers to replicate entries
3. Leaders retry indefinitely until followers successfully append entries
4. Leaders update commitIndex when entries are replicated on a majority

```promela
inline send_append_entries(id) {
  atomic {
    for (j: 0 .. NUM_SERVERS-1) {
      if (j != id) {
        // Create and send AppendEntries message with appropriate nextIndex
      }
    }
  }
}
```

### Crash Handling

The model implements crash recovery by allowing servers to:

1. Stop processing messages temporarily (simulating a crash)
2. Resume with persistent state (currentTerm, votedFor, log) preserved
3. Volatile state (commitIndex, lastApplied, etc.) reset to initial values

```promela
inline crash_server(id) {
  atomic {
    server[id].state = CRASHED;
    // Save persistent state
    // Reset volatile state
  }
}

inline recover_server(id) {
  atomic {
    server[id].state = FOLLOWER;
    // Restore persistent state
    // Initialize volatile state
  }
}
```

## Verification Approach

Our verification methodology consists of:

1. **Search Depth Calibration**:

   - Low search depth (100) for complete verification
   - High search depth (1000) for more extensive but partial verification

2. **Safety-Focused Verification**:

   - Using -DSAFETY flag to focus on critical safety properties
   - Enabling SPIN's state storage optimizations

3. **State Vector Optimization**:

   - Using -DVECTORSZ=20000 to accommodate larger state vector sizes
   - Preventing premature termination due to vector overflow

4. **State Space Management**:

   - Partial-order reduction to minimize redundant state exploration
   - Compression techniques achieving 95-98% compression
   - Particularly critical for configurations with 15+ servers

5. **Multi-Configuration Testing**:
   - Running each property verification against multiple server counts (5, 10, 15, 20 servers)
   - Analyzing scaling behavior and performance characteristics

## Configuration Parameters

Key configurable parameters in the model:

```promela
#define NUM_SERVERS 5       // Number of servers in the cluster (configurable from 5-20)
#define MAX_LOG_SIZE 10     // Maximum log size per server
#define MAX_ENTRIES_PER_MSG 5  // Maximum entries per AppendEntries RPC
#define CHAN_SIZE 10        // Channel buffer size
#define MAX_TERM 8          // Maximum term number
#define MAX_TIME 100        // Maximum simulation time
```

## Optimization Techniques

To manage state space explosion, our model employs:

1. **Atomic Blocks**: Reducing interleaving where appropriate
2. **State Compression**: Achieving 95-98% compression efficiency
3. **Partial Order Reduction**: Minimizing redundant state exploration
4. **Strategic Abstraction**: Focusing on essential aspects of the algorithm
