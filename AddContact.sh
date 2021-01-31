#!/bin/bash

#Author:  Adelle McAteer
#Date: 01-Nov-2020
#Version: 1

#When the user selects Add Contact from the menu they are directed to this script.
#The script allows the user to add contact details.

#Clear the screen of any previous output

  clear

#Ask the user for the contact name

  echo -n  "Please enter the contact's first and last name: "
  read name

#While loop for validation purposes until a valid format is entered
#Spaces and letters only

  until [[ "$name" =~ ^[a-zA-Z]+$* ]]
    do
      echo "Invalid entry, please use letters and spaces only"
      echo -n "Please enter the name: "
    read name
  done

#Ask the user for the contact's address.

  echo -n  "Please enter contact's Address: "
  read address

#While loop for validation pruposes until a valid format is entered
#Numbers, spaces and letters only permitted

  until [[ "$address" =~ ^[0-9a-zA-Z]+$* ]]
    do
      echo "Invalid entry, please use numbers, letters and spaces only"
      echo -n "Please enter the customer address: "
    read address
  done

#Ask the user for the contact's mobile number.

  echo -n "Please enter the mobile number: "
  read number

#While loop for validation pruposes, should contain 10 numbers

  until [[ $number =~ ^[0-9]+$ ]] 
    do
      echo "Invalid entry, please enter numbers only"
      echo -n "Please enter the mobile number: "
    read number
  done

#Ask the user for the customer email address. 

  echo -n "Please enter the contact's email address: "
  read email

#While loop for validation pruposes, should contain an @ and a.
  while  [[ "$email" != ?*@*.?* ]]
    do
      echo  "Invalid entry"
      echo  "Correct format: xxx@xxx.xxx"
      echo -n "Please enter the email address: "
    read email
  done

#Verification before the user adds the details to the text file

  echo "Please review and confirm if the details below should be added?" 
  echo -e "\t$name \t$address \t$number \t$email"
  echo -n "Y/N: "
  read response

#If Yy selected the details are appended to the ContactDetails file
#If the file does not exist it will be created

#If statement to ignore the case entry

  if [[ "$response" = [Yy] ]]
    then 
    echo $name, $address, $number, $email >> ContactDetails.csv
    echo "Entry added to Contact Tracing"
    echo "Returning to the Main Menu"

#pauses to give user a chance to read the screen
    sleep 4

#If Nn is selected the values are discarded
    else [[ "$response" = [Nn] ]]
    echo "Entry not added to Contact Details"
    echo "Returning to the Main Menu"

#pauses to give user a chance to read output
    sleep 4
  fi
  clear

#Exit to main menu
  exit
  
