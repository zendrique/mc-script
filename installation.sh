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
    apt install nano screen curl git zip apt-transport-https ca-certificates dirmngr gnupg software-properties-common -y
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
echo "[.] Compilation de mc-script"
cd /home/mc-script
bash build/build_standalone_script.sh
mv script.sh /home
clear
echo "[.] Démarage de mc-script"
cd /home
bash script.sh
esac