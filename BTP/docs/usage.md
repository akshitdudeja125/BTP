# Usage Guide

This document provides instructions for running verification on the Raft consensus algorithm model using different configurations and parameters.

## Basic Verification

To run a basic verification with default parameters:

```bash
cd /path/to/repository
spin -a raft_sem8.pml
gcc -o pan pan.c
./pan -m100
```

This will:

1. Generate the verifier from the Promela model
2. Compile the verifier
3. Run the verification with a search depth of 100

## Verification Parameters from Research

Based on our research, we recommend the following verification parameters that provide an optimal balance between exploration depth and computational feasibility:

```bash
# Generate verifier with safety optimization and increased vector size
spin -DSAFETY -DVECTORSZ=20000 -a raft_sem8.pml

# Compile the verifier with optimization
gcc -DSAFETY -DVECTORSZ=20000 -O3 -o pan pan.c

# Run verification with compression techniques
./pan -m100 -c1 -DCOLLAPSE
```

These parameters were selected based on our findings:

- Search depth of 100 for complete verification
- Safety verification (-DSAFETY) to focus on critical safety properties
- Vectorized representation (-DVECTORSZ=20000) to accommodate increased state vector sizes
- Compression techniques to manage state space explosion

## Configuring Server Count

To modify the number of servers in the verification:

```bash
# Edit the NUM_SERVERS constant in the model
sed -i '1s/#define NUM_SERVERS [0-9]*/#define NUM_SERVERS 10/' raft_sem8.pml
```

We tested configurations from 5 servers (minimum for meaningful consensus) up to 20 servers.

## Search Depth Options

We identified two effective search depth configurations:

```bash
# For low search depth (complete verification)
./pan -m100

# For high search depth (partial verification)
./pan -m1000
```

The higher search depth (1000) yielded minimal additional coverage at significantly increased cost, and couldn't be fully evaluated for larger configurations due to memory constraints.

## Verifying Specific Properties

Our model checks several critical safety properties:

### Election Safety

```bash
spin -DCHECK_ELECTION_SAFETY -a raft_sem8.pml
gcc -DCHECK_ELECTION_SAFETY -o pan pan.c
./pan -m100
```

### Log Matching

```bash
spin -DCHECK_LOG_MATCHING -a raft_sem8.pml
gcc -DCHECK_LOG_MATCHING -o pan pan.c
./pan -m100
```

### State Machine Safety

```bash
spin -DCHECK_STATE_MACHINE_SAFETY -a raft_sem8.pml
gcc -DCHECK_STATE_MACHINE_SAFETY -o pan pan.c
./pan -m100
```

### Leader Completeness

```bash
spin -DCHECK_LEADER_COMPLETENESS -a raft_sem8.pml
gcc -DCHECK_LEADER_COMPLETENESS -o pan pan.c
./pan -m100
```

### Crash Safety

```bash
spin -DCHECK_CRASH_SAFETY -a raft_sem8.pml
gcc -DCHECK_CRASH_SAFETY -o pan pan.c
./pan -m100
```

### Liveness Properties

```bash
spin -DCHECK_LIVENESS -a raft_sem8.pml
gcc -DCHECK_LIVENESS -o pan pan.c
./pan -m100
```

## Analyzing Results

After running the verification, check the results with:

```bash
./pan -a
```

This will show the verification summary, including:

- States explored
- Memory used
- Any safety violations found
- Verification time

## Expected Performance

Based on our research, you can expect the following verification performance (states per second) by property type:

| Property Type            | 5 Servers | 20 Servers | Degradation |
| ------------------------ | --------- | ---------- | ----------- |
| Liveness Properties      | ~46,362   | ~33,091    | 1.4x        |
| Safety Properties        | ~27,626   | ~9,073     | 3.0x        |
| Log-Related Properties   | ~11,701   | ~6,475     | 1.8x        |
| Crash-Related Properties | ~12,047   | ~3,500     | 3.4x        |

## Memory Considerations

Expect the following approximate memory requirements:

- 5 servers: ~7GB
- 10 servers: ~12GB
- 15 servers: ~18GB
- 20 servers: ~24GB

For configurations with 15+ servers, we recommend employing partial-order reduction and compression techniques to manage state space explosion.
