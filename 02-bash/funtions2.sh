#!/bin/bash                                 

hello_world() {                             # Create a function called 'hello_world'.
    echo "Hello, World!"                    # Print "Hello, World!" when this function is called.
}                                           # End of the hello_world function.

greet_person() {                            # Create a function called 'greet_person'.

    local name="$1"                         # Create a local variable called 'name' and assign it the first argument passed into the function.

    echo "Hello, $name!"                    # Print "Hello," followed by the value stored in 'name'.

}                                           # End of the greet_person function.

greet_person "Sam"                          # Call the function and pass "Sam" as the first argument.
greet_person "Alex"                         # Call the function again and pass "Alex" as the first argument.


# =============================================================

# Create a function called greet_person.

# Whenever someone runs this function,

# take the first piece of information they give you,

# store it in a variable called name,

# then say hello to that person.

# =============================================================

# local name="$1"

#Let's break this apart.

# local

# This means:

# This variable only exists inside this function.

# Once the function finishes, Bash forgets about it.

# Think of it like a whiteboard inside one meeting room.

# When the meeting ends...

# The whiteboard gets wiped clean.

# the name bit dosent matter, it could be anything, but we are using name because it makes sense.

# ========================================================================

# Imagine:

# greet_person "Sam"

# Bash thinks:

# $1 = Sam

# So this line becomes:

# local name="Sam"

# ==================================================================================

# Syntax	                    Meaning
# local	                        Variable only exists inside the function.
# name	                        The variable's name.
# $1	                        The first value passed into the function.
# greet_person "Sam"	        Call the function and pass "Sam" as the first argument.
# $name	                        Use the value stored in the variable.