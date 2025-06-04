import matplotlib.pyplot as plt
import numpy as np

# Set style for better visualization
plt.style.use('ggplot')

# Define server configurations
servers = [5, 10, 15, 20]

# 1. State Vector Size vs Server Count
state_vector_sizes = [1184, 2412, 3724, 4968]  # in bytes

plt.figure(figsize=(10, 6))
plt.plot(servers, state_vector_sizes, 'o-', linewidth=2, markersize=10)
plt.xlabel('Number of Servers')
plt.ylabel('State Vector Size (bytes)')
plt.title('State Vector Size Growth with Server Count')
plt.grid(True)
plt.tight_layout()
plt.savefig('state_vector_size.png', dpi=300)
plt.close()

# 2. Memory Consumption vs Server Count
memory_consumption = [6.9, 12.0, 18.0, 24.0]  # in GB

plt.figure(figsize=(10, 6))
plt.plot(servers, memory_consumption, 'o-', linewidth=2, markersize=10, color='#2C3E50')
plt.xlabel('Number of Servers')
plt.ylabel('Memory Consumption (GB)')
plt.title('Memory Requirements with Increasing Server Count')
plt.grid(True)
plt.tight_layout()
plt.savefig('memory_consumption.png', dpi=300)
plt.close()

# 3. Verification Performance by Property Type
# States per second for different property types
property_types = ['Liveness', 'Safety', 'Log-Related', 'Crash-Related']

# Data from Table 6 in report
performance_5_servers = [46362, 27626, 11701, 12047]
performance_20_servers = [33091, 9073, 6475, 3500]

# Create comparison bar chart
width = 0.35
x = np.arange(len(property_types))

plt.figure(figsize=(12, 7))
plt.bar(x - width/2, performance_5_servers, width, label='5 Servers', color='#3498DB')
plt.bar(x + width/2, performance_20_servers, width, label='20 Servers', color='#E74C3C')

plt.xlabel('Property Type')
plt.ylabel('Verification Speed (States/sec)')
plt.title('Verification Performance Comparison by Property Type')
plt.xticks(x, property_types)
plt.legend()
plt.grid(True, axis='y')
plt.tight_layout()
plt.savefig('verification_performance.png', dpi=300)
plt.close()

# 4. Performance Degradation by Property Type
degradation = [1.4, 3.0, 1.8, 3.4]  # From Table 7 in report

plt.figure(figsize=(10, 6))
bars = plt.bar(property_types, degradation, color=['#2ECC71', '#F39C12', '#9B59B6', '#E74C3C'])
plt.xlabel('Property Type')
plt.ylabel('Performance Degradation Factor (5→20 servers)')
plt.title('Performance Degradation with Increased Server Count')
plt.grid(True, axis='y')

# Add value labels on top of bars
for bar in bars:
    height = bar.get_height()
    plt.text(bar.get_x() + bar.get_width()/2., height + 0.05,
             f'{height}x', ha='center', va='bottom')

plt.tight_layout()
plt.savefig('performance_degradation.png', dpi=300)
plt.close()

# 5. Comprehensive Performance Trends
# Create a line chart showing verification speed trends across server counts

# Average states/sec for each property type across server configurations
liveness_data = [46362, 42000, 37000, 33091]  # Approximated from tables
safety_data = [27626, 18000, 12000, 9073]     # Approximated from tables
log_data = [11701, 9000, 7500, 6475]          # Approximated from tables
crash_data = [12047, 8500, 5000, 3500]        # From Table 6

plt.figure(figsize=(12, 7))
plt.plot(servers, liveness_data, 'o-', linewidth=2, label='Liveness Properties', color='#2ECC71')
plt.plot(servers, safety_data, 's-', linewidth=2, label='Safety Properties', color='#F39C12')
plt.plot(servers, log_data, '^-', linewidth=2, label='Log-Related Properties', color='#9B59B6')
plt.plot(servers, crash_data, 'D-', linewidth=2, label='Crash-Related Properties', color='#E74C3C')

plt.xlabel('Number of Servers')
plt.ylabel('Verification Speed (States/sec)')
plt.title('Verification Performance Trends by Property Type')
plt.grid(True)
plt.legend()
plt.tight_layout()
plt.savefig('performance_trends.png', dpi=300)
plt.close() 