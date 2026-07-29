#!/bin/bash

count=1                             # Variable 

while [ $count -le 5 ]              # repeat the loop while count is less than or equal to 5
do                                  # start of the while loop
    echo "Count: $count"            # print the value of count
    ((count++))                     # increase (increment) the value of count by 1
done                                # end of the while loop







# ===================================================

# Format of While loop below

# #!bin/bash 

# while condition
# do
    # code to be executed
#done
# ===================================================

# notes below

# ((count++)) = increase count by 1 
# an alernative way to write this is ((count = count + 1)) or ((count += 1))
# ++ = increment operator/ add 1 to the variable

# another example to understand the syntax below:
# count = 1
# ((count++))
# echo $count
# then the output should be 2 

# each time the loop runs, it will add 1, hence the output of the top script being 1 to 5 
# if the loop went to 6 then the conidition becomes false so it would stop
# as long as the condition is true, it will keep looping
# if you want to add by more than 1 then change the number, so line 8 should look like this if I wanted to add by 2 and not 1 = ((count += 2))
# if I wanted to subtract then I would change the + for a - e.g. = ((count -= 1))

# =================================================================================================================================================

# Operator	    Meaning	        Example	                Result      (if count=5)
# ++	        Add 1	        ((count++))	             6
# --	        Subtract 1	    ((count--))	             4
# += 2	        Add 2	        ((count += 2))	         7
# -= 3	        Subtract 3	    ((count -= 3))	         2
# *= 2	        Multiply by 2	((count *= 2))	         10
# /= 5	        Divide by 5	    ((count /= 5))	         1