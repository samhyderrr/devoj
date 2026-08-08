#!/bin/bash                                    

echo "Executable Paths: $PATH"                   # Display the directories Bash searches when looking for commands/programs.
echo "Default Language: $LANG"                   # Display the system/shell language and locale setting.

# ======================================================

# What exactly is $PATH?

# $PATH tells Linux:

# "These are the directories I should search when someone types a command."

# $PATH itself isn't a command saying "look through." It's a list of directories Bash is told to look through when you type a command.

# $PATH = a list of directories Bash looks through to find commands/executables.

# =====================================================

# Why do you think you're allowed to type simply: git

# instead of: /usr/bin/git

# Because $PATH contains /usr/bin, Bash searches /usr/bin for an executable called git, finds /usr/bin/git, and runs it.