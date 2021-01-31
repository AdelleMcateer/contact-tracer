#!/bin/bash

#Author:  Adelle McAteer
#Date: 01-Nov-2020
#Version: 1

#This file allows the user to email a contact or all stored contacts

#Clear the screen of any previous output
  clear 

#Set the exit clause to zero
  exit=0

#Use of a while loop to display and allow the user to 
#interact with the menu unil they choose to exit

  while [ $exit -ne 1 ]
    do
      echo -e "Please choose one of the following options: \n"
      echo -e "\t1. To e-mail all contacts \n "
      echo -e "\t2. To e-mail an individual contact \n"
      echo -e "\t0. Exit the app \n"
      echo -n "Please enter one of the numbers above: "

  read option

  case $option in

#Use of awk to obtain all emails then piped to an argumet to 
#allow it to be used as the email address.

    1) emailaddr=$(awk -F, '{print $4}' ContactDetails.csv | xargs) 
       echo -n "Please enter the subject: "
       read subject

       echo Please enter the message you wish to send.
       read message

       echo $message | mail -s $subject $emailaddr
       echo Email sent

       sleep 3
       clear
       ;;

    2) echo -n "Please enter the contact's email address: "
       read email

       echo -n "Please enter the subject: "
       read subject

       echo Please enter the message you wish to send.
       read message

       echo $message | mail -s $subject $email
       echo Email sent

       sleep 3
       clear
       ;;

    0) echo Exiting app...Goodbye
       sleep 2
       exit
       ;;

    *) echo Invalid selection, please enter a number between 0-4
       sleep 3
       clear
       ;;

  esac
  done
