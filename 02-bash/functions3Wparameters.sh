#!/bin/bash                                     

print_args() {                                  # Create a function called 'print_args'.

    echo "Number of arguments: $#"              # Print how many arguments were passed into the function.
    echo "Script name: $0"                      # Print the name/path of the script that is running.
    echo "First argument: $1"                   # Print the first argument passed into the function.
    echo "Second argument: $2"                  # Print the second argument passed into the function.
    echo "Third argument: $3"                   # Print the third argument passed into the function.
    echo "All arguments: $@"                    # Print every argument passed into the function.

}                                               # End of the function.

print_args  "Sam" "John" "Doe"                   # Call the function and pass three arguments: Sam, John and Doe.

# =============================================================

# Syntax	    Meaning
# $0	        Script name
# $1	        First argument
# $2	        Second argument
# $3	        Third argument
# $#	        Number of arguments
# $@	        All arguments

# =============================================================