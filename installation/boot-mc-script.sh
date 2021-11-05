#!/bin/bash

if [ "$EUID" -ne 0 ]; then 
    echo "[!] Veuillez lancer le script en root (via sudo)"
    exit
fi

dossier="/opt/mc-script"
vide=">> /dev/null"

clear
echo "Installation..."

function convertion {
    echo "Convertion des fichier au format Unix..."
    cd $dossier
    dos2unix installation/installation.sh $vide
    dos2unix installation/mc-script $vide
    dos2unix installation/os-controle.sh $vide
    dos2unix menue/main.sh $vide
    dos2unix worker/serveur-installation.sh $vide
    echo "Convertion des fichier au format Unix terminer !"
}

if [ -f $dossier]; then
    echo "Vielle installation détecter, nettoyage..."
    rm -r $dossier
else
    apt update $vide
    apt install -y git dos2unix $vide
    cd /opt
    git clone https://github.com/zendrique/mc-script/tree/dev-V2
    convertion
    bash $dossier/installation/os-controle.sh
    verification=$(echo $?)
    if $verification -eq 0
    then
        echo "OS non compatible"
        echo "OS compatible :"
        echo " - Deiban 11"
        echo "Supression de l'installation..."
        rm -r $dossier
        exit 1
    else
        bash $dossier/installation/installation.sh
        exit 0
    fi
fi