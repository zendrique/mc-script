serveur_type=$1
fichier="/opt/mc-script/worker/serveur-installation.sh"

version_minecraft=""
version_java=""
port=""
dossier=""
nom_serveur=""


dialog --title "Version Minecraft" --inputbox "Sur quel version de minge voulez-vous executer votre serveur ?" 0 0>$version_minecraft
java
dialog --title "Port" --inputbox "Sur quel port voulez-vous executer votre serveur ?" 0 0>$port
dialog --title "Dossier" --inputbox "Comment voulez-vous nomer le dossier vôtre serveur ?" 0 0>$dossier
dialog --title "Dossier" --inputbox "Comment voulez-vous nomer vôtre serveur ?" 0 0>nom_serveur


bash $fichier $version_minecraft $serveur_type $version_java $port $dossier $nom_serveur

function java {
    source="/opt/mc-script/worker/serveur-config.sh"
    DIALOG_CANCEL=1
    DIALOG_ESC=255
    HEIGHT=0
    WIDTH=0
    display_result() {
    dialog --title "$1" \
        --no-collapse \
        --msgbox "$result" 0 0
    }
    while true; do
    exec 3>&1
    selection=$(dialog \
        --backtitle "MC-script - menue Java" \
        --title "MC-scrpt" \
        --clear \
        --cancel-label "Quiter" \
        --menu "Quel version de Java voulez-vous ?" $HEIGHT $WIDTH 4 \
        "1" "Java 7" \
        "2" "Java 8" \
        "3" "Java 11 " \
        "4" "Java 16" \
        2>&1 1>&3)
    exit_status=$?
    exec 3>&-
    case $exit_status in
        $DIALOG_CANCEL)
        clear
        echo "MC-script fermer avec succet."
        exit
        ;;
        $DIALOG_ESC)
        clear
        echo "Fermeture de MC-script." >&2
        exit 1
        ;;
    esac
    case $selection in
        0 )
        clear
        echo "MC-script - Terminer."
        ;;
        1 )
        version_java=7
        ;;
        2 )
        version_java=8
        ;;
        3 )
        version_java=11
        ;;
        4 )
        version_java=16
    esac
    done
}

exit 0