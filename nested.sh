#!/bin/bash

# variables to store student information

age=18     # store the students age
grade=80     # store the students grade

#first if statement to check if the student is eligible based on age

if [ $age -gt 18 ]; then    # check if age is greater than 18
    echo "You are eligible based on age."

    #nested if statement and will only run if the age is greater than 18

    if [ $grade -ge 80 ]; then      # is grade greater than or equal to 80
        echo "You are also eligible based on grade."
        echo "Congratulations!"
    else    # grade is less than 80
        echo "However, your grade is below the required threshold."
    fi  #end nested if statement
else    #age was NOT greater than 18
    echo "You are not eligible based on age."   
fi      # end first if statement
