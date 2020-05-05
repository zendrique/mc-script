#!/usr/bin/env bash

if [ "$EUID" -ne 0 ]; then 
    echo "[!] Veuillez lancer le script en root (via sudo)"
    exit
fi

{
    echo "[.] Téléchargement des dépendances..."
    apt install nano screen curl zip apt-transport-https ca-certificates dirmngr gnupg software-properties-common git -y
} || {
    echo "[!] Une erreur est survenue lors du téléchargement des paquets ..."
    exit 1
}

{
    echo "[.] Ajout des depot Java 8..."
    wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | apt-key add -
    add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/
    apt update

} || {
    echo "[!] Une erreur est survenue lors de l'ajout des dépôts Java 8..."
    exit 1
}

{
    echo "[.] Téléchargement de Java 8..."
    apt install adoptopenjdk-8-hotspot -y
} || {
    echo "[!] Une erreur est survenue lors du téléchargement de Java 8..."
    exit 1
}

clear
echo "[.] Téléchargement de mc-script"
cd /home
git clone https://github.com/zendrique/mc-script
clear
echo "[.] Compilation de mc-script"
cd /home/mc-script
bash build/build_standalone_script.sh
mv script.sh /home
clear
echo "[.] Démarage de mc-script"
cd /home
bash script.sh