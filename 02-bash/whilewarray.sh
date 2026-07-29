#!/bin/bash

fruits=("apple" "banana" "orange")                  # This is an array. an array allows you to store multple values in a single variable.
index=0                                             # variable. it will start at 0 which is the first position in the array

while [ $index -lt ${#fruits[@]} ]                  # keep looping while the index is less than the number of items in the array
do                                                  # start of the while loop
    echo "Fruit: ${fruits[$index]}"                 # print the fruit stored at the current index position
    ((index++))                                     # increase the index by 1 so the next fruit is accessed
done                                                # end of the while loop


# ============================================================================================================================================
# What is an array? 
# think of a normal variable, e.g. name=sam
# the variable name can only hold one value
# an array on the other hand, can hold multiple values
# ============================================================================================================================================
# why did we use the @ sign?
# the @ in ${fruits[@]} = give me every item in this array, without the @, bash doesn't know that you want the whole array
# ============================================================================================================================================
# why do we use curly braces?
# curly braces tell bash that everything inside belongs to this variable. e.g. below
# name=sam
# echo $sam
# this will work if you run the code BUT what if you want to echo sam123
# if you write echo $name123 = bash thinks the variable is called name123 which don't exist, instead 
# echo ${name}123 = bash now knows that variable = name and then print 123. this will make the output sam123
# ============================================================================================================================================
#Syntax	            Meaning
#()	                Create an array or group commands.
#[]	                Access an item in an array or test a condition.
#${}	            Expand (retrieve) the value of a variable or array.
#@	                All items in an array.
#	                Length (number of items in an array, or number of characters in a string).
#(( ))	            Perform arithmetic (add, subtract, multiply, etc.).
#++	                Increase a number by 1.
# ============================================================================================================================================
# Is 0 < 3? → Yes → Print apple → index = 1
# Is 1 < 3? → Yes → Print banana → index = 2
# Is 2 < 3? → Yes → Print orange → index = 3
# Is 3 < 3? → No → Stop the loop.