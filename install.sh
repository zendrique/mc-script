#!/usr/bin/env bash

clear
if [ "$EUID" -ne 0 ]; then 
    echo "[!] Veuillez lancer le script en root (via sudo)"
    exit
fi

echo "[?] Voulez-vous mettre à jour votre système ? (1 ou 2)" 
select yn in "Oui" "Non"; do
    case $yn in
        Oui ) apt update && apt upgrade -y; break;;
        Non ) break;;
    esac
done

{
    echo "[.] Téléchargement des dépendances..."
    apt install git -y
} || {
    echo "[!] Une erreur est survenue lors du téléchargement des paquets ..."
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
echo "[.] Déméarage de mc-script"
cd /home
bash script.sh