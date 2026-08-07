#!/bin/bash                                  


fruits=("apple" "banana" "orange")           # Create an array called 'fruits' containing three values.

for fruit in "${fruits[@]}"                  # For each item in the fruits array, store it in the variable 'fruit'.
do                                           # Start of the for loop.
    echo "Fruit: $fruit"                     # Print the current fruit stored in the variable 'fruit'.
done                                         # End of the for loop.


# ===================================================

# Take the first fruit.
# Store it in the variable "fruit".
# Run the code.

# Take the second fruit.
# Store it in the variable "fruit".
# Run the code.

# Take the third fruit.
# Store it in the variable "fruit".
# Run the code.

# No more fruits?
# Stop.

# ===================================================

# the @ symbol is used to represent all the elements in the array.
# { } = This tells bash that the entire expression inside the brackets is a single entity, meaning whats within the brackets is 1 varibale not 3.

# ==================================================

# Syntax	        Meaning
# ${fruits[0]}	    First item (apple)
# ${fruits[1]}	    Second item (banana)
# ${fruits[2]}	    Third item (orange)
# ${fruits[@]}	    All items in the array
# ${#fruits[@]}	    Number of items in the array
# "${fruits[@]}"    All items, with each element preserved as a single value (recommended)

# ================================================

# array → the array's name
# @ → all elements
# ${} → expand the array
# "" → keep each element together if it contains spaces