#!/bin/bash                                      

read_file() {                                     # Create a function called read_file.
    local file_path="$1"                          # Take the first argument ($1) and store it in file_path.

    while IFS= read -r line; do                   # Read the file one line at a time and store each line in 'line'.
        echo "$line"                              # Print the current line.
    done < "$file_path"                           # Feed the contents of the file into the while loop.
}

read_file "./log.txt"                             # Call the function and pass ./log.txt as the first argument ($1).

# ===========================================
# What is the purpose of this script?
# Open log.txt → read one line → print it → read the next line → print it → repeat until the file ends.
# ===========================================


# while IFS= read -r line; do

# IFS means Internal Field Separator, normally used when splitting text
# >    send output TO something
# <    take input FROM something

# done < "$file_path" = means the loop gets its input from the file.

# ============================================ 

# $1                   → first argument passed to function
# local                → variable limited to the function
# read                 → read input
# line                 → variable holding the current line
# <                    → take input from a file
# while                → repeat until there's nothing left to read