#!/bin/bash                                             

num1=10                                                  # Store 10 in the variable num1.
num2=0                                                   # Store 0 in the variable num2.

if [ $num2 -eq 0 ]; then                                 # Check if num2 is equal to 0.
    echo "Error: Division by zero is not allowed."       # Display a useful error message explaining the problem.
    exit 1                                               # Stop the script and return exit code 1 to indicate failure.
fi                                                       # End of the if statement.

result=$((num1 / num2))                                  # Divide num1 by num2 and store the answer in result.

echo "The result is: $result"                            # Print the result if the script successfully reached this point.

# ===========================================================================
# Error handling = anticipating things that could go wrong and deciding what the script should do when they happen
# Error handling = anticipate possible failures → detect them → explain what went wrong → respond appropriately (often stop safely with a non-zero exit code).
# ===========================================================================

# Script wants to do:

# 10 ÷ 0

# But division by zero isn't valid.

# Without your error handling, the script would reach:

# result=$((num1 / num2))

# and Bash itself would throw an error.

# Instead, you're checking for the problem before it happens:

# if [ $num2 -eq 0 ]; then

# In English:

# "Before I try this calculation, is the second number zero?"

# If yes:

# echo "Error: Division by zero is not allowed."
# exit 1

# The script explains the problem and stops.

# If no, Bash skips the if block and continues:

# result=$((num1 / num2))

# So you've basically created a safety check.