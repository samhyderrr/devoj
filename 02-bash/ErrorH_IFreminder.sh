#!/bin/bash                                      

FILE="/nonexistent"                              # Create a variable called FILE and store the file path "/nonexistent".

if [[ -f "$FILE" ]]; then                        # Check if FILE exists AND is a regular file.
    echo "File exists."                          # Run this if the condition is TRUE.
else                                             # Run the following code if the condition is FALSE.
    echo "Error: File does not exist."           # Print an error message because the file wasn't found.
fi                                               # End the if/else statement.

# ====================================================================
# Check	        Meaning
# -f	        Exists and is a regular file
# -d	        Exists and is a directory
# -e	        Exists (file, directory, etc.)
# -r	        Exists and is readable
# -w	        Exists and is writable
# -x	        Exists and is executable