#!/bin/bash

# TO DO:
# Intro to game ("Welcome to Loreborne, a game ...").
# Add "Press ENTER to continue" sections.
# Wrap whole game in while loop to allow player to continue
# Add random chance of retaliation after attack
# Add battle function to reuse code
# Add in damage multiplier if chose not to attack
#! Add inventory and option to heal in battle
#Add in hp and attack attributes to battles
#! Develop story

# Welcome

echo "                                    ▄▄                                            "
echo "▀████▀                             ▄██                                            "
echo "  ██                                ██                                            "
echo "  ██       ▄██▀██▄▀███▄██   ▄▄█▀██  ██▄████▄   ▄██▀██▄▀███▄██ ▀████████▄   ▄▄█▀██ "
echo "  ██      ██▀   ▀██ ██▀ ▀▀ ▄█▀   ██ ██    ▀██ ██▀   ▀██ ██▀ ▀▀  ██    ██  ▄█▀   ██"
echo "  ██     ▄██     ██ ██     ██▀▀▀▀▀▀ ██     ██ ██     ██ ██      ██    ██  ██▀▀▀▀▀▀"
echo "  ██    ▄███▄   ▄██ ██     ██▄    ▄ ██▄   ▄██ ██▄   ▄██ ██      ██    ██  ██▄    ▄"
echo "██████████ ▀█████▀▄████▄    ▀█████▀ █▀█████▀   ▀█████▀▄████▄  ▄████  ████▄ ▀█████▀"
echo "                                                                                  "

echo -e "In the world of Loreborne, an ancient evil plagues the land. For generations, eldritch 
terrors have roamed the deserted villages, leaving behind a trail of despair and darkness. The 
once-thriving kingdom is now a shadow of its former self, and the people are in dire need of a 
savior. As a lone traveler, your heart is fueled by vengeance and a burning desire to bring 
light back to this darkened realm. You are determined to restore peace and ensure that the 
people of Loreborne will never again have to fear the horrors that lurk in the shadows."
echo ""

hp=1

game_loop() {
    while [ $hp -gt 0 ]; do

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
            *)
                echo -e "Invalid choice.\n"
                reset_game
        esac

        echo -e "\nHello, $type. Your HP is $hp and your ATTACK is $attack.\n"
        sleep 2

        read -p "Press ENTER to leave the tavern and continue on your travels..."
        echo ""
        sleep 2

        # First beast battle 
        beast_hp=30
        beast_attack=3
        beast_turn=$((RANDOM % 3))

        echo "As you walk from the village, an eerie feeling of foreboading settles upon you."
        echo "The path skirts a dark wood. Something moves inside..."
        sleep 2
        echo -e "\nA ragged wolf-like creature emerges from the darkness. It's red eyes stare at you,
fangs bared, slathering and ready to pounce..."

        battle_loop

        # First inventory chance
        sleep 2
        echo "In a nearby bush you find the remains of an unfortunate traveller. Lying next to the remains you find:
        1 - Salted fish (+3 HP)
        2 - Broadsword (+10 ATTACK)
        "

        echo "Will you take anything? (1 or 2)"
        read pickup

        if [[ $pickup == "1" ]]; then
            hp=$(( $hp + 3 ))
            echo -e "\nYou eat the cured meat. Your HP is now: $hp."
        elif [[ $pickup == "2" ]]; then
            attack=$(( $attack + 10 ))
            echo -e "\nYou pickup the broadsword. Your ATTACK is now: $attack."
        else
            echo -e "\nYou mutter your condolences and continue walking."
        fi

        echo ""
        read -p "Press ENTER to continue on your travels..."


        # Second enemy encounter
        #! Adjust enemy_hp, enemy_attack, and description
        beast_hp=40
        beast_attack=5
        echo "While exploring deeper into the cursed forest, you encounter a fearsome creature with 
glowing eyes and venomous fangs. It's a guardian of the ancient evil and stands in your way."

        battle_loop

        # Second inventory chance

        # Third enemy encounter
        #! Adjust enemy_hp, enemy_attack, and description
        beast_hp=60
        beast_attack=8
        echo "As you near the heart of darkness, a colossal, shadowy beast emerges from the abyss. It's 
the embodiment of the ancient evil's malevolence, and it's out for blood."

        battle_loop

        # Third inventory chance

        echo -e "\nYou walk further along the path towards the deserted village."
        sleep 2
        echo -e "\nYou've reached the village square. It's eerily quiet..."
        sleep 2
        echo -e "\nAn eldritch creature emerges, with enormous tattered wings and a demonic look."
        sleep 2
        echo -e "\nIt's boss battle time. Get scared."

        # Boss battle 
        beast_hp=80
        beast_attack=10
        beast_turn=$((RANDOM % 2))

        battle_loop

        # Conclusion
        echo "With the matriarch of the evil plagues slain, peace will return to this land. 
You, $type, fought valiantly and fulfilled your quest for revenge. The people of Loreborne 
will forever sing of your heroic actions, and your name will be remembered throughout history."

    done
}

battle_loop() {
    while [ $beast_hp -gt 0 ];
    do
        echo -e "\nWill you attack? (y/n)"
        read action

        if [[ $action == "y" ]]; then
            echo -e "\nYou attack fiercely and injure the beast."
            beast_hp=$(( $beast_hp - $attack ))
            sleep 1
            # Check if the enemy is defeated
            if [ $beast_hp -le 0 ]; then
                echo ""
                echo " ██▄ ██▀ ▄▀▄ ▄▀▀ ▀█▀   █ █ ▄▀▄ █▄ █ ▄▀▄ █ █ █ ▄▀▀ █▄█ ██▀ █▀▄"
                echo " █▄█ █▄▄ █▀█ ▄██  █    ▀▄▀ █▀█ █ ▀█ ▀▄█ ▀▄█ █ ▄██ █ █ █▄▄ █▄▀"
                echo ""
                echo -e "Congratulations traveller! Your HP is $hp.\n"
                break
            fi
            # Randomly determine if the enemy attacks
            if [[ $beast_turn == 0 ]]; then
                echo "The beast retaliates!"
                hp=$(( $hp - $beast_attack ))
            else
                echo "The beast hesitates..."
            fi
            sleep 1
            echo -e "\n*** The beast's HP is $beast_hp, your HP is $hp. ***"
        
        else
            echo "The beast lashes out at you."
            hp=$(( $hp - ($beast_attack * 2) ))
            echo -e "\n*** The beast's hp is $beast_hp, your hp is $hp. ***"
        fi

        # Check if the player's HP drops to 0 or lower
        if [ $hp -le 0 ]; then
            echo ""
            echo " ▄▀  ▄▀▄ █▄ ▄█ ██▀   ▄▀▄ █ █ ██▀ █▀▄"
            echo " ▀▄█ █▀█ █ ▀ █ █▄▄   ▀▄▀ ▀▄▀ █▄▄ █▀▄"
            echo ""
            read -p "Do you want to restart your adventure? (y/n): " restart_choice
            if [ "$restart_choice" == "y" ]; then
                reset_game
            else
                exit 0
            fi
        fi

    done
}

reset_game() {
    hp=1
    game_loop
}

game_loop
