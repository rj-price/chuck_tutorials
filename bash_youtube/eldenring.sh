#!/bin/bash

#echo "You Died"

# Conditionals
<<comment
echo "Hey, do you like coffee? (y/n)"
read coffee

if [[ $coffee == "y" ]]; then
    echo "You're awesome!"
else
    echo "Leave right now!!!"
fi
comment

# First beast battle 

beast=$(($RANDOM % 2))

echo "Your first beast approaches. Prepare to battle. Pick a number between 0-1."

read tarnished

sleep 1

if [[ $beast == $tarnished ]]; then
    echo "Beast VANQUISHED!! Congrats fellow tarnished."
else
    echo "You Died"
fi
