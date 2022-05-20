#!/bin/bash

dossier="/opt/mc-script"
installateur="$dossier/worker/installateur"

nom=$(dialog --backtitle "MC-script" --inputbox "Comment se nome votre serveur ?" 8 40)

function nom {} # Inputbox
function version {} # Inputbox

function serveur {
    while true; do
        exec 3>&1
        serveur_menue=$(dialog \
            --backtitle "MC-script" \
            --title "mc-script" \
            --clear \
            --cancel-label "Retour" \
            --menu "Quel type de serveur voulez-vous instaler ?" 0 0 4 \
            "1" "Vanilla" \
            "2" "Snapshot" \
            "3" "Bukkit" \
            "4" "Spigot" \
            "5" "Paper" \
            "6" "Tunity" \
            "7" "Purpur" \
            "8" "Forge" \
            "9" "Mohist" \
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
        case $serveur_menue in
            0 )
                clear
                echo "MC-script à été fermer avec succet !"
                exit 0
                ;;
            1 )
                bash $installateur/serveur/vanilla.sh $version
                bash $installateur/serveur/start.sh $nom $java
                ;;
            2 )
                bash $installateur/serveur/snapshot.sh $version
                bash $installateur/serveur/start.sh $nom $java
                ;;
            3 )
                bash $installateur/serveur/bukkit.sh $version
                bash $installateur/serveur/start.sh $nom $java
                ;;
            4 )
                bash $installateur/serveur/spigot.sh $version
                bash $installateur/serveur/start.sh $nom $java
                ;;
            5 )
                bash $installateur/serveur/paper.sh $version
                bash $installateur/serveur/start.sh $nom $java
                ;;
            6 )
                bash $installateur/serveur/tunity.sh $version
                bash $installateur/serveur/start.sh $nom $java
                ;;
            7 )
                bash $installateur/serveur/purpur.sh $version
                bash $installateur/serveur/start.sh $nom $java
                ;;
            8 )
                bash $installateur/serveur/forge.sh $version
                bash $installateur/serveur/start.sh $nom $java
                ;;
            9 )
                bash $installateur/serveur/mohist.sh $version
                bash $installateur/serveur/start.sh $nom $java
                ;;
        esac
    done
}

function proxy {
    while true; do
        exec 3>&1
        proxy_menue=$(dialog \
            --backtitle "MC-script" \
            --title "mc-script" \
            --clear \
            --cancel-label "Retour" \
            --menu "Quel type de proxy voulez-vous instaler ?" 0 0 4 \
            "1" "Bungeecord" \
            "2" "WaterFall" \
            "3" "Velocity" \
            "4" "FlameCord" \
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
        case $proxy_menue in
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
        esac
    done
}

function java {
    while true; do
        exec 3>&1
        java_menue=$(dialog \
            --backtitle "MC-script" \
            --title "mc-script" \
            --clear \
            --cancel-label "Retour" \
            --menu "Version de java à utiliser" 0 0 4 \
            "1" "java 8" \
            "2" "java 11" \
            "3" "java 16" \
            "4" "java 17" \
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
        case $java_menue in
            0 )
                clear
                echo "MC-script à été fermer avec succet !"
                exit 0
                ;;
            1 )
                bash $installateur/proxy/bungeecord.sh
                bash $installateur/serveur/start.sh $nom $java
                ;;
            2 )
                bash $installateur/proxy/waterfall.sh
                bash $installateur/proxy/start.sh $nom $java
                ;;
            3 )
                bash $installateur/proxy/velocity.sh
                bash $installateur/proxy/start.sh $nom $java
                ;;
            4 )
                bash $installateur/proxy/flamecord.sh
                bash $installateur/proxy/start.sh $nom $java
                ;;
        esac
    done
}

function choix {
    while true; do
        exec 3>&1
        choix_menue=$(dialog \
            --backtitle "MC-script" \
            --title "mc-script" \
            --clear \
            --cancel-label "Retour" \
            --menu "C'est un ?" 0 0 4 \
            "1" "Serveur" \
            "2" "Proxy" \
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
        case $choix_menue in
            0 )
                clear
                echo "MC-script à été fermer avec succet !"
                exit 0
                ;;
            1 )
                echo "Ok"
                ;;
            2 )
                echo "Ok"
                ;;
        esac
    done
}

nom
choix
java
if [ "$choix_menue" == "1" ]; then
    serveur
    version=$(dialog --backtitle "MC-script" --inputbox "Quelle version voulez-vous ?" 8 40)
elif [ "$menue" == "2" ]; then
    proxy
fi

exit 0