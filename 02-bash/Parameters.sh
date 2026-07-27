#!/bin/bash

echo "Parameter 1: $1"      # Print the first parameter passed to the script
echo "Parameter 2: $2"      # Print the second parameter passed to the script
echo "Parameter 3: $3"      # Print the third parameter passed to the script
echo "All Parameters: $@"   # Print all parameters passed to the script



# So this specific one works differently from the last, meaning that if I were to run this script, it won't actually echo anything
# to run the script, I would have to use the terminal whilst in vscode, I can't just hit play.
# Once I run the script, I will need to pass the script variables so the parameters can be echoed
# So it should look something like this = ./script.sh test1 test2 test3
# After that, it will print the parameters that I passed to the script, so in this case it would print test1, test2, and test3
# ====================================================================================================================================
# On the other hand, with All Paramenters, it will print all the parameters that I passed to the script
# Meaning that if I were to run the script like this = ./script.sh test1 test2 test3 test4 test5
# It would print all of the parameters that I passed to the script, so in this case it would print test1, test2, test3, test4, and test5
# =====================================================================================================================================
# Without the all parameters variable, it would only print as many parameters as I specified in the script, so in this case it would only print test1, test2, and test3
