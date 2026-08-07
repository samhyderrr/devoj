#!/bin/bash                               

hello_world() {                           # Create (define) a function called 'hello_world'.
    echo "Hello, World!"                  # Print "Hello, World!" when the function is called.
}                                         # End of the function definition.

hello_world                              # Call (run) the function named 'hello_world'. / can also think of it like the echo command in this instance.


# ===============================================

# Syntax	        Meaning
# hello_world()	    Define a function named hello_world.
# { }	            The code that belongs to the function.
# hello_world	    Call (run) the function.

#  ==============================================

# Think of a function like a button
# When you press the button, it does something. In this case, it prints "Hello, World!" to the screen.
# snake_case is when all letters are lowercase and words are separated by underscores. This is a common naming convention for functions in Bash.