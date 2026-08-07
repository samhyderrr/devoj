#!/bin/bash                                

count=1                                    # Create a variable called 'count' and set its starting value to 1.

while true                                 # Keep looping forever because the condition 'true' is always true.
do                                         # Start of the while loop.

    echo "Count: $count"                   # Print the current value of count.

    ((count++))                            # Increase the value of count by 1.

    if [ $count -eq 4 ]; then              # Check if count is equal to (eq) 4.
        break                              # Exit the loop immediately if the condition is true.
    fi                                     # End of the if statement.

done                                       # End of the while loop.


# ================================================

# Start count at 1.

# Loop forever.

# Print the current count.

# Increase the count by 1.

# If the count has become 4...

# Stop the loop.

# Otherwise...

# Go back to the top and repeat.