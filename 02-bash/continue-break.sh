#!/bin/bash                                

for (( i=1; i<=5; i++ ))                   # Start i at 1, keep looping while i is less than or equal to 5, and increase i by 1 after each loop.
do                                         # Start of the for loop.

    if [ $i -eq 3 ]                        # Check if the current value of i is equal to (eq) 3.
    then                                   # If the condition is true, execute the code below.
        continue                           # Skip the rest of this loop iteration and move straight to the next one.
    fi                                     # End of the if statement.

    echo "Number: $i"                      # Print the current value of i (unless continue was triggered).

done                                       # End of the for loop.

# ================================================

# Start counting from 1.

# If the number is 3...

# Don't print it.

# Instead, skip straight to the next number.

# Keep repeating until you reach 5.

# ===============================================

# continue says:

# "Skip the rest of this iteration, but keep looping."

# The loop isn't finished—it just ignores the remaining code for the current value.

# ===============================================

# more easy ways to remember

# break

# Room 1 ✅
# Room 2 ✅
# Room 3 🚪 Exit the building

# Rooms 4 and 5 are never visited.

# ===============================================

# Continue 

# Room 1 ✅
# Room 2 ✅
# Room 3 🙈 Skip this room
# Room 4 ✅
# Room 5 ✅