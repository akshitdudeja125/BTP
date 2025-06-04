#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color
YELLOW='\033[1;33m'

MODEL="raft_sem8.pml"
echo -e "${YELLOW}Starting verification of all properties in $MODEL${NC}"

# Arrays of property names
SAFETY_PROPERTIES=(
    "electionSafety"
    "crashSafety"
    "leaderAppendOnly0"
    "leaderAppendOnly1"
    "leaderAppendOnly2"
    "logMatching"
    "stateMachineSafety"
    "leaderCompleteness"
    "noCrashedLeader"
    "crashedNoMessages"
    "majorityAlive"
    "uniqueness"
    "stability0"
    "stability1"
    "stability2"
)

LIVENESS_PROPERTIES=(
    "eventualRecovery"
    "recoveryLogConsistency"
    "eventualLeadership"
    "liveness"
)

# Function to verify a property
verify_property() {
    property=$1
    type=$2
    
    echo -e "\n${YELLOW}Verifying $property (type: $type)...${NC}"
    
    # Generate the verifier
    spin -a -ltl $property $MODEL
    
    # Compile the verifier with appropriate flags
    if [ "$type" == "safety" ]; then
        gcc -DSAFETY -o pan pan.c
    else
        gcc -DNP -o pan pan.c
    fi
    
    # Run the verifier
    ./pan -a
    
    # Check the exit code
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✓ Property $property passed verification${NC}"
        return 0
    else
        echo -e "${RED}✗ Property $property failed verification${NC}"
        return 1
    fi
}

# Verify all safety properties
echo -e "\n${YELLOW}Verifying SAFETY properties...${NC}"
failed_safety=0
for prop in "${SAFETY_PROPERTIES[@]}"; do
    verify_property $prop "safety"
    if [ $? -ne 0 ]; then
        ((failed_safety++))
    fi
done

# Verify all liveness properties
echo -e "\n${YELLOW}Verifying LIVENESS properties...${NC}"
failed_liveness=0
for prop in "${LIVENESS_PROPERTIES[@]}"; do
    verify_property $prop "liveness"
    if [ $? -ne 0 ]; then
        ((failed_liveness++))
    fi
done

# Summary
total=$((${#SAFETY_PROPERTIES[@]} + ${#LIVENESS_PROPERTIES[@]}))
passed=$((total - failed_safety - failed_liveness))

echo -e "\n${YELLOW}===== VERIFICATION SUMMARY =====${NC}"
echo -e "Total properties: $total"
echo -e "${GREEN}Passed: $passed${NC}"
if [ $failed_safety -gt 0 ] || [ $failed_liveness -gt 0 ]; then
    echo -e "${RED}Failed: $((failed_safety + failed_liveness))${NC}"
    echo -e "  - Failed safety properties: $failed_safety"
    echo -e "  - Failed liveness properties: $failed_liveness"
else
    echo -e "${GREEN}All properties verified successfully!${NC}"
fi 