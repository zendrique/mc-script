#!/usr/bin/env bash

if [ "$EUID" -ne 0 ]; then 
    echo "[!] Veuillez lancer le script en root (via sudo)"
    exit
fi

#!/bin/bash

DIALOG_CANCEL=1
DIALOG_ESC=255
HEIGHT=0
WIDTH=0
menue="/opt/mc-script/menue/"

display_result() {
  dialog --title "$1" \
    --no-collapse \
    --msgbox "$result" 0 0
}

while true; do
  exec 3>&1
  selection=$(dialog \
    --backtitle "mc-script - princiaple" \
    --title "mc-script" \
    --clear \
    --cancel-label "Retour" \
    --menu "Que voulez-vous installer ou mettre à jour ?" $HEIGHT $WIDTH 4 \
    "1" "Vanilla" \
    "2" "Moddé" \
    "3" "Hybride" \
    "4" "Proxy" \
    "5" "Autre" \
    2>&1 1>&3)
  exit_status=$?
  exec 3>&-
  case $exit_status in
    $DIALOG_CANCEL)
      clear
      echo "mc-script à été fermer avec succet !"
      exit
      ;;
    $DIALOG_ESC)
      mc-script
      exit 1
      ;;
  esac
  case $selection in
    0 )
      clear
      echo "mc-script à été fermer avec succet !"
      ;;
    1 )
      bash $menue/vanilla.sh
      ;;
    2 )
      bash $menue/modding.sh
      ;;
    3 )
      bash $menue/hybride.sh
      ;;
    4 )
      bash $menue/proxy.sh
      ;;
    5 )
      bash $menue/autre.sh
      ;;
  esac
done