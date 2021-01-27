#!/usr/bin/env bash

invocation="/opt/modules"

clear

if [ "$EUID" -ne 0 ]; then 
    echo "[!] Veuillez lancer le script en root (via sudo)"
    exit
fi

echo "[?] Que voulez-vous installer ou mettre à jour ?"
echo "Taper le nombre qui correspond à ce que vous voulez installer et appuyer sur entrer."
echo "-------------Vanilla---------------------"
echo "1 - Vanilla"
echo "2 - Snapshot"
echo "3 - Spigot"
echo "4 - Bukkit"
echo "5 - PaperSpigot"
echo "6 - tuinity"
echo "--------------Moddé----------------------"
echo "7 - Forge"
echo "8 - Fabric"
echo "9 - Sponge"
echo "10 - CatServer"
echo "11 - Mohist"
echo "12 - Thermos"
echo "--------------Proxy---------------------"
echo "13 - Bungeecord"
echo "14 - Waterfall"
echo "15 - Travertine"
echo "16 - Hexacord"
echo "-------------Autre----------------------"
echo "17 - ModPack"
echo "18 - OpenMod"
echo "19 - Débogage"
echo "20 - Info Système"
echo "21 - Quitter"
echo "22 - Mettre à jour mc-script"
echo "23 - Supprimer mc-script"
echo "----------------------------------------"
echo "Que voulez-vous faire ?"
read installation
case $installation in
1) 
bash $invocation/vanilla.sh
bash $invocation/pre_conf_serveur.sh
bash $invocation/fini.sh
;;
2) 
bash $invocation/snapshot.sh
bash $invocation/pre_conf_serveur.sh
bash $invocation/fini.sh
;;
3) 
bash $invocation/spigot.sh
bash $invocation/pre_conf_serveur.sh
bash $invocation/fini.sh
;;
4) 
bash $invocation/bukkit.sh
bash $invocation/pre_conf_serveur.sh
bash $invocation/fini.sh
;;
5) 
bash $invocation/paperspigot.sh
bash $invocation/pre_conf_serveur.sh
bash $invocation/fini.sh
;;
6)
bash $invocation/tuinity.sh
bash $invocation/pre_conf_serveur.sh
bash $invocation/fini.sh
;;
7) 
bash $invocation/forge.sh
bash $invocation/pre_conf_serveur.sh
bash $invocation/fini.sh
;;
8)
bash $invocation/fabric.sh
bash $invocation/pre_conf_serveur.sh
bash $invocation/fini.sh
;;
9) 
bash $invocation/sponge.sh
bash $invocation/pre_conf_serveur.sh
bash $invocation/fini.sh
;;
10) 
bash $invocation/catserver.sh
bash $invocation/pre_conf_serveur.sh
bash $invocation/fini.sh
;;
11)
bash $invocation/mohist.sh
bash $invocation/pre_conf_serveur.sh
bash $invocation/fini.sh
;;
12) 
bash $invocation/thermos.sh
bash $invocation/pre_conf_serveur.sh
bash $invocation/fini.sh
;;
13) 
bash $invocation/bungeecord.sh
bash $invocation/fini.sh
;;
14)
bash $invocation/waterfall.sh
bash $invocation/fini.sh
;;
15)
bash $invocation/travertine.sh
bash $invocation/fini.sh
;;
16)
bash $invocation/hexacord.sh
bash $invocation/fini.sh
;;
17)
bash $invocation/modpack.sh
bash $invocation/fini.sh
;;
18)
bash $invocation/openMod.sh
bash $invocation/fini.sh
;;
19) 
bash $invocation/debug.sh
;;
20) 
bash $invocation/system_info.sh
;;
21)
bash $invocation/fermeture.sh
;;
22)
bash $invocation/update
;;
23)
bash $invocation/remove.sh
;;
*) 
bash $invocation/saisie_invalide.sh
;;
esac
