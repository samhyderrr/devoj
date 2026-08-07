#!/bin/bash                                

for (( i=1; i<=5; i++ ))                   # Start a for loop: begin with i=1, keep looping while i is less than or equal to 5, and increase i by 1 after each loop.
do                                         # Start of the for loop.
    echo "Number: $i"                      # Print the current value of the variable i.
done                                       # End of the for loop.



# =================================================


#!/bin/bash


#for variable in sequence
#do
# code block to be exectued
#done

# ===================================================

# Breaking down the for (( i=1; i<=5; i++ ))

# Part	    Meaning	            In English
# i=1	    Initialisation	    Start i at 1.
# i<=5	    Condition	        Keep looping while i is less than or equal to 5.
# i++	    Increment	        Add 1 to i after each loop.

# So Bash reads it like this:
# Start with i = 1. While i is less than or equal to 5, print the number, then increase i by 1.

# ====================================================

# i = 1
# │
# ├── Is 1 <= 5? ✅ Yes
# │   Print: Number: 1
# │   i becomes 2
# │
# ├── Is 2 <= 5? ✅ Yes
# │   Print: Number: 2
# │   i becomes 3
# │
# ├── Is 3 <= 5? ✅ Yes
# │   Print: Number: 3
# │   i becomes 4
# │
# ├── Is 4 <= 5? ✅ Yes
# │   Print: Number: 4
# │   i becomes 5
# │
# ├── Is 5 <= 5? ✅ Yes
# │   Print: Number: 5
# │   i becomes 6
# │
# └── Is 6 <= 5? ❌ No
#     Loop ends.