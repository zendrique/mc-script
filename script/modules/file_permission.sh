#!/usr/bin/env bash

path="/home"
dossier=$(cat /opt/mc-script/variable/dossier.txt)
final_user=$(cat /opt/mc-script/variable/final_user.txt)
java_file="/opt/mc-script/variable/java.txt"
java_validation=$(cat /opt/mc-script/variable/java.txt)

# Détéction de la sortie d'information Java
if [ $java_validation -ne "1" ]; then
    rm $java_file
    exit 1
fi

sudo chown -R $final_user:$final_user $path/$dossier
rm /opt/mc-script/variable/dossier.txt
exit 0