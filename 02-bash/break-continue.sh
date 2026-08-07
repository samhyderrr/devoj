#!/bin/bash                               

for (( i=1; i<=5; i++ ))                   # Start i at 1, keep looping while i is less than or equal to 5, and increase i by 1 after each loop.
do                                         # Start of the for loop.

    if [ $i -eq 3 ]                        # Check if the current value of i is equal to (eq) 3.
    then                                   # If the condition is true, execute the code below.
        break                              # Immediately exit the loop/take a break from the loop when i equals 3.
    fi                                     # End of the if statement.

    echo "Number: $i"                      # Print the current value of i (only if break wasn't triggered).

done                                       # End of the for loop.

# ================================================

# Start counting from 1.

# Is i equal to 3?

# No?
# Print the number.

# Increase i.

# Repeat.

# When i finally becomes 3...

# Stop the loop immediately.

# ===============================================

# What is the break?
# Think of break as an emergency exit.
# Normally a loop runs until its condition becomes false.
# But if you want to stop the loop before that happens, you can use break to exit the loop immediately.