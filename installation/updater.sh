#!/bin/bash

dossier ="/opt/mc-script"

clear

rm -r $dossier
rm /usr/bin/mc-script /usr/bin/mc-script-java-manager

cd /opt/

git clone -branch dev-v2-classique https://github.com/zendrique/mc-script

bash $dossier/installation/installation.sh

exit 0