#!/bin/bash

if [ "$EUID" -ne 0 ]; then 
    echo "[!] Veuillez lancer le script en root (via sudo)"
    exit
fi

dossier="/opt/mc-script"
menue="/opt/mc-script/menue/"

while true; do
    exec 3>&1
    selection=$(dialog \
        --backtitle "MC-script" \
        --title "Gestionnaire Java" \
        --clear \
        --cancel-label "Retour" \
        --menu "Que voulez-vous faire ?" 0 0 4 \
        "1" "Installer une version de Java" \
        "2" "Supprimer une version de Java" \
        "3" "Afficher les version de java installer" \
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
    case $selection in
        0 )
            clear
            echo "MC-script à été fermer avec succet !"
            exit 0
            ;;
        1 )
            bash $dossier/menue/java-manager.sh --install
            exit 0
            ;;
        2 )
            bash $dossier/menue/java-manager.sh --remove
            exit 0
            ;;
        3 )
            bash $dossier/menue/java-manager.sh --display
            exit 0
            ;;
    esac
done

exit 0