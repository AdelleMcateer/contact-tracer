#!/bin/bash

#Author: Adelle McAteer
#Date: 01-Nov-2020
#Version: 1

#This script presents the user with the commnand line menu.

#CLear the screen of any previous input 
  clear

#Set the exit value for the Menu
  exit=0

#Use of a while loop to display and allow the user to 
#interact with the menu unil they choose to exit.
#THe menu contains access to all the shell scripts and the user can access
#by selecting the corresponding number.

  while [ $exit -ne 1 ]
    do
      echo -e "Welcome to the Covid-19 Contact Tracing app. \n"
      echo -e "Please choose one of the following options: \n"
      echo -e "\t1. Add a new contact \n "
      echo -e "\t2. Remove an existing contact \n"
      echo -e "\t3. Search for a contact \n"
      echo -e "\t4. E-mail a contact \n"
      echo -e "\t0. Exit the app \n"
      echo -n "Please enter one of the numbers above: "

#Takes the user selection and redirects to the desired script.
  read option

  case $option in

    1) ./AddContact.sh ;;

    2) ./Remove.sh ;;

    3) ./Search.sh ;;

    4) ./Email.sh ;;

    0) echo Exiting Contact Tracing app
       echo Goodbye
       sleep 3
       clear

  exit
  ;;

#Catch option to prompt the user if they enter anything other the 0-4
#Use of sleep for three seconds to pause the screen allow time to read the output
  *) echo "Invalid selection, please enter a number between 0-4 \n"
     sleep 3
     clear 
     ;;
  esac
  done
