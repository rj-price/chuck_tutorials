#!/bin/bash

echo "What is your name?"
read name

echo "How old are you?"
read age

echo "Hello $name, you are $age years old."

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

sleep 2

getrich=$(( ($RANDOM % 15 ) + $age ))
echo "You'll be a millionaire at $getrich."