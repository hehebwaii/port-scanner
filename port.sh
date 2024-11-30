#!/bin/bash

# A simple port scanning script using Netcat (nc)

# Usage function
usage() {
    echo "Usage: $0 <target_host> <start_port> <end_port>"
    exit 1
}

# Check if correct number of arguments are provided
if [ $# -ne 3 ]; then
    usage
fi

# Variables
TARGET=$1
START_PORT=$2
END_PORT=$3

echo "Scanning target: $TARGET"
echo "Ports range: $START_PORT to $END_PORT"

# Loop through the range of ports
for ((PORT=$START_PORT; PORT<=$END_PORT; PORT++)); do
    nc -zv -w1 $TARGET $PORT 2>&1 | grep -E "open|succeeded"
done
