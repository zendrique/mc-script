#!/bin/bash

action="$1"

if [ "$action" == "--install" ]; then
    comande="install -y"
    verbe="installé"
    verbe2="Installation"
    menue
elif [ "$action" == "--remove" ]; then
    comande="autoremove --purge -y"
    verbe="supprimé"
    verbe2="Suppression"
    menue
elif
    [ "$action" == "--display" ]; then
    clear
    echo "Liste des version de java installées :"
    dpkg --list | grep -i jre
else
    echo "Action inconnue"
    exit 1
fi

while true; do
    exec 3>&1
    version=$(dialog \
        --backtitle "MC-script" \
        --title "mc-script" \
        --clear \
        --cancel-label "Retour" \
        --menu "Quelle version voulez-vous $verbe ?" 0 0 4 \
        "1" "Java 8" \
        "2" "Java 11" \
        "3" "Java 16" \
        "4" "Java 17" \
        2>&1 1>&3)
    exit_status=$?
    exec 3>&-
    case $exit_status in
        1)
            clear
            echo "MC-script à été fermer avec succet !"
            exit 0
            ;;
        255)
            echo "MC-script à été fermer avec succet !"
            exit 0
            ;;
    esac
    case $version in
        0 )
            clear
            echo "MC-script à été fermer avec succet !"
            exit 0
            ;;
        1 )
            clear
            echo "$verbe2 en cours pour Java 8..."
            apt $action adoptopenjdk-8-jre
            echo "$verbe2 de Java 8 terminé"
            ;;
        2 )
            clear
            echo "$verbe2 en cours pour Java 11..."
            apt $action -y adoptopenjdk-11-jre
            echo "$verbe2 de Java 11 terminé"
            ;;
        3 )
            clear
            echo "$verbe2 en cours pour Java 16..."
            apt $action -y adoptopenjdk-16-jre
            echo "$verbe2 pour Java 16 terminé"
            ;;
        4 )
            clear
            echo "$verbe2 en cours pour Java 17..."
            apt $action -y aopenjdk-17-jre
            echo "$verbe2 de Java 17 terminé"
            ;;
    esac
done

exit 0