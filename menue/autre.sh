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
    --backtitle "mc-script - autre" \
    --title "mc-script" \
    --clear \
    --cancel-label "Retour" \
    --menu "Que voulez-vous installer ou mettre à jour ?" $HEIGHT $WIDTH 4 \
    "1" "ModPack" \
    "2" "OpenMod" \
    "3" "Débogage" \
    "4" "Info Système" \
    "5" "Quitter" \
    "6" "Mettre à jour mc-script" \
    "7" "Supprimer mc-script" \
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
      bash $serveur/modpack.sh
      bash $utils/file_permission.sh
      bash $utils/fini.sh
      ;;
    2 )
      bash $utils/java_detector.sh --noargs
      bash $utils/backup.sh
      bash $serveur/openMod.sh
      bash $utils/file_permission.sh
      bash $utils/fini.sh
      ;;
    3 )
      bash $utils/debug.sh
      ;;
    4 )
      bash $utils/system_info.sh
      ;;
    5 )
      bash $utils/fermeture.sh
      ;;
    6 )
      bash $utils/update.sh
      ;;
    7 )
      bash $utils/remove.sh
      ;;
  esac
done