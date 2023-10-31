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

sleep 1

echo "You walk further along the path towards the deserted village."
sleep 2

echo "You've reached the village square. It's eerily quiet..."
sleep 1

echo "An eldritch creature emerges, with enormous tattered wings and a demonic look."
sleep 1

echo "It's boss battle time. Get scared. Pick a number between 0-9."
read tarnished

beast=$(( $RANDOM $ 10 ))

if [[ $beast == $tarnished ]]; then
    echo "Beast VANQUISHED!! Congrats fellow tarnished."
else
    echo "You Died"
fi