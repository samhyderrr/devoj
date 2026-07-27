#!/bin/bash

score=85

if [ $score -ge 90 ]                            # check if score is greater than or equal to 90
then                                            # if the condition above is true then execute the code below
    echo "Excellent!"                           # print Excellent! to the terminal
elif [ $score -ge 80 ]                          # check if score is greater than or equal to 80 / or else if the first check failed, is it 80 or above
then                                            # if the condition above is true then execute the code below
    echo "Good job!"                            # print Good job! to the terminal
else                                            # if none of the above conditions are true / if non of the conditions are less than 80 then print below
    echo "Better luck next time!"               # print Better luck next time! to the terminal
fi





# ================================================================================================================================

# Layout below is a template for an else and elif statement in bash. You can use this as a starting point for your own scripts.

#if [ condition1 ]
#then
    # Code
#elif [ condition2 ]
#then
    # Code
#elif [ condition3 ]
#then
    # Code
#else
    # Runs if none of the above are true
#fi

# ================================================================================================================================


#Eq = equals
#Ne = not equal to
#Lt = less than
#Gt = greater than 
#Le = less than or equal to
#Ge = great than or equal to 
#&& = and
#|| = OR
# == and != are used for string comparison