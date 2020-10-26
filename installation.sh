#!/usr/bin/env bash
clear

if [ "$EUID" -ne 0 ]; then 
    echo "[!] Veuillez lancer le script en root (via sudo)"
    exit
fi

echo "[!] Mc-script sous licence GPL-3"
echo "[?] En utilisant mc-script vous acceptez la charte d'utilisation de Mojang Studio (eula) ? (1 ou 2)" 
select licence in "Oui" "Non"; do
    case $licence in
        Oui ) break;;
        Non ) rm -R /opt/mc-script
                exit;;
    esac
done
clear
echo "[?] Voulez-vous mettre à jour votre système ? (1 ou 2)" 
select yn in "Oui" "Non"; do
    case $yn in
        Oui ) apt update && apt upgrade -y; break;;
        Non ) break;;
    esac
done
clear
echo "[?] Voulez-vous installez fail2ban (pour renforcer la sécurité) ? (1 ou 2)" 
select yn in "Oui" "Non"; do
    case $yn in
        Oui ) apt update && apt install fail2ban -y; break;;
        Non ) break;;
    esac
done
clear
{
    echo "[.] Téléchargement des dépendances..."
    apt install nano screen git zip apt-transport-https ca-certificates dirmngr gnupg software-properties-common cron -y
} || {
    echo "[!] Une erreur est survenue lors du téléchargement des paquets ..."
    exit 1
}
clear
{
    echo "[.] Ajout du dépôt Java 8..."
    wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | apt-key add -
    add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/
    apt update

} || {
    echo "[!] Une erreur est survenue lors de l'ajout des dépôts Java 8..."
    exit 1
}
clear
{
    echo "[.] Téléchargement de Java 8..."
    apt install adoptopenjdk-8-hotspot -y
} || {
    echo "[!] Une erreur est survenue lors du téléchargement de Java 8..."
    exit 1
}

clear
echo "[.] Compilation de mc-script"
cd /opt/mc-script
bash build/build_standalone_script.sh
echo "[.] Creation d'un alias"
alias mc-script='bash /opt/mc-script/mc-script.sh'
echo "[.] Démarage de mc-script"
bash /opt/mc-script/mc-script.sh
exit