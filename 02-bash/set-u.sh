#!/bin/bash                                  

set -u                                       # Stop the script if an undefined/unset variable is used.

X=10                                         # Create variable X and give it the value 10.
Y=20                                         # Create variable Y and give it the value 20.

Z=$((X + Y + W))                             # Try to add X, Y and W together, but W has never been defined.

echo "Z equals: $Z"                          # Print Z, but this line won't be reached because the script stops at W.                      


# ========================================================================
# set -u = Stop the script if an undefined/unset variable is used.
# set -u = Dont let undefined varibles go unnoticed, it will stop the script and throw an error.
# ========================================================================

# Bash gets here:

#X=10
#Y=20

#So it knows:

#X = 10 ✅
#Y = 20 ✅

#Then:

#Z=$((X + Y + W))

#Bash checks:

#X → defined ✅
#Y → defined ✅
#W → defined? ❌

#Because you enabled:

#set -u

#Bash essentially says:

#"W hasn't been defined. I'm stopping the script."

#You'll get an error similar to:

#W: unbound variable

#And this:

#echo "Z equals: $Z"

#never runs.