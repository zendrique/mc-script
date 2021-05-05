#!/usr/bin/env bash

path="/home"
dossier=$(cat /opt/mc-script/variable/dossier.txt)
final_user=$(cat /opt/mc-script/variable/final_user.txt)

# Détéction de la sortie d'information Java
java_validation=$(cat /opt/mc-script/variable/java.txt)
if [ $java_validation == "0" ]; then
    exit 1
fi

sudo chown -R $final_user:$final_user $path/$dossier
rm /opt/mc-script/variable/dossier.txt
exit 0