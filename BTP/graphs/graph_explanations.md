# Detailed Explanations of Raft Verification Graphs

## 1. State Vector Size Growth (state_vector_size.png)

### Technical Explanation

This graph visualizes the state vector size increase as the number of Raft servers scales from 5 to 20. The state vector in SPIN represents the complete system state that must be stored during verification, including all variables, channels, and process states.

The observed linear growth pattern (approximately 252 bytes per additional server) demonstrates that our Promela model scales efficiently in terms of state representation. This linear relationship is explained by the consistent per-server data structures in our model:

- State variables (follower/leader/candidate/crashed)
- Term counters
- Log entries
- Vote records
- Message queues

### Significance

The linear growth of state vector size (rather than exponential) indicates that our model successfully encapsulates server behavior in a scalable manner. However, it's important to note that while the state vector grows linearly, the state space (all possible combinations of states) still grows exponentially.

This distinction is crucial for understanding verification feasibility: even with efficient state representation, exploring all possible system behaviors becomes computationally prohibitive as server count increases.

## 2. Memory Consumption Scaling (memory_consumption.png)

### Technical Explanation

This graph shows the memory required for verification as the server count increases from 5 to 20. Memory usage scales from approximately 7GB with 5 servers to 24GB with 20 servers.

The near-linear relationship (with a slight superlinear trend) between server count and memory consumption reflects both:

1. The linear growth of the state vector size
2. The efficient state compression achieved by SPIN (95-98% as noted in the report)

Memory consumption is calculated as: `M = (S × N × C) / R`
Where:

- M is memory usage
- S is state vector size
- N is number of states explored
- C is compression factor
- R is reduction factor from partial-order reduction

### Significance

The predictable memory scaling allows us to:

1. Estimate resource requirements for verification of larger configurations
2. Identify the practical limits of our verification approach (systems beyond 20-25 servers would likely exceed commonly available memory)
3. Confirm the effectiveness of SPIN's compression techniques in mitigating state space explosion

This graph directly addresses one of the fundamental challenges in model checking: resource constraints. While verification remains feasible for practical Raft configurations (typically 5-7 servers), it highlights why complete verification of very large distributed systems remains challenging.

## 3. Verification Performance Comparison (verification_performance.png)

### Technical Explanation

This bar chart compares verification speeds (states explored per second) between 5-server and 20-server configurations across four property categories:

1. **Liveness Properties** (e.g., eventual leadership): Focus on ensuring progress in the system
2. **Safety Properties** (e.g., election safety): Ensure nothing bad happens
3. **Log-Related Properties** (e.g., log matching): Verify consistency of replicated logs
4. **Crash-Related Properties** (e.g., crash safety): Ensure correct behavior during failures

The data reveals significant performance differences:

- Liveness properties maintain relatively high verification speeds (46,362 → 33,091 states/sec)
- Crash-related properties show the most dramatic slowdown (12,047 → 3,500 states/sec)

### Significance

The varying verification speeds reflect fundamental differences in property complexity:

1. **Liveness properties** typically involve simple reachability checks (can some state eventually be reached?) which SPIN can verify efficiently using specialized algorithms.

2. **Crash-related properties** require exploring complex interactions between normal and failed states, including recovery scenarios, making these verification tasks inherently more complex.

This performance disparity suggests that verification effort is not uniform across the protocol's guarantees, with certain correctness properties requiring significantly more computational resources to verify.

## 4. Performance Degradation Factors (performance_degradation.png)

### Technical Explanation

This graph quantifies the verification slowdown factor when scaling from 5 to 20 servers for each property type:

- Liveness Properties: 1.4× degradation
- Safety Properties: 3.0× degradation
- Log-Related Properties: 1.8× degradation
- Crash-Related Properties: 3.4× degradation

These factors were calculated by dividing the verification speed (states/sec) for 5 servers by the speed for 20 servers for each property type.

### Significance

The non-uniform degradation patterns reveal that property complexity interacts with system scale in different ways:

1. **Liveness properties show remarkable resilience** (only 1.4× slower), suggesting that their verification algorithms scale efficiently with system size. This is likely because these properties can often be checked without exploring the entire state space.

2. **Crash-related properties degrade most severely** (3.4× slower), indicating that failure scenarios become disproportionately more complex to verify as system size grows. This is because the number of possible crash permutations grows combinatorially with server count.

This finding has profound implications for verification strategy: when resources are limited, verification efforts should be prioritized based on both property importance and verification complexity.

## 5. Comprehensive Performance Trends (performance_trends.png)

### Technical Explanation

This line graph tracks verification performance across all server configurations (5, 10, 15, and 20 servers) for each property type. It visualizes the complete degradation curve rather than just the endpoints.

Key observations:

- Liveness properties maintain high performance across all configurations
- Crash-related properties show a steep, non-linear decline
- Safety and log-related properties follow intermediate degradation curves
- The performance gaps widen significantly at larger scales

### Significance

The divergent trends suggest that:

1. **Verification complexity does not scale uniformly** across property types. This non-uniformity becomes more pronounced at larger scales, creating an increasing "verification complexity gap" between property types.

2. **The degradation curves are non-linear** for most properties, with performance declining more rapidly as server count increases. This indicates that the relationship between system scale and verification complexity is not simply linear but involves more complex factors.

3. **Predictable scaling patterns** emerge that could be modeled mathematically to forecast verification requirements for even larger configurations.

## Raft State Diagram

The `raft_state_diagram.png` shows the state transitions for a node in the Raft consensus algorithm. This visualization improves upon the original diagram with clearer visual hierarchy, better color coding, and improved readability.

### Key Features

- **Color Coding**: Different states are represented with distinct colors:

  - Follower: Light blue
  - Candidate: Light orange
  - Leader: Light red
  - Crashed: Light green

- **Transition Labels**: Each state transition is clearly labeled with its trigger condition.

- **Improved Layout**: The diagram uses a logical left-to-right layout for the main state progression (Follower → Candidate → Leader), with the Crashed state positioned above to indicate its special nature.

### State Transitions

The diagram shows the following key transitions:

1. A Follower becomes a Candidate when a timeout occurs (election timeout)
2. A Candidate becomes a Leader when it receives a majority of votes
3. A Candidate can revert to being a Follower when it receives RPC with a newer term or detects a current leader
4. A Candidate can start a new election term upon timeout
5. A Leader reverts to Follower when it receives an RPC with a higher term
6. Any node can crash and later resume as a Follower

This visualization aids in understanding the dynamic behavior of nodes in the Raft consensus algorithm and their response to various events in the distributed system.

## Research and Practical Implications

These visualizations collectively demonstrate that:

1. **Property-specific verification strategies are essential** for efficient formal verification of distributed consensus protocols. Different classes of properties require different approaches to manage state space explosion.

2. **Resource planning for verification** can be informed by predictable scaling patterns, allowing researchers to allocate appropriate computational resources based on the properties being verified.

3. **Verification feasibility boundaries** can be estimated for different property types, helping identify which aspects of a protocol can be exhaustively verified and which may require complementary approaches like runtime verification or testing.

4. **Future verification tools** could benefit from property-specific optimizations that target the different scaling behaviors observed here.

5. **Raft's inherent verifiability** varies across its different guarantees, with liveness properties being more amenable to verification at scale than crash-related safety properties.

These findings extend beyond Raft to other distributed consensus protocols, suggesting that formal verification approaches should be tailored to both the specific protocol and the specific properties being verified.
