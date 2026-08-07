#!/bin/bash                                  

greet_user() {                               # Create a function called 'greet_user'.

    echo "What is your name?"                # Display a message asking the user for their name.

    read name                                # Wait for the user to type their name and store it in the variable 'name'.

    echo "Hello, $name!"                     # Print "Hello," followed by the name the user entered.

}                                            # End of the function.

greet_user                                   # Call (run) the greet_user function.

# =============================================================
# this will have to be used via the terminal, as it will prompt the user for input.
# =============================================================

#Create a function called greet_user.
# When someone runs it...
# Ask them for their name.
# Wait until they type something.
# Save what they typed.
# Then say hello using that name.

# =============================================================

# What is read?
# This is the biggest new concept.
# read name
# means:
# Wait for the user to type something and store it in the variable called name.
# For example:
# What is your name?
# Sam
# Bash thinks:
# name="Sam"
# Now when it reaches:
# echo "Hello, $name!"
# it becomes:
# Hello, Sam!

# ============================================================

# Compare this to the previous function
# Previous lesson
# greet_person "Sam"
# You provided the value when calling the function.
# This lesson
# read name
# The function asks the user for the value while it's running.
# Both end up with a variable called name, but they get the value in different ways.

# =============================================================

# Syntax	        Meaning
# read name	        Wait for the user to type something and store it in the variable name.
# echo	            Display text on the screen.
# $name	            Retrieve the value stored in the variable name.
# greet_user	    Call (run) the function.