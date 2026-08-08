#!/bin/bash                                      

my_home="$HOME"                                  # Store the HOME environment variable inside our own variable called my_home.
my_user="$USER"                                  # Store the USER environment variable inside our own variable called my_user.
my_os="$OSTYPE"                                  # Store the OSTYPE environment variable inside our own variable called my_os.

echo "Home Directory: $my_home"                  # Print the user's home directory.
echo "Current User: $my_user"                    # Print the currently logged-in username.
echo "OS Type: $my_os"                           # Print the operating system type.