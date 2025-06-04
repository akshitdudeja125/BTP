# Installation Guide

This document provides instructions for setting up the environment to run and verify the Raft consensus algorithm implementation using the SPIN model checker.

## Requirements

- Linux, macOS, or Windows with WSL (Windows Subsystem for Linux)
- Memory requirements based on server configuration:
  - 5 servers: ~7GB
  - 10 servers: ~12GB
  - 15 servers: ~18GB
  - 20 servers: ~24GB

## Installing SPIN Model Checker

### On Ubuntu/Debian

```bash
sudo apt-get update
sudo apt-get install spin
```

### On macOS using Homebrew

```bash
brew install spin
```

### From Source

If you need the latest version or your platform isn't supported by the methods above:

1. Download the latest version from the [official SPIN website](http://spinroot.com/spin/whatispin.html)
2. Extract the archive and navigate to the spin directory
3. Compile and install SPIN:

```bash
make
sudo make install
```

## Verifying Installation

To verify SPIN is correctly installed:

```bash
spin -V
```

This should display the installed SPIN version.

## Installing ispin (Optional)

ispin is a graphical interface for SPIN which can be useful for visualization:

### On Ubuntu/Debian

```bash
sudo apt-get install tcl tk
cd /path/to/spin/directory
sudo make install-ispin
```

### On macOS

```bash
brew install tcl-tk
cd /path/to/spin/directory
sudo make install-ispin
```

## Additional Tools

For analyzing verification results and generating graphs, you'll need:

### Python Dependencies

```bash
pip install matplotlib numpy pandas seaborn
```

## Memory Configuration

For larger configurations (15-20 servers), you may need to increase system memory limits:

### On Linux

```bash
# Temporarily increase maximum locked memory
sudo ulimit -l unlimited
```

### For SPIN

When running verifications, use the vectorized representation parameter to accommodate larger state vectors:

```bash
spin -DVECTORSZ=20000 [other parameters] model.pml
```

## Verifying the Setup

To test your setup with a simple verification run:

```bash
cd /path/to/repository
spin -a raft_sem8.pml
gcc -o pan pan.c
./pan -m100
```

If this completes without errors, your environment is correctly set up.
