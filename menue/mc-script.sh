#!/bin/bash

if [ "$EUID" -ne 0 ]; then 
    echo "[!] Veuillez lancer le script en root (via sudo)"
    exit
fi

dossier="/opt/mc-script"

while true; do
    exec 3>&1
    selection=$(dialog \
        --backtitle "MC-script" \
        --title "mc-script" \
        --clear \
        --cancel-label "Retour" \
        --menu "Que voulez-vous faire ?" 0 0 4 \
        "1" "Installer un serveur ?" \
        "2" "Acceder au gestionnaire java ?" \
        "3" "Mettre à jour mc-script" \
        "4" "Supprimer MC-script" \
        "5" "Quitter" \
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
            bash $dossier/menue/serveur.sh
            exit 0
            ;;
        2 )
            bash $dossier/menue/java-manager.sh
            exit 0
            ;;
        3 )
            bash $dossier/menue/updater.sh
            exit 0
            ;;
        4 )
            bash $dossier/menue/remover.sh
            exit 0
            ;;
        5 )
            clear
            echo "Au revoir !"
            exit 0
            ;;
    esac
done

exit 0