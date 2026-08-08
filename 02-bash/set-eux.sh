#!/bin/bash

set -eux                                         # Enable -e (exit on failure), -u (error on unset variables), and -x (show commands being executed).

echo "This is a test."                           # Print "This is a test." while tracing shows the command being executed.

X=10                                             # Create variable X and give it the value 10.

echo "The value of X is: $X"                     # Print the value stored in X.

nonexistentcommand                               # This command does not exist, so it fails and -e causes the script to stop.










# ==========================================================================
# Command	    Think	            What it does
# set -e	    Error	            Stop on an unhandled command failure
# set -u	    Unset	            Stop when using an unset variable
# set -x	    eXamine	            Show commands being executed
# set +x	    Stop examining	    Turn tracing off