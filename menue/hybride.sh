#!/bin/bash

DIALOG_CANCEL=1
DIALOG_ESC=255
HEIGHT=0
WIDTH=0
invocation="/opt/mc-script/script/modules"

display_result() {
  dialog --title "$1" \
    --no-collapse \
    --msgbox "$result" 0 0
}

while true; do
  exec 3>&1
  selection=$(dialog \
    --backtitle "mc-script - hybride" \
    --title "mc-script" \
    --clear \
    --cancel-label "Retour" \
    --menu "Que voulez-vous installer ou mettre à jour ?" $HEIGHT $WIDTH 4 \
    "1" "CatServer" \
    "2" "Mohist" \
    "3" "Thermos" \
    2>&1 1>&3)
  exit_status=$?
  exec 3>&-
  case $exit_status in
    $DIALOG_CANCEL)
      clear
      mc-script
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
      echo "mc-script - Terminer."
      ;;
    1 )
      bash $invocation/java_detector.sh 8 CatServer
      bash $invocation/backup.sh
      bash $invocation/catserver.sh
      bash $invocation/pre_conf_serveur.sh 
      bash $invocation/file_permission.sh
      bash $invocation/fini.sh
      ;;
    2 )
      bash $invocation/java_detector.sh 11 Mohist
      bash $invocation/backup.sh
      bash $invocation/mohist.sh
      bash $invocation/pre_conf_serveur.sh 
      bash $invocation/file_permission.sh
      bash $invocation/fini.sh
      ;;
    3 )
      bash $invocation/java_detector.sh --noargs
      bash $invocation/backup.sh
      bash $invocation/thermos.sh
      bash $invocation/pre_conf_serveur.sh 
      bash $invocation/file_permission.sh
      bash $invocation/fini.sh
      ;;
  esac
done