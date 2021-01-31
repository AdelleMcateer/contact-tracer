#!/bin/bash
#Author:  Adelle McAteer
#Date: 01-Nov-2020
#Version: 1

#This file allows the user to remove contact information
#from the ContactDetails.csv.
#A search option is included to allow the user to search 
#first and review the contacts before deletion.

#CLear the screen of any previous output
  clear

#Set the exit clause to zero for use within a loop
  exit=0

#Use of a while loop to display the options
#until the user enters 0 to exit the menu.

  while [ $exit -ne 1 ]
    do
      echo -e "\n"
      echo -e "Please select one of the following otpions:\n"
      echo -e "\t1. View a list of all contacts currently stored \n"
      echo -e "\t2. Remove a contact by line number \n"
      echo -e "\t0. Exit \n"
      echo -n "Please enter a number: "

      read option

    case "$option" in

#Use of awk to retrieve and print out all contacts stored in the text file.
#Allows the user to view all contacts by line number before deleting.

    1) awk '{print NR, $0}' ContactDetails.csv ;;

#Ask the user for the corresponding line number for the contact they 
#wish to delete.

    2) echo -n "Please enter the line number of the contact you would you like to delete: "
       read number

       echo -e "Should the contact on line nmuber '$number' be deleted? "
       echo -n "Y/N: "
       read response

#If Yy selected the details are passed using sed and the contact is deleted

    if [[ "$response" = [Yy] ]]
      then 
        sed -i "${number}"d ContactDetails.csv
        echo "Contact removed"

#Pause the screen to allow the user to read the information
    sleep 3

#If Nn is selected the action is cancelled

     else  [[ "$response" = [Nn] ]]
     echo "Contact not removed"

#Pause the screen to allow the user to read the information
    sleep 3
    fi
    clear
    ;;

#The user can return to the Main Menu by pressing zero

    0) echo "Returning to the main menu."
       sleep 2
       clear
       exit
       ;;

#Validation for invalid entries. User will be asked to try again.
    *) echo "Invalid entry, please try again"
       sleep 2
       clear
       ;;
    esac
    done
