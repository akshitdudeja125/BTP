#!/bin/bash
# Script to run the Raft model with different options

# Default mode: Run with guided execution and show printf statements
if [ "$1" == "" ]; then
    echo "Running with guided execution and showing printf statements"
    spin -g raft.pml
    exit 0
fi

# Run with verification
if [ "$1" == "verify" ]; then
    echo "Running verification"
    spin -a raft.pml
    gcc -o pan pan.c
    ./pan
    exit 0
fi

# Run with random execution and show printf statements
if [ "$1" == "random" ]; then
    echo "Running with random execution and showing printf statements"
    spin raft.pml
    exit 0
fi

# Run with simulation and show printf statements
if [ "$1" == "sim" ]; then
    echo "Running simulation and showing printf statements"
    spin -p raft.pml
    exit 0
fi

# Run with simulation and show printf statements, with a specific seed
if [ "$1" == "seed" ]; then
    if [ "$2" == "" ]; then
        echo "Please provide a seed value"
        exit 1
    fi
    echo "Running simulation with seed $2 and showing printf statements"
    spin -p -s$2 raft.pml
    exit 0
fi

echo "Unknown option: $1"
echo "Usage: $0 [verify|random|sim|seed <value>]"
echo "  - No arguments: Run with guided execution and show printf statements"
echo "  - verify: Run verification"
echo "  - random: Run with random execution and show printf statements"
echo "  - sim: Run simulation and show printf statements"
echo "  - seed <value>: Run simulation with a specific seed and show printf statements" 