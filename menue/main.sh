#!/bin/bash

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
    --backtitle "MC-script - menue principale" \
    --title "MC-script" \
    --clear \
    --cancel-label "Quiter" \
    --menu "Quel serveur voulez-vous installer ?" $HEIGHT $WIDTH 4 \
    "1" "Serveur Vanilla" \
    "2" "Serveur Snapshot" \
    "3" "Serveur Bukkit" \
    "4" "Serveur Spigot" \
    "5" "Serveur PaperSpigot" \
    "6" "Serveur Tunity" \
    "7" "Serveur AirePlain" \
    "8" "Serveur PurPur" \
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
      bash $SOURCE Vanilla
      ;;
    2 )
      bash $SOURCE Snapshot
      ;;
    3 )
      bash $source Bukkit
      ;;
    4 )
      bash $source Spigot
    5 )
      bash $source PaperSpigot
      ;;
    6 )
      bash $source Tunity
      ;;
    7 )
      bash $source AirePlain
      ;;
    8 )
      bash $source PurPur
      ;;
  esac
done
exit 0