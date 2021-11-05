#!/bin/bash

if [ "$EUID" -ne 0 ]; then 
    echo "[!] Veuillez lancer le script en root (via sudo)"
    exit
fi
dossier="/opt/mc-script/"
main="$dossier/menue/main.sh"
function yes {
    utilisateur=$(whiptail --title "Ajouter utilisateur Debian" --inputbox "Veuillez indiquer le nom de l'utilisateur" 10 60 Wigglebutt 3>&1 1>&2 2>&3)
    exitstatus=$?
    if [ $exitstatus = 0 ]; then
        clear
        echo "Ajoue de l'utilisateur..."
        groupadd docker $utilisateur
        no
    else
        other
    fi
}


function no {

    clear
    echo "Installation effectuer avec succet !"
    mv $dossier/installation/mc-script /usr/bin
    sleep 3
    bash $main
}

function other {
    clear
    echo "[!] Installation abendonner"
}

clear
echo "Installation de Docker..."
apt install -y apt-transport-https ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
apt update $vide
apt install -y docker-ce docker-ce-cli containerd.io
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
echo "Installation des utilitaire mc-script"
apt install -y dialog
dialog --title "Utilisateur Docker" \
--backtitle "Ajouter un utilisateur à docker" \
--yesno "Voulez-vous autoriser un utilisateur autre que root a utiliser docker ?" 7 60
response=$?
case $response in
   0) yes;;
   1) no;;
   255) other;;
esac
exit 0