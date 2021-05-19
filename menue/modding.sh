#!/bin/bash

DIALOG_CANCEL=1
DIALOG_ESC=255
HEIGHT=0
WIDTH=0
serveur="/opt/mc-script/script/serveur"
utils="/opt/mc-script/script/utils"
display_result() {
  dialog --title "$1" \
    --no-collapse \
    --msgbox "$result" 0 0
}

while true; do
  exec 3>&1
  selection=$(dialog \
    --backtitle "mc-script - modding" \
    --title "mc-script" \
    --clear \
    --cancel-label "Retour" \
    --menu "Que voulez-vous installer ou mettre à jour ?" $HEIGHT $WIDTH 4 \
    "1" "Forge" \
    "2" "Fabric" \
    "3" "Sponge" \
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
      bash $utils/java_detector.sh --noargs
      bash $utils/backup.sh
      bash $serveur/forge.sh
      bash $utils/pre_conf_serveur.sh 
      bash $utils/file_permission.sh
      bash $utils/fini.sh
      ;;
    2 )
      bash $utils/java_detector.sh --noargs
      bash $utils/backup.sh
      bash $serveur/fabric.sh
      bash $utils/pre_conf_serveur.sh 
      bash $utils/file_permission.sh
      bash $utils/fini.sh
      ;;
    3 )
      bash $utils/java_detector.sh --noargs
      bash $utils/backup.sh
      bash $serveur/sponge.sh
      bash $utils/pre_conf_serveur.sh 
      bash $utils/file_permission.sh
      bash $utils/fini.sh
      ;;
  esac
done