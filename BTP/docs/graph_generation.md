# Graph Generation Documentation

This document explains how to use the `generate_graphs.py` script to visualize the verification results of the Raft consensus algorithm model.

## Overview

The `generate_graphs.py` script creates visualizations based on the verification results obtained from running the Raft model with different server configurations and property types. These visualizations help in understanding the performance characteristics, scalability, and resource requirements of the verification process.

## Requirements

To run the script, you'll need:

- Python 3.6 or higher
- matplotlib library
- numpy library

Install the required dependencies using:

```bash
pip install matplotlib numpy
```

## Usage

To generate all graphs:

```bash
cd /path/to/BTP/graphs
python generate_graphs.py
```

## Generated Visualizations

The script generates five key visualizations:

### 1. State Vector Size Growth

**Filename:** `state_vector_size.png`

This graph shows the linear growth of state vector size (in bytes) as the number of servers increases from 5 to 20. The data demonstrates that each additional server increases the state vector by approximately 252 bytes.

### 2. Memory Consumption

**Filename:** `memory_consumption.png`

This visualization illustrates how memory requirements (in GB) scale with server count. The graph shows memory consumption increasing from approximately 7GB with 5 servers to 24GB with 20 servers, following a nearly linear pattern.

### 3. Verification Performance Comparison

**Filename:** `verification_performance.png`

This bar chart compares verification speeds (states per second) between 5-server and 20-server configurations for different property types:

- Liveness Properties
- Safety Properties
- Log-Related Properties
- Crash-Related Properties

The chart highlights the performance differences, particularly for crash-related properties which experience the most significant slowdown when scaling to larger configurations.

### 4. Performance Degradation

**Filename:** `performance_degradation.png`

This visualization quantifies the non-uniform degradation patterns by property type when scaling from 5 to 20 servers:

- Crash-related properties: 3.4x degradation
- Safety properties: 3.0x degradation
- Log-related properties: 1.8x degradation
- Liveness properties: 1.4x degradation

### 5. Performance Trends

**Filename:** `performance_trends.png`

This comprehensive line chart shows verification performance trends across all server configurations (5, 10, 15, and 20 servers) for each property type. The divergent trends illustrate that verification complexity does not scale uniformly across property types, with performance gaps widening at larger scales.

## Data Sources

The visualizations are based on data from the verification results documented in Section 4 (Verification and Results) of the project report, including:

- Table 4: State Vector Size and Memory Characteristics
- Tables 5-7: Property verification results across server configurations
- Table 8: Performance trend analysis by property type

## Customization

To modify the graphs or add new visualizations:

1. Edit the data points in the script to match your verification results
2. Adjust styling parameters as needed
3. Add new plotting sections for additional visualizations

## Output

All generated graphs are saved as PNG files in the same directory as the script, with a resolution of 300 DPI for high-quality publication.
