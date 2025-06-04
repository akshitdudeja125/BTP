# Graph Explanations for Presentation Slides

## State Vector Size Growth

**Key Finding:** Linear growth at ~252 bytes per server

**Explanation:**

- State vector is the data structure SPIN uses to store a single system state
- Linear growth shows efficient model design (not exponential)
- Server state, terms, logs, and messages all contribute to vector size
- While state vector grows linearly, state space still grows exponentially

**Implication:** Good model design, but verification still faces fundamental scaling challenges

## Memory Consumption

**Key Finding:** Almost linear memory scaling (7GB→24GB)

**Explanation:**

- Memory usage follows predictable pattern across server configurations
- SPIN's state compression maintains 95-98% efficiency throughout
- Required memory can be projected for larger configurations
- Practical limit appears around 25 servers on typical hardware

**Implication:** Memory remains a primary limiting factor for verification scale

## Verification Performance Comparison

**Key Finding:** Dramatic performance differences between property types

**Explanation:**

- Liveness properties: 46,362→33,091 states/sec (maintain high speed)
- Safety properties: 27,626→9,073 states/sec (moderate decline)
- Log properties: 11,701→6,475 states/sec (significant slowdown)
- Crash properties: 12,047→3,500 states/sec (severe degradation)

**Implication:** Different properties require fundamentally different computational resources

## Performance Degradation Factors

**Key Finding:** Non-uniform degradation across property types

**Explanation:**

- Liveness properties: Only 1.4× slower with 4× more servers
- Crash properties: 3.4× slower with 4× more servers
- Verification difficulty depends on both system size AND property type
- Crash scenarios show combinatorial growth in possible system states

**Implication:** Verification strategies should be tailored to property types

## Performance Trends

**Key Finding:** Divergent scaling patterns across all server configurations

**Explanation:**

- Performance gaps widen as server count increases
- Crash properties show non-linear, accelerating degradation
- Liveness properties maintain relatively flat performance curve
- "Verification complexity gap" emerges between property types

**Implication:** Different optimization strategies needed for different property classes

## Research Implications

**Novel Contribution:** First detailed characterization of property-specific verification scaling

**Key Insights:**

1. Property-specific verification strategies are essential
2. Resource planning can follow predictable patterns
3. Verification feasibility can be estimated by property type
4. Future tools should implement property-specific optimizations
5. Not all aspects of Raft are equally verifiable at scale

**Broader Impact:** Approach generalizes to other distributed consensus protocols
