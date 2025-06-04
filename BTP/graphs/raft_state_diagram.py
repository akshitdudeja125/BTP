import matplotlib.pyplot as plt
import matplotlib.patches as patches
import matplotlib.path as path
import numpy as np
from matplotlib.textpath import TextPath
from matplotlib.transforms import Affine2D
import matplotlib.colors as mcolors

# Set high DPI and figure size for better quality
plt.figure(figsize=(12, 8), dpi=300)

# Create axis
ax = plt.gca()
ax.set_xlim(-1, 11)
ax.set_ylim(-1, 7)
ax.axis('off')

# Define colors
follower_color = '#90CAF9'  # Light blue
candidate_color = '#FFCC80'  # Light orange
leader_color = '#EF9A9A'    # Light red
crashed_color = '#A5D6A7'   # Light green
arrow_color = '#212121'     # Dark gray

# Function to create state boxes with rounded corners
def create_state_box(x, y, width, height, color, label, fontsize=12):
    box = patches.FancyBboxPatch(
        (x, y), width, height, 
        boxstyle=patches.BoxStyle("Round", pad=0.3, rounding_size=0.25),
        facecolor=color, 
        edgecolor='black',
        linewidth=1.5,
        alpha=0.9
    )
    ax.add_patch(box)
    
    # Add text in the middle of the box
    ax.text(x + width/2, y + height/2, label, 
            ha='center', va='center', 
            fontsize=fontsize, 
            fontweight='bold')
    
    return box

# Function to create arrows with labels
def create_arrow(start, end, label="", offset=0, color='black', fontsize=10, 
                 connectionstyle='arc3,rad=0.1', style='->'):
    
    # Create the arrow
    arrow = patches.FancyArrowPatch(
        start, end, 
        connectionstyle=connectionstyle,
        arrowstyle=style,
        mutation_scale=20,
        linewidth=1.5,
        color=color
    )
    ax.add_patch(arrow)
    
    # Calculate the middle point with offset for the label
    path = arrow.get_path()
    vertices = path.vertices
    middle_idx = len(vertices) // 2
    
    if len(vertices) > 1:
        # Get position for label
        if middle_idx < len(vertices):
            pos = vertices[middle_idx]
            
            # Apply the offset
            norm = np.sqrt((end[0]-start[0])**2 + (end[1]-start[1])**2)
            if norm != 0:
                dx = -(end[1]-start[1])/norm * offset
                dy = (end[0]-start[0])/norm * offset
            else:
                dx, dy = 0, offset
            
            # Add the label
            if label:
                ax.text(pos[0] + dx, pos[1] + dy, label,
                        ha='center', va='center',
                        fontsize=fontsize,
                        bbox=dict(facecolor='white', alpha=0.7, edgecolor='none', pad=1))

# Create state boxes
follower = create_state_box(1, 3, 2, 1.2, follower_color, "Follower")
candidate = create_state_box(5, 3, 2, 1.2, candidate_color, "Candidate")
leader = create_state_box(9, 3, 2, 1.2, leader_color, "Leader")
crashed = create_state_box(5, 6, 2, 1.2, crashed_color, "Crashed")

# Create arrows for state transitions
# Follower to Candidate
create_arrow((3.1, 3.5), (4.9, 3.5), "timeout", offset=0.3, color=arrow_color)

# Candidate to Follower
create_arrow((4.9, 3.2), (3.1, 3.2), "receive new term, or\ndetect current leader", offset=0.4, color=arrow_color)

# Candidate self-loop (timeout)
create_arrow((6, 2.9), (7, 2.0), "timeout", offset=0.3, color=arrow_color,
             connectionstyle='arc3,rad=-0.5')
create_arrow((7, 2.0), (6, 2.9), "", offset=0, color=arrow_color,
             connectionstyle='arc3,rad=-0.5')

# Candidate to Leader
create_arrow((7.1, 3.5), (8.9, 3.5), "majority of votes", offset=0.4, color=arrow_color)

# Leader to Follower
create_arrow((8.9, 3.2), (7.1, 3.2), "receive RPC with higher term", offset=0.4, color=arrow_color)

# Crashed state connections
# Follower to Crashed
create_arrow((2, 4.2), (5, 6.0), "crash", offset=0.25, color=arrow_color)

# Candidate to Crashed
create_arrow((6, 4.2), (6, 5.9), "crash", offset=0.2, color=arrow_color)

# Leader to Crashed
create_arrow((10, 4.2), (7, 6.0), "crash", offset=0.25, color=arrow_color)

# Crashed to Follower
create_arrow((5, 6.0), (2, 4.2), "resume", offset=0.25, color=arrow_color, 
             connectionstyle='arc3,rad=0.1')

# Add a caption
plt.figtext(0.5, 0.01, "Figure 1: State transitions for a node in Raft.",
            ha='center', fontsize=12)

# Save the figure
plt.tight_layout(pad=3)
plt.savefig('raft_state_diagram.png', bbox_inches='tight')
plt.close() 