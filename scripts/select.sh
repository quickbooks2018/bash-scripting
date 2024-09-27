#!/bin/bash
# Purpose: Select from a list of options
# In Linux and Unix-like systems, the PS3 variable is used to customize the prompt in a select loop. When you use a select statement to create a menu for the user to choose from, the PS3 variable defines the prompt displayed to the user when they're asked to make a selection.


options=("Option 1" "Option 2" "Option 3" "Quit")
PS3="Please select an option: "  # Setting PS3 to customize the prompt message

select i in "${options[@]}"
do

  if [ "$i" = "Option 1" ]
  then
    echo "Hello Asim"
    continue
  elif [ "$i" = "Option 2" ]
  then
    echo "Hello Qasim"
    continue
  elif [ "$i" = "Option 3" ]
  then
    echo "Hello Taha"
    continue
  elif [ "$i" = "Quit" ]
  then
    echo "Quitting"
    break
  fi


done



#End