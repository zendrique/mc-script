#!/usr/bin/env bash
#Supporter pour la version 1.15.2 de minecraft, Snapshot 20w17a, prise ne charge de forge 1.12.2 et 1.15.2 et BungeeCord 1.15.2 - 1.8
clear

if [ "$EUID" -ne 0 ]; then 
    echo "[!] Veuillez lancer le script en root (via sudo)"
    exit
fi

{
    echo "[.] Téléchargement des dépendances..."
    apt install nano screen curl zip apt-transport-https ca-certificates dirmngr gnupg software-properties-common -y
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
echo "12 - Waterfall\n"
echo "13 - Travertine\n"
echo "14 - Dexacord\n"
echo "15 - Débogage\n"
echo "15 - Info Système\n"
echo "16 - Quitter\n"
echo "17 - Supprimer mc-script"
echo "Taper le nombre qui correspond à ce que vous voulez installer et appuyer sur entrer."
read installation
case $installation in
1) 
<INSERT_vanilla>
;;
2) 
<INSERT_snapshot>
;;
3) 
<INSERT_spigot>
;;
4) 
<INSERT_bukkit>
;;
5) 
<INSERT_paperspigot>
;;
6) 
<INSERT_forge_1_15_2>
;;
7) 
<INSERT_forge_1_12_2>
;;
8) 
<INSERT_sponge>
;;
9) 
<INSERT_catserver>
;;
10) 
<INSERT_thermos>
;;
11) 
<INSERT_bungeecord>
;;
12)
<INSERT_waterfall>
;;
13)
<INSERT_travertine>
;;
14)
<INSERT_hexacord>
;;
15) 
<INSERT_debug>
;;
16) 
<INSERT_system_info>
;;
17)
break
;;
18)
<INSERT_remove>
;;
*) echo "404 Not found."
esac
