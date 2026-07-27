#!/bin/bash

length="$1"                                                             # get the first argument passed to the script (length)
width="$2"                                                              # get the second argument passed to the script (width)

area=$((length * width))                                                # calculate the area of the rectangle (area)
perimeter=$((2 * (length + width)))                                     # calculate the perimeter of the rectangle

echo "Rectangle area: $area"                                            # print the area of the rectangle (area)
echo "Rectangle perimeter: $perimeter"                                  # print the perimeter of the rectangle (perimeter)

# So with normal parameters where I need to input the variable after running the script
# this works the same way, where insetad of giving it a fixed number to calculate as the variable
# I will need to insert the variable after running the script, so it would look something like this = ./script.sh 5 8
# after that, it will give me the result of the sum 