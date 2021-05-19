#!/usr/bin/env bash

if [ "$EUID" -ne 0 ]; then 
    echo "[!] Veuillez lancer le script en root (via sudo)"
    exit
fi

path=/opt/mc-script
os=$(cat /etc/issue)

clear

if [ "$EUID" -ne 0 ]; then 
    echo "[!] Veuillez lancer le script en root (via sudo)"
    exit
fi

function os_fail {
    clear
    echo "Votre OS n'est pas compatible vous devez utiliser Debian 10 !"
    exit
}

function os {
    if [ "$os" == "Debian GNU/Linux 10 \n \l" ]; then
    echo "OS compatible !"
    sleep 1
    clear
    else
    os_fail
    fi

}

function update {
    echo "[?] Voulez-vous mettre à jour votre système ? (1 ou 2)" 
    select yn in "Oui" "Non"; do
        case $yn in
            Oui ) 
            echo "Mise à jour..."
            clear 
            apt update >> /dev/null
            apt upgrade -y >> /dev/null; break;;
            Non ) break;;
        esac
    done
}

function securiter {
    echo "[?] Voulez-vous installez fail2ban (pour renforcer la sécurité) ? (1 ou 2)" 
    select yn in "Oui" "Non"; do
        case $yn in
            Oui ) clear
            echo "Installation de fail2ban..."
            apt update >> /dev/null
            apt install fail2ban -y >> /dev/null; break;;
            Non ) break;;
        esac
    done
}

function dependances {
    {
        echo "[.] Téléchargement des dépendances..."
        apt install nano screen git zip apt-transport-https ca-certificates dirmngr gnupg software-properties-common cron jq curl dialog -y >> /dev/null
    } || {
        echo "[!] Une erreur est survenue lors du téléchargement des paquets ..."
        exit 1
    }
}

function java {
    {
    echo "[.] Un insant..."
    wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | apt-key add -
    add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/
    apt update >> /dev/null

    } || {
        echo "[!] Une erreur est survenue lors de l'ajout du dépôts de Java..."
        exit 1
    }
    clear

    echo "[?] Quel version de java voulez-vous ? (1 ou 2)" 
    select java in "8" "11"; do
        case $java in
        echo "Installation de java " $java
            8 ) apt install adoptopenjdk-8-hotspot -y >> /dev/null; break;;
            11 ) apt install adoptopenjdk-11-hotspot -y >> /dev/null; break;;
        esac
    done
}

function mcscript {
    rm -f /usr/bin/mc-script
    mv $path/mc-script /usr/bin/
    chmod +x /usr/bin/mc-script
}

if [ "$1" == "--update" ]
then
  clear
  echo "Installation de java, de la sécuriter, des accords passer car mise à jour."
  os
  update
  dependances
  mcscript
else
  os
  clear
  update
  clear
  securiter
  clear
  dependances
  clear
  java
  mcscript
fi

clear
echo "[.] Nettyoage"
rm /opt/mc-script/installation.sh
echo "[.] Démarage de mc-script"
bash $path/script/mc-script.sh
exit
