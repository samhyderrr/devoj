#!/bin/bash

#!/bin/bash                                                # Run this script using the Bash shell.

echo "===== PIPE EXAMPLES ====="                           # Print a title.

echo                                                       # Print a blank line.

echo "Example 1 - List Bash scripts"                       # Explain the example.
ls | grep ".sh"                                            # List files, then only show those containing ".sh".

echo                                                       # Blank line.

echo "Example 2 - Count files in this directory"           # Explain the example.
ls | wc -l                                                 # List files, then count how many lines (files) there are.

echo                                                       # Blank line.

echo "Example 3 - Show current user"                       # Explain the example.
whoami | tr 'a-z' 'A-Z'                                    # Show the current user, then convert it to uppercase.

echo                                                       # Blank line.

echo "Example 4 - Sort a list"                             # Explain the example.
printf "banana\napple\norange\n" | sort                    # Send a list through the pipe, then sort it alphabetically.

echo                                                       # Blank line.

echo "Example 5 - Count words"                             # Explain the example.
echo "Linux is awesome" | wc -w                            # Send the sentence to wc, then count the words.

echo                                                       # Blank line.

echo "Example 6 - Find a specific fruit"                   # Explain the example.
printf "apple\nbanana\norange\n" | grep "banana"           # Send the list through the pipe, then only display banana.

echo                                                       # Blank line.

echo "Finished!"                                           # End of the script.

# =================================================
# A pipe (|) takes the output of the command on the left and uses it as the input for the command on the right.
# =================================================

# example of pipe command 

# ls | grep ".sh"

# Run ls

#↓

#script.sh
#notes.txt
#music.mp3
#photo.jpg

#↓

#Pass ALL of that to grep

#↓

#grep searches for ".sh"

#↓

#Output
#script.sh

# =================================================

#For example:

# cat logfile.txt | grep ERROR | sort | uniq | wc -l

# Think of it in English:

# Read the log

# ↓

# Find ERROR lines

# ↓

# Sort them

# ↓

# Remove duplicates

# ↓

# Count them

# Each command does one job.

# The pipe glues them together.