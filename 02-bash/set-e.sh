#!/bin/bash                             

set -e                                   # Exit the script when an unhandled command fails (returns a non-zero exit status).

echo "before the script"                 # Print this message before attempting the next command.

nonexistentcommand                       # Try to run a command that doesn't exist, which will fail and return a non-zero exit code.

echo "after the script"                  # This will NOT run because set -e causes the script to stop after the failed command.

# =========================================================
# -e = exit on error
# Basically saying, "If an unhandled command fails, stop the script immediately."
# set -e = automatically stop the script when an unhandled command fails, instead of continuing and potentially causing further problems.
# ========================================================

# Command failed
#      ↓
#Non-zero exit code
#      ↓
#set -e is enabled
#      ↓
#STOP SCRIPT 