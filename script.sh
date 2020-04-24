#!/usr/bin/env bash
#Supporter pour la version 1.15.2 de minecraft, Snapshot 20w17a, prise ne charge de forge 1.12.2 et 1.15.2 et BungeeCord 1.15.2 - 1.8
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

echo "[?] Que voulez-vous installer ou mettre à jour ?\n"
echo "1 - Vanilla\n"
echo "2 - Snapshot\n"
echo "3 - Spigot\n"
echo "4 - Bukkit\n"
echo "5 - PaperSpigot\n"
echo "6 - Forge 1.15.2\n"
echo "7 - Forge 1.12.2\n"
echo "8 - Sponge\n"
echo "9 - CatServer\n"
echo "10 - Thermos\n"
echo "11 - Bungeecord\n"
echo "12 - Débogage\n"
echo "13 - Info Système\n"
echo "14 - Quitter\n"
echo "Taper le nombre qui correspond à ce que vous voulez installer et appuyer sur entrer."
read installation
case $installation in
1) bash install_scripts/vanilla.sh ;;
2) bash install_scripts/snapshot.sh ;;
3) bash install_scripts/snapshot.sh ;;
4) bash install_scripts/bukkit.sh ;;
5) bash install_scripts/paperspigot.sh ;;
6) bash install_scripts/forge_1.15.2.sh ;;
7) bash install_scripts/forge_1.12.2.sh ;;
8) bash install_scripts/sponge.sh ;;
9) bash install_scripts/catserver.sh ;;
10) bash install_scripts/thermos.sh ;;
11) bash install_scripts/bungeecord.sh ;;
12) bash install_scripts/debug.sh ;;
13) bash install_scripts/debug.sh ;;
14)
# Quiter
echo "Suppression du script..."
cd /home
rm -f script.sh
echo "Script par zendrique https://github.com/zendrique"
echo "Fermture..."
break
;;
404)
echo "404 Not found."
;;
*) echo "Saisie non valide"
esac
