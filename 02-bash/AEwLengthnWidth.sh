#!/bin/bash                                  

length=5                                     # variable 1
width=8                                      # variable 2             

area=$((length * width))                     # Calculate length x width
perimeter=$((2 * (length + width)))          # Calculate 2 x (length + width)

echo "Rectangle Area: $area"                 # print the area of the rectangle (area)
echo "Rectangle Perimeter: $perimeter"       # print the perimeter of the rectangle (perimeter)


#$(( )) = Tells Bash to calculate what's inside.
#Normal Brackets = (length + width) = Tell Bash to calculate this part first, just like on a calculator.

# Always start with $(( and end with )) for arithmetic expansion.
# Add normal ( ) inside only when you want a calculation to happen first.

#$(( ))  = Tell Bash to calculate this.
#( )     = Tell Bash which part of the maths to do first.