w# Presentation Text for Slides 19-21

## Slide 19: Performance Analysis by Property Type

### Title

**Performance Analysis by Property Type**

### Content

- **Verification performance degradation (5→20 servers):**

  - Liveness properties: 1.4× (46,362→33,091 states/sec)
  - Safety properties: 3.0× (27,626→9,073 states/sec)
  - Log-related properties: 1.8× (11,701→6,475 states/sec)
  - Crash-related properties: 3.4× (12,047→3,500 states/sec)

- **Key insights:**

  - Property complexity interacts with system scale non-uniformly
  - Liveness verification scales most efficiently (only 1.4× slower)
  - Crash-related verification faces most severe degradation (3.4× slower)
  - "Verification complexity gap" increases with system size

- **Supporting visualization:**
  - Show performance_degradation.png and performance_trends.png
  - Highlight the divergent slopes of the trend lines

## Slide 20: Verification States Explored

### Title

**Verification States and Search Space Analysis**

### Content

- **States explored per property class:**

  - Core safety properties: ~5-6 million states (consistent across configurations)
  - Liveness properties: ~5-7 million states
  - Crash recovery properties: ~4-6 million states

- **Resource requirements:**

  - State vector: 252 bytes per additional server (linear scaling)
  - Memory: Near-linear scaling (7GB→24GB from 5→20 servers)
  - Search completion: Impossible due to state space explosion
  - Compression efficiency: 95-98% maintained across configurations

- **Significance:**

  - All safety properties verified without violations
  - Memory becomes primary limiting factor beyond 20-25 servers
  - Complete verification remains infeasible due to exponential state space
  - Partial verification provides high confidence despite incompleteness

- **Supporting visualization:**
  - Show state_vector_size.png and memory_consumption.png
  - Emphasize the linear patterns but exponential challenge

## Slide 21: Key Findings and Limitations

### Title

**Key Findings and Scaling Insights**

### Content

- **All safety properties verified successfully**

  - No violations found across millions of examined states
  - Verification speed varies dramatically by property type:
    - Liveness properties: Most efficiently verified (33,091 states/sec at n=20)
    - Crash properties: Most challenging to verify (3,500 states/sec at n=20)

- **Scalability characteristics:**

  - State vector growth: Linear (predictable, manageable)
  - State space growth: Exponential (fundamental verification challenge)
  - Memory scaling: Near-linear but practical limit around 25 servers
  - Performance scaling: Highly property-dependent (1.4× to 3.4× degradation)

- **Novel insight:**

  - Different classes of properties require different verification approaches
  - Verification strategy should be property-type aware for optimal performance
  - Resource allocation should consider property complexity, not just system size

- **Supporting visualization:**
  - Show verification_performance.png
  - Emphasize the dramatic performance differences between property types
