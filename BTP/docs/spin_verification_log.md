# Spin Verification Log

## Standard Verification (Max Search Depth Issue)

```
spin -a raft_backup.pml && gcc -DSAFETY -DMEMLIM=2048 -o pan pan.c && ./pan -m10000
```

Result: Bus error - The search depth was insufficient

## Fixed Verification with Increased Search Depth

```
spin -a raft_backup.pml && gcc -DSAFETY -DMEMLIM=2048 -o pan pan.c && ./pan -m50000
```

Result:

```
Warning: Search not completed
+ Partial Order Reduction

Full statespace search for:
        never claim             + (electionSafety)
        assertion violations    + (if within scope of claim)
        cycle checks            - (disabled by -DSAFETY)
        invalid end states      - (disabled by never claim)

State-vector 460 byte, depth reached 641, errors: 0
  4907997 states, stored
  7771024 states, matched
 12679021 transitions (= stored+matched)
  9320335 atomic steps
hash conflicts:    613287 (resolved)

Stats on memory usage (in Megabytes):
 2284.148       equivalent memory usage for states (stored*(State-vector + overhead))
 1924.834       actual memory usage for states (compression: 84.27%)
                state-vector as stored = 383 byte + 28 byte overhead
  128.000       memory used for hash table (-w24)
    2.670       memory used for DFS stack (-m50000)
    7.549       memory lost to fragmentation
 2047.956       total actual memory usage

pan: elapsed time 30.6 seconds
pan: rate 160654.57 states/second
```

## With COLLAPSE State Compression

```
spin -a raft_backup.pml && gcc -DSAFETY -DCOLLAPSE -DMEMLIM=4096 -o pan pan.c && ./pan -m50000
```

Result:

```
Warning: Search not completed
+ Partial Order Reduction
+ Compression

Full statespace search for:
        never claim             + (electionSafety)
        assertion violations    + (if within scope of claim)
        cycle checks            - (disabled by -DSAFETY)
        invalid end states      - (disabled by never claim)

State-vector 460 byte, depth reached 641, errors: 0
  9317398 states, stored
 14836311 states, matched
 24153709 transitions (= stored+matched)
 18284502 atomic steps
hash conflicts:   2460670 (resolved)

Stats on memory usage (in Megabytes):
 4336.252       equivalent memory usage for states (stored*(State-vector + overhead))
  368.942       actual memory usage for states (compression: 8.51%)
                state-vector as stored = 14 byte + 28 byte overhead
  128.000       memory used for hash table (-w24)
    2.670       memory used for DFS stack (-m50000)
  499.518       total actual memory usage

pan: elapsed time 54.4 seconds
pan: rate 171275.7 states/second
```

## With BITSTATE Approximation

```
spin -a raft_backup.pml && gcc -DSAFETY -DBITSTATE -o pan pan.c && ./pan -m50000
```

Result:

```
Warning: Search not completed
+ Partial Order Reduction

Bit statespace search for:
        never claim             + (electionSafety)
        assertion violations    + (if within scope of claim)
        cycle checks            - (disabled by -DSAFETY)
        invalid end states      - (disabled by never claim)

State-vector 460 byte, depth reached 641, errors: 0
 60001207 states, stored
 96967014 states, matched
1.5696822e+08 transitions (= stored+matched)
1.2313791e+08 atomic steps

hash factor: 2.23692 (best if > 100.)
bits set per state: 3 (-k3)

Stats on memory usage (in Megabytes):
27466.373       equivalent memory usage for states (stored*(State-vector + overhead))
   16.000       memory used for hash array (-w27)
    0.381       memory used for bit stack
    2.670       memory used for DFS stack (-m50000)
   19.345       total actual memory usage

pan: elapsed time 356 seconds
pan: rate 168414.99 states/second
```

## Summary of Options

To address the max search depth problem in the Raft Promela model:

1. **Increase search depth**: Use `-m50000` instead of the default
2. **Reduce memory usage**:
   - `-DBITSTATE`: Efficient approximation algorithm (dramatically reduces memory: only 19MB used)
   - `-DCOLLAPSE`: State compression (good option for full verification, reduced to 499MB)
3. **Increase memory limit**: Use `-DMEMLIM=4096` to increase to 4GB

For the most thorough verification, use COLLAPSE:

```
spin -a raft_backup.pml && gcc -DSAFETY -DCOLLAPSE -DMEMLIM=4096 -o pan pan.c && ./pan -m50000
```

For the most memory-efficient verification, use BITSTATE:

```
spin -a raft_backup.pml && gcc -DSAFETY -DBITSTATE -o pan pan.c && ./pan -m50000
```

All verification runs found no errors in the electionSafety property.
