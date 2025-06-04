# Raft Consensus Algorithm Verification

This repository contains a formal verification of the Raft consensus algorithm using the SPIN model checker and Promela modeling language.

## Documentation

For detailed information about this project, please see:

- [Installation Guide](docs/install.md) - Instructions for setting up SPIN and the verification environment
- [Usage Guide](docs/usage.md) - How to run and configure the verification
- [Model Documentation](docs/model.md) - Technical details about the Promela implementation
- [Graph Generation](docs/graph_generation.md) - Instructions for generating result visualizations
- [Comprehensive README](docs/README.md) - Complete project overview and details

## Quick Start

1. Install SPIN model checker (see [Installation Guide](docs/install.md))
2. Run basic verification:

```bash
spin -a raft_sem8.pml
gcc -o pan pan.c
./pan -m100
```

## Project Structure

- `*.pml` files - Promela model implementations
- `docs/` - Documentation
- `scripts/` - Utility scripts for running verifications
- `graphs/` - Visual representations of verification results
- `results/` - Raw data from verification runs

## Results

Our verification results demonstrate two distinct outcomes:

- **Low search depth (100)**: Complete verification with no safety violations detected for all properties across server configurations from 5-20 servers.

- **High search depth (1000)**: Verification could not complete exhaustively due to memory constraints, but no safety violations were detected in the millions of states explored before memory exhaustion.

The absence of counterexamples in both scenarios—complete verification at lower depths and extensive partial verification at higher depths—provides a high degree of confidence in the algorithm's correctness while highlighting the state space explosion challenge inherent in distributed system verification.

Property-specific analyses revealed that verification performance degradation is non-uniform, with crash-related properties showing the steepest decline (3.4x slower) while liveness properties degraded more gracefully (only 1.4x slower) when scaling from 5 to 20 servers.
