#!/bin/bash

# TO DO:
#! Wrap whole game in while loop to allow player to continue
#! Add in hp and attack attributes to battles
#! Develop story

# Welcome

echo "                                    ▄▄                                            "
echo "▀████▀                             ▄██                                            "
echo "  ██                                ██                                            "
echo "  ██       ▄██▀██▄▀███▄███  ▄▄█▀██  ██▄████▄   ▄██▀██▄▀███▄███▀████████▄   ▄▄█▀██ "
echo "  ██      ██▀   ▀██ ██▀ ▀▀ ▄█▀   ██ ██    ▀██ ██▀   ▀██ ██▀ ▀▀  ██    ██  ▄█▀   ██"
echo "  ██     ▄██     ██ ██     ██▀▀▀▀▀▀ ██     ██ ██     ██ ██      ██    ██  ██▀▀▀▀▀▀"
echo "  ██    ▄███▄   ▄██ ██     ██▄    ▄ ██▄   ▄██ ██▄   ▄██ ██      ██    ██  ██▄    ▄"
echo "██████████ ▀█████▀▄████▄    ▀█████▀ █▀█████▀   ▀█████▀▄████▄  ▄████  ████▄ ▀█████▀"
echo "                                                                                  "

echo "Welcome traveller. Please select your starting class:
1 - Knight
2 - Hunter
3 - Thief"

read class

case $class in 

    1)
        type="Knight"
        hp=10
        attack=20
        ;;
    2)
        type="Hunter"
        hp=15
        attack=15
        ;;
    3)
        type="Thief"
        hp=20
        attack=10
        ;;
esac

echo -e "Hello, $type. Your hp is $hp and your attack is $attack.\n"

echo "Story type stuff goes here..."

sleep 2

# First beast battle 
beast_hp=30
beast_attack=1

echo "Your first beast approaches."

while [ $beast_hp -gt 0 ];
do
    echo "Will you attack? (y/n)"
    read action
    if [[ $action == "y" ]]; then
        echo "You attack fiercely and injure the beast."
        beast_hp=$(( $beast_hp - $attack ))
    else
        echo "The beast lashes out at you. (hp-1)"
        hp=$(( $hp - $beast_attack ))

    echo "The beast's hp is $beast_hp, your hp is $hp."

done

echo "Beast VANQUISHED!! Congratulations traveller."


echo ""
sleep 2

echo "You walk further along the path towards the deserted village."
sleep 3

echo "You've reached the village square. It's eerily quiet..."
sleep 2

echo "......"
sleep 2

echo "An eldritch creature emerges, with enormous tattered wings and a demonic look."
sleep 2

echo "It's boss battle time. Get scared. Pick an integer from 0 to 9. (0-9)"
read tarnished

beast_hp=30
beast_attack=1


if [[ $beast == $tarnished ]]; then
    echo "Beast VANQUISHED!! Congrats fellow tarnished."
else
    echo "You Died"
    exit 1
fi