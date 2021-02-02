#!/usr/bin/env bash

invocation="/opt/mc-script/script/modules"

clear

if [ "$EUID" -ne 0 ]; then 
    echo "[!] Veuillez lancer le script en root (via sudo)"
    exit
fi

echo "[?] Que voulez-vous installer où mettre à jour ?"
echo "Taper le nombre qui correspond à ce que vous voulez installer et appuyer sur entrer."
echo "-------------Vanilla---------------------"
echo "1 - Vanilla"
echo "2 - Snapshot"
echo "3 - Spigot"
echo "4 - Bukkit"
echo "5 - PaperSpigot"
echo "6 - Tuinity"
echo "7 - Purpur"
echo "--------------Moddé----------------------"
echo "8 - Forge"
echo "9 - Fabric"
echo "10 - Sponge"
echo "11 - CatServer"
echo "12 - Mohist"
echo "13 - Thermos"
echo "--------------Proxy---------------------"
echo "14 - Bungeecord"
echo "15 - Waterfall"
echo "16 - Travertine"
echo "17 - Hexacord"
echo "-------------Autre----------------------"
echo "18 - ModPack"
echo "19 - OpenMod"
echo "20 - Débogage"
echo "21 - Info Système"
echo "22 - Quitter"
echo "23 - Mettre à jour mc-script"
echo "24 - Supprimer mc-script"
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
bash $invocation/purpur.sh
bash $invocation/pre_conf_serveur.sh
bash $invocation/fini.sh
;;
8)
bash $invocation/forge.sh
bash $invocation/pre_conf_serveur.sh
bash $invocation/fini.sh
;;
9)
bash $invocation/fabric.sh
bash $invocation/pre_conf_serveur.sh
bash $invocation/fini.sh
;;
10) 
bash $invocation/sponge.sh
bash $invocation/pre_conf_serveur.sh
bash $invocation/fini.sh
;;
11) 
bash $invocation/catserver.sh
bash $invocation/pre_conf_serveur.sh
bash $invocation/fini.sh
;;
12)
bash $invocation/mohist.sh
bash $invocation/pre_conf_serveur.sh
bash $invocation/fini.sh
;;
13) 
bash $invocation/thermos.sh
bash $invocation/pre_conf_serveur.sh
bash $invocation/fini.sh
;;
14) 
bash $invocation/bungeecord.sh
bash $invocation/fini.sh
;;
15)
bash $invocation/waterfall.sh
bash $invocation/fini.sh
;;
16)
bash $invocation/travertine.sh
bash $invocation/fini.sh
;;
17)
bash $invocation/hexacord.sh
bash $invocation/fini.sh
;;
18)
bash $invocation/modpack.sh
bash $invocation/fini.sh
;;
19)
bash $invocation/openMod.sh
bash $invocation/fini.sh
;;
20) 
bash $invocation/debug.sh
;;
21) 
bash $invocation/system_info.sh
;;
22)
bash $invocation/fermeture.sh
;;
23)
bash $invocation/update.sh
;;
24)
bash $invocation/remove.sh
;;
*) 
bash $invocation/saisie_invalide.sh
;;
esac