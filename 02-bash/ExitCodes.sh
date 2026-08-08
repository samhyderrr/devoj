#!/bin/bash

command -v git 2>/dev/null                                       # Check whether the 'git' command exists, and hide any error output.

if [[ $? -ne 0 ]]; then                                          # Check if the previous command's exit code is NOT equal to 0.
    echo "Error: Git is not installed. Please install Git to proceed." # Print an error message if Git wasn't found.
    exit 1                                                       # Stop the script and return exit code 1 to indicate failure.
else                                                             # Otherwise, the previous command succeeded.
    echo "Git is installed."                                     # Tell the user that Git was found.
fi                                                               # End the if/else statement.

# ===================================================================
# Exit codes are how commands tell Bash, CI/CD systems, and other programs whether they succeeded or failed.
# ===================================================================

# Number	Stream	    Meaning
#  0	    stdin	    Input
#  1	    stdout	    Normal output
#  2	    stderr	    Error output

# ==================================================================

#Exit code = message for the computer.
#echo = message for the human.

# ==================================================================

# 2>/dev/null

# means:

# "If there's error output, don't show it to me."

# The command can still fail. You're only hiding its error messages.

# That's important because:

# command -v git 2>/dev/null

# can still produce a non-zero exit code.

# So /dev/null does not mean:

# "Ignore the error."

# It means:

# "Don't display this output."

# Your script can still detect the failure using the exit code.