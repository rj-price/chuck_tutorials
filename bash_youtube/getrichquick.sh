#!/bin/bash

echo "What is your name?"
read name

echo "How old are you?"
read age

echo "Hello $name, you are $age years old."

# Environemental variables
: '
echo $PWD
echo $SHELL
echo $USER
echo $LOCALHOST
'

# Create own environmental variables
: '
To create your own environmental variables, add the following to .bashrc:

export var="Some Text"

'

# Perform simple maths
: '
To perform simple maths in command line:

echo $(( 3 + 4 ))
echo $(( 3 * 4 ))
echo $(( 3 / 4 ))
echo $(( 3 % 4 ))

'

sleep 1

echo " "
echo "Calculating"
echo ".........."
sleep 1
echo "**........"
sleep 1
echo "****......"
sleep 1
echo "******...."
sleep 1
echo "********.."
sleep 1
echo "**********"
echo " "
sleep 1

getrich=$(( ($RANDOM % 15 ) + $age ))
echo "$name, you'll be a millionaire at age $getrich."