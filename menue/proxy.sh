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
    --backtitle "mc-script - proxy" \
    --title "mc-script" \
    --clear \
    --cancel-label "Retour" \
    --menu "Que voulez-vous installer ou mettre à jour ?" $HEIGHT $WIDTH 4 \
    "1" "Bungeecord" \
    "2" "Waterfall" \
    "3" "Travertine" \
    "4" "Hexacord" \
    "5" "Velocity" \
    "6" "FLameCord" \
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
      bash $invocation/bungeecord.sh
      bash $invocation/file_permission.sh
      bash $invocation/fini.sh
      ;;
    2 )
      bash $invocation/java_detector.sh --noargs
      bash $invocation/backup.sh
      bash $invocation/waterfall.sh 
      bash $invocation/file_permission.sh
      bash $invocation/fini.sh
      ;;
    3 )
      bash $invocation/java_detector.sh --noargs
      bash $invocation/backup.sh
      bash $invocation/travertine.sh
      bash $invocation/file_permission.sh
      bash $invocation/fini.sh
      ;;
    4 )
      bash $invocation/java_detector.sh --noargs
      bash $invocation/backup.sh
      bash $invocation/hexacord.sh
      bash $invocation/file_permission.sh
      bash $invocation/fini.sh
      ;;
    5 )
      bash $invocation/java_detector.sh --noargs
      bash $invocation/backup.sh
      bash $invocation/velocity.sh
      bash $invocation/file_permission.sh
      bash $invocation/fini.sh
      ;;
    6 )
      bash $invocation/java_detector.sh --noargs
      bash $invocation/backup.sh
      bash $invocation/flamecord.sh
      bash $invocation/file_permission.sh
      bash $invocation/fini.sh
      ;;
  esac
done