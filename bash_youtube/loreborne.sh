#!/bin/bash

# TO DO:
# Intro to game ("Welcome to Loreborne, a game ...").
# Add "Press ENTER to continue" sections.
#! Wrap whole game in while loop to allow player to continue
#! Add random chance of retaliation after attack
#! Add in damage multiplier if chose not to attack, but include option to heal
#Add in hp and attack attributes to battles
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

echo -e "In the world of Loreborne, an ancient evil plagues the land. Eldritch terrors roam
the deserted villages, looking for their next victim. A lone traveller seeks revenge...\n"

read -p "Press ENTER to start..."

echo ""

echo -e "You enter a tavern in one of the few populated villages. The handful of patrons turn
from their tankards and eye you with suspicion.You approach the bar with caution...\n"

echo "BAR KEEP: Welcome traveller. Please select your starting class:
1 - Knight (HP: 10, ATTACK: 20)
2 - Hunter (HP: 15, ATTACK: 15)
3 - Thief (HP: 20, ATTACK: 10)" 

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

echo -e "Hello, $type. Your HP is $hp and your ATTACK is $attack.\n"

sleep 2

read -p "Press ENTER to leave the tavern and continue on your travels..."
echo ""
sleep 2

# First beast battle 
beast_hp=30
beast_attack=1

echo "As you walk from the village, an eerie feeling of foreboading settles upon you."
sleep 2
echo "The path skirts a dark wood. Something moves inside..."
sleep 2
echo "A ragged wolf-like creature emerges from the darkness. It's red eyes stare at you,
fangs bared, slathering and ready to pounce..."

while [ $beast_hp -gt 0 ];
do
    echo -e "\nWill you attack? (y/n)"
    read action
    if [[ $action == "y" ]]; then
        echo -e "\nYou attack fiercely and injure the beast."
        beast_hp=$(( $beast_hp - $attack ))
        sleep 1
        if [ $beast_hp -lt 0 ]; then
            break
        fi
        echo "The beast retaliates. (hp -1)"
        hp=$(( $hp - $beast_attack ))
        sleep 1
        echo -e "\nThe beast's hp is $beast_hp, your hp is $hp."
    else
        echo "The beast lashes out at you. (hp-1)"
        hp=$(( $hp - $beast_attack ))
        echo "The beast's hp is $beast_hp, your hp is $hp."
    fi

done

sleep 1
echo -e "\n**** Beast VANQUISHED!! **** \nCongratulations traveller. Your hp is $hp.\n"

sleep 2

echo "In a nearby bush you find the remains of an unfortunate traveller. Lying next to the remains you find:
1 - Cured meat (+2 hp)
2 - Broadsword (+10 attack)
"

echo "Will you take anything? (1 or 2)"
read pickup

if [[ $pickup == "1" ]]; then
    echo "You eat the cured meat. Your hp is now: $hp."
elif [[ $pickup == "2" ]]; then
    echo "You pickup the broadsword. Your attack is now: $attack."
else
    echo "You mutter your condolences and continue walking."
fi

echo -e "\n........."
sleep 2

echo "You walk further along the path towards the deserted village."
sleep 3

echo "You've reached the village square. It's eerily quiet..."
sleep 2

echo "......"
sleep 2

echo "An eldritch creature emerges, with enormous tattered wings and a demonic look."
sleep 2

# Boss battle 
beast_hp=50
beast_attack=3

echo "It's boss battle time. Get scared."

while [ $beast_hp -gt 0 ];
do
    echo -e "\nWill you attack? (y/n)"
    read action
    if [[ $action == "y" ]]; then
        echo -e "\nYou attack fiercely and injure the beast."
        beast_hp=$(( $beast_hp - $attack ))
        sleep 1
        if [ $beast_hp -lt 0 ]; then
            break
        fi
        echo "The beast retaliates. (hp -3)"
        hp=$(( $hp - $beast_attack ))
        sleep 1
        echo -e "\nThe beast's hp is $beast_hp, your hp is $hp."
    else
        echo "The beast lashes out at you. (hp-3)"
        hp=$(( $hp - $beast_attack ))
        echo "The beast's hp is $beast_hp, your hp is $hp."
    fi
done