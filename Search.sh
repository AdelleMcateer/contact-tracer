#!/bin/bash

#Author: Adelle McAteer
#Date: 01-Nov-2020
#Version: 1

#This script allows the user to search for an existing contact based
#on any of the contacts personal information

#Clear the screen of any previous output
  clear

#Set the exit value to allow the user to return to the main menu
  exit=0

#Use of a while loop to display a search menu and allow the user
#to search using a variety of criteria until the choose to exit

  while [ $exit -ne 1 ]
    do
      echo -e "Please choose a search option: \n "
      echo -e "\t1. Search by name (first and/or last) \n"
      echo -e "\t2. Search by address \n"
      echo -e "\t3. Search by telephone number \n"
      echo -e "\t4. Search by email address \n"
      echo -e "\t0. Exit to the main menu \n"
      echo -n "Please enter a number: "

    read input

    case "$input" in

      1) echo -n "Please enter a name (partial or full): "
         read name

#Use of awk to search the csv file for the name and print with the line number

         awk -v name="$name" '$1 ~ name' ContactDetails.csv | nl | awk '{print $0}'
         sleep 5
         ;;

      2) echo -n "Please enter an address: "
         read address

#use of grep to search for the address input and output the line number

          grep -i $address ContactDetails.csv | nl
          sleep 5
          ;;

       3) echo -n "Please enter a telpehone number: "
          read number

          grep -i $number ContactDetails.csv | nl
          sleep 5
          ;;

       4) echo -n "Please enter an email address: "
          read email

          grep -i $email ContactDetails.csv | nl
          sleep 5
          ;;

 #The user can return to the Main Menu by pressing zero
       0) echo "Returning to the main menu."
          sleep 2
          clear
          exit
          ;;

#Validation for invalid entries. User will be asked to try again.

      *) echo -n "Invalid entry, please try again: "
         sleep 2
         clear
          ;;
    esac
    done
