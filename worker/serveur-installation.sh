#!/bin/bash

version_minecraft=$1
serveur_type=$2
version_java=$3
port=$4
dossier=$5
nom_serveur=$6

clear
echo "Installation du serveur..."
echo "Installation du serveur $nom_serveur avec le port $port dans le dossier $dossier dans la version $version_minecraft avec java $version_java"
mkdir /home/$dossier
cd /home/
manager=$nom_serveur-serveur-manager.sh
touch $manager

#------- Section de code pas trés propre mais, j'ai pas réussie à faire autrement :(
echo "function start {" >> $manager
echo    "echo Démarrage du serveur..." >> $manager

if [ serveur_type == "vanilla" ] ; then
    echo "docker run -d -i -p 25565:$port -v /home/$dossier:/data -e EULA=TRUE -e VERSION=$version_minecraft --name $nom_serveur itzg/minecraft-server:java$version_java" >> $manager
else
    echo "docker run -d -i -p 25565:$port -v /home/$dossier:/data -e EULA=TRUE -e VERSION=$version_minecraft -e TYPE=$serveur_type --name $nom_serveur itzg/minecraft-server:java$version_java" >> $manager
fi
echo "}" >> $manager
#------- Fin de section -----------------------------------------------

cat <<EOF > $manager
function stop {
    echo "Arret du serveur..."
    docker stop $nom_serveur
}

function restart {
    stop
    start
}

function interact {
    echo pour entrer dans le console du serveur, executer la commande suivate : docker -t $nom_serveur
}

function menue {
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
    --backtitle "$nom_serveur - menue principale" \
    --title "MC-script" \
    --clear \
    --cancel-label "Quiter" \
    --menu "Que voulez-vous faire ?" $HEIGHT $WIDTH 4 \
    "1" "Démarrer" \
    "2" "Redémarrer" \
    "3" "Acceder à la console" \
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
      $nom_serveur - Menue fermer
      clear
      ;;
    1 )
      start
      clear
      ;;
    2 )
      stop
      clear
      ;;
    3 )
      restart
      clear
      ;;
  esac
done
}

EOF


