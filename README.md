# contact-tracer

# Overview 
A menu driven shell program to allow Covid-19 contact tracing

## Description

A Linux-based software tool that will assist the hospitality industry 
to keep track of all of its contacts (i.e. customer details).

A "menu driven" shell program that allows the user to interactively update (i.e.
add, remove), search and list all their customer information, which is stored 
locally in a file called ContactDetails.

1. The first script called AddContact, is a standalone script that will update
the system (the file with the stored details) with a contacts details.

2. The second script called Remove will remove all of a contacts information from
the system based on a particular contacts name or alias.

3. The Search script allows the user to search for an existing contact based upon
any of that contacts personal information.

4. The final script is the Menu script.

This script presents the user with a command line menu. 

This menu allows the user to select from any of the shell scripts
(i.e. AddContact, Remove and Search) and a fourth feature allows
the user to e-mail any or all the customers listed in the address book.
