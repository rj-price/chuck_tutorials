#!/bin/bash

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
        clear

        echo -e "You enter a dimly lit tavern in one of the few populated villages. The handful of 
patrons turn from their tankards and eye you with suspicion. The tavern is a haven of shadows and 
secrecy, with hushed whispers and wary glances. You approach the bar with caution..."

        echo -e "\nBAR KEEP: Welcome, traveler. It's not often we see new faces in these troubled 
times. What brings you to our desolate corner of the world?

        1 - I am a KNIGHT (HP: 10, ATTACK: 20), a loyal protector of the realm, sworn to defend it 
        from the ancient evil that plagues the land. My training and bravery have brought me to this 
        fateful quest for revenge.

        2 - As a HUNTER (HP: 15, ATTACK: 15), I am skilled in tracking and combat. The ancient evil 
        has taken something precious from me, and I am embarking on this journey to reclaim what was 
        I have lost.

        3 - A master of stealth and cunning, I am a THIEF (HP: 20, ATTACK: 10) with a personal vendetta 
        against the ancient evil. My nimbleness and wit make me the perfect agent of vengeance.
        " 

        read -p "Select your starting class (1/2/3): " class

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

        echo -e "\nBAR KEEP: I see it in your eyes, $type. You carry a heavy burden and a fierce 
determination. Choose your path wisely, for the realm is fraught with danger. Your HP 
is $hp, and your ATTACK is $attack. May your quest bring salvation to this land.\n"
        sleep 2

        read -p "Press ENTER to leave the tavern and continue on your travels..."
        clear
        sleep 1

        echo -e "You step out of the tavern, and the chilly wind cuts through the air. The path 
ahead is shrouded in uncertainty, but your determination drives you forward. The road 
meanders through a dark forest, and the ancient trees loom overhead. Eerie sounds echo 
through the woods, and the feeling of foreboding settles upon you."

        # First beast battle 
        beast_hp=30
        beast_attack=5
        beast_turn=$((RANDOM % 3))

        sleep 2
        echo -e "\nAs you walk deeper into the forest, you notice something moving in the shadows. 
Suddenly, a ragged wolf-like creature emerges from the darkness, its red eyes fixed upon you, 
fangs bared, slathering and ready to pounce..."

        battle_loop

        # First inventory chance
        sleep 2
        echo "You quickly scan the surroundings and discover the remains of an unfortunate traveler. 
Lying next to the remains, you find:

        1 - Salted fish (+3 HP)
        2 - Broadsword (+10 ATTACK)
        "

        read -p "Will you take anything? (1 or 2)" pickup

        if [[ $pickup == "1" ]]; then
            hp=$(( $hp + 3 ))
            echo -e "\nYou eat the salted fish. Your HP is now: $hp."
        elif [[ $pickup == "2" ]]; then
            attack=$(( $attack + 10 ))
            echo -e "\nYou pickup the broadsword. Your ATTACK is now: $attack."
        else
            echo -e "\nYou mutter your condolences and continue walking."
        fi

        echo ""
        read -p "Press ENTER to continue on your travels..."
        clear

        sleep 1
        echo -e "You continue down the path, and the forest slowly begins to thin out. The distant 
sound of running water fills the air, and you approach a serene, moonlit riverbank. The 
gentle flow of the river is a stark contrast to the foreboding forest."

        # Second enemy encounter
        beast_hp=50
        beast_attack=8
        
        sleep 2
        echo -e "\nAs you kneel by the river to drink, a fearsome creature with glowing eyes and venomous 
fangs emerges. It's a guardian of the ancient evil, and it stands in your way."

        battle_loop

        # Second inventory chance

        sleep 2
        echo "Amid the chaos of battle, you notice a hidden stash beneath a nearby rock:
        
        1 - Healing Herbs (+5 HP)
        2 - Potion of Agility (+5 ATTACK, -5 HP)
        "

        read -p "Will you take anything? (1 or 2)" pickup

        if [[ $pickup == "1" ]]; then
            hp=$(( $hp + 5 ))
            echo -e "\nYou use the healing herbs. Your HP is now: $hp."
        elif [[ $pickup == "2" ]]; then
            attack=$(( $attack + 5 ))
            hp=$(( $hp -5 ))
            echo -e "\nYou drink the potion of agility. Your ATTACK is now: $attack, your HP is now: $hp."
        else
            echo -e "\nYou leave the stash for a more unfortunate traveller and continue walking."
        fi

        echo ""
        read -p "Press ENTER to continue your travels..."
        clear

        sleep 1
        echo -e "After defeating the guardian, you move on from the riverbank. The path leads to a 
forsaken village square. The silence is eerie, and the moonlight casts long shadows."

        # Third enemy encounter???

        # Boss battle 
        beast_hp=80
        beast_attack=10
        beast_turn=$((RANDOM % 2))

        sleep 2
        echo -e "\nSuddenly, an enormous eldritch creature with tattered wings and a demonic look emerges. 
It's the embodiment of the ancient evil's malevolence, and it's out for blood. This is the final  
battle, and your heart races as you prepare to face this ultimate challenge."

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
    clear
    hp=1
    game_loop
}

game_loop
