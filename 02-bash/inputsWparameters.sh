#!/bin/bash                                     

greet() {                                      # Create a function called 'greet'.

    local name                                 # Create a local variable called 'name'.

    if [ $# -eq 0 ]; then                      # If no arguments were passed into the function...
        echo "What is your name?"              # Ask the user for their name.
        read name                              # Read the user's input and store it in 'name'.
    else                                       # Otherwise...
        name="$1"                              # Store the first argument in the variable 'name'.
    fi                                         # End of the if statement.

    echo "Hello, $name!"                       # Print "Hello," followed by the value stored in 'name'.

}                                              # End of the function.

greet                                          # Call the function without any arguments.

# =============================================================
# Create a function called greet.
# If nobody gave me a name...
# Ask the user for one.
# Otherwise...
# Use the name they gave me.
# Finally...
# Say hello using that name.
# =============================================================

# So the difference between this function and the previous one is that this one can get the name in two different ways.
# This one is better because its more flexible, meaning that if I had a name after the function name, it would use that name instead of asking the user for one.
# on the other hand, if I didn't have a name after the function name, it would ask the user for one.

# ============================================================