#!/bin/bash                                 

set -x                                       # Turn debugging/tracing ON and show commands as Bash executes them.

echo "Starting the script."                  # Print "Starting the script."

X=10                                         # Create variable X and give it the value 10.
Y=20                                         # Create variable Y and give it the value 20.
Z=$((X + Y))                                 # Add X and Y together and store the result (30) in Z.

echo "The value of Z is: $Z"                 # Print the value stored in Z.

set +x                                       # Turn debugging/tracing OFF.

echo "After the script"                      # Print this normally because tracing has now been turned off.

# ===============================================================
# Think of set -x as "Show me what Bash is doing behind the scenes"
# if we run this script without set -x, we would see the answer to the question, but we would not see how Bash is processing the commands.
# in the output, the lines begginging with + are the debugging/tracing lines that show what Bash is doing behind the scenes.
# set -x = turn tracing ON
# set +x = turn tracing OFF
# ==============================================================

# set -x
#    ↓
# "Show me what you're doing"

# Commands still run
#    ↓
# set +x
#   ↓
# "Stop showing me what you're doing"

# Commands STILL run