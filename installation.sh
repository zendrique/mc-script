#!/usr/bin/env bash

path=/opt/mc-script

clear

if [ "$EUID" -ne 0 ]; then 
    echo "[!] Veuillez lancer le script en root (via sudo)"
    exit
fi

function accords {
    echo "[!] Mc-script sous licence GPL-3"
    echo "[?] En utilisant mc-script vous acceptez la charte d'utilisation de Mojang Studio (eula) ? (1 ou 2)" 
    select licence in "Oui" "Non"; do
        case $licence in
            Oui ) break;;
            Non ) rm -R $path
                exit;;
        esac
    done
}

function update {
    echo "[?] Voulez-vous mettre à jour votre système ? (1 ou 2)" 
    select yn in "Oui" "Non"; do
        case $yn in
            Oui ) apt update && apt upgrade -y; break;;
            Non ) break;;
        esac
    done
}

function securiter {
    echo "[?] Voulez-vous installez fail2ban (pour renforcer la sécurité) ? (1 ou 2)" 
    select yn in "Oui" "Non"; do
        case $yn in
            Oui ) apt update && apt install fail2ban -y; break;;
            Non ) break;;
        esac
    done
}

function dependances {
    {
        echo "[.] Téléchargement des dépendances..."
        apt install nano screen git zip apt-transport-https ca-certificates dirmngr gnupg software-properties-common cron -y
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
    apt update

    } || {
        echo "[!] Une erreur est survenue lors de l'ajout du dépôts de Java..."
        exit 1
    }
    clear

    echo "[?] Quel version de java voulez-vous ? (1 ou 2)" 
    select java in "8" "11"; do
        case $java in
            8 ) apt install adoptopenjdk-8-hotspot -y; break;;
            11 ) apt install adoptopenjdk-11-hotspot -y; break;;
        esac
    done
}

if [ "$1" == "--update" ]
then
  echo "Installation de java, des dépendances, de la sécuriter, des accords passer car mise à jour."
  update
else
  accords
  update
  securiter
  dependances
  java
fi

clear
echo "[.] Creation d'un alias"
alias mc-script='bash /opt/mc-script/script/mc-script.sh'
echo "[.] Démarage de mc-script"
bash $path/mc-script.sh
exit
