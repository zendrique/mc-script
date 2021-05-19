#!/bin/bash

# Détéction de la sortie d'information Java
if [ $java_validation -ne "1" ]; then
    exit 1
fi

source="/opt/mc-script/variable"

clear
touch $source/dossier.txt
dialog --inputbox "Dans quel dossier voulez-vous installer ou mettre à jour votre serveur ?" 10 40 2>> $source/dossier.txt
clear
exit 0