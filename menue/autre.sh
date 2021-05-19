#!/bin/bash

DIALOG_CANCEL=1
DIALOG_ESC=255
HEIGHT=0
WIDTH=0
invocation="/opt/mc-script/script/serveur"

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
      bash $invocation/java_detector.sh --noargs
      bash $invocation/backup.sh
      bash $invocation/modpack.sh
      bash $invocation/file_permission.sh
      bash $invocation/fini.sh
      ;;
    2 )
      bash $invocation/java_detector.sh --noargs
      bash $invocation/backup.sh
      bash $invocation/openMod.sh
      bash $invocation/file_permission.sh
      bash $invocation/fini.sh
      ;;
    3 )
      bash $invocation/debug.sh
      ;;
    4 )
      bash $invocation/system_info.sh
      ;;
    5 )
      bash $invocation/fermeture.sh
      ;;
    6 )
      bash $invocation/update.sh
      ;;
    7 )
      bash $invocation/remove.sh
      ;;
  esac
done