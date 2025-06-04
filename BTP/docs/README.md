# Raft Consensus Algorithm Verification

This repository contains a formal model of the Raft consensus algorithm implemented in Promela and verified using the SPIN model checker. The project focuses on rigorously testing and checking the safety guarantees of Raft across various server configurations.

## Project Overview

The Raft consensus algorithm is designed to maintain consistency in distributed systems even in the presence of node failures. This implementation provides:

- An extended Promela model of Raft that supports arbitrary server counts
- Formal verification of Raft's safety properties with different cluster sizes
- Detailed performance analysis as system complexity increases
- Verification of crash handling while preserving safety guarantees
- Analysis of property-specific verification performance

## Repository Structure

- `scripts/`: Contains scripts for running verification and analysis
- `reference_papers/`: Important papers and literature about Raft and formal verification
- `assets/`: Images and other supporting files
- `report-presentation/`: Project report and presentation materials
- `graphs/`: Visual representations of verification results
- `results/`: Raw data from verification runs

## Model Files

- `raft_sem8.pml`: Latest implementation of the Raft consensus algorithm
- `raft_sem7.pml`: Previous implementation from semester 7
- `raft_original.pml`: Original base implementation
- `network.pml`: Network layer implementation for message passing
- `server_client.pml`: Server-client interaction model

## Key Features

- Configurable number of servers (5-20 servers tested)
- Complete verification with low search depth (100)
- Extensive partial verification with high search depth (1000)
- Verification of critical safety properties including:
  - Election Safety
  - Log Matching
  - State Machine Safety
  - Leader Completeness
  - Crash Recovery
  - Liveness and Stability

## Getting Started

Please refer to [install.md](./install.md) for setup instructions and [usage.md](./usage.md) for detailed usage information.

## Results

Our verification results demonstrate:

- The Raft consensus algorithm, as modeled in our extended implementation, preserves all safety properties across different server configurations (5-20 servers)
- For low search depth (100), we achieved complete verification with no safety violations detected, with verification terminating normally without errors
- For high search depth (1000), no safety violations were detected throughout partial verification until memory was exhausted, supporting correctness across a larger but incomplete state space
- State vector size grows linearly with server count, increasing by approximately 252 bytes per additional server
- Memory requirements scale almost linearly, doubling from ~7GB with 5 servers to ~24GB with 20 servers
- Different property types exhibit varying verification performances:
  - Liveness properties verify more efficiently (1.4x degradation from 5→20 servers)
  - Safety properties show medium degradation (3.0x)
  - Log-related properties experience 1.8x slowdown
  - Crash-related properties show the steepest decline (3.4x slower)
- Our model's handling of crashed nodes maintains safety properties, validating Raft's crash fault tolerance
- The implementation of heartbeat message logic effectively maintains leader authority and prevents unnecessary elections
