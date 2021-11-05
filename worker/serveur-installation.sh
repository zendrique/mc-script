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
echo    echo "Démarrage du serveur..." >> $manager

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

}

EOF


