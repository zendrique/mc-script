#!/bin/bash

dossier="/opt/mc-script"
dossier_data="/opt/mc-script-data"

echo "Vérification de l'OS..."
bash $dossier/installation/os.sh
os=$("ecoh $?")
if [ "$os" == "1" ]; then
    clear
    echo "OS non compatible"
    ecoh "OS compatible : "
    echo "- Debian 11 (Bullseye)"
    exit 1
fi

echo "Installation du dépos java..."
apt install -y apt-transport-https ca-certificates wget dirmngr gnupg software-properties-common
wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | apt-key add -
add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/
apt update

echo "Installation de fichier divers..."
mv $dossier/commande/mc-script /usr/bin/mc-script
mv $dossier/commande/mc-script-java-manager /usr/bin/mc-script-java-manager

echo "Installation de logiciels..."
apt install -y dialog curl

bash $dossier/menue/mc-script.sh

exit 0