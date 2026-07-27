#!/bin/bash

num1=5                                                  # variable 1
num2=10                                                 # variable 2

result=$((num1 + num2))                                 # calculate num1 + num2 and store the answer in result

echo "The sum of $num1 and $num2 is: $result"           # print the values and the caculated result


#$(( )) = Tells Bash to calculate what's inside.
#Normal Brackets = (length + width) = Tell Bash to calculate this part first, just like on a calculator.

# Always start with $(( and end with )) for arithmetic expansion.
# Add normal ( ) inside only when you want a calculation to happen first.

#$(( ))  = Tell Bash to calculate this.
#( )     = Tell Bash which part of the maths to do first.