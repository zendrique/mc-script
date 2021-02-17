#!/usr/bin/env bash

if [ "$EUID" -ne 0 ]; then 
    echo "[!] Veuillez lancer le script en root (via sudo)"
    exit
fi

invocation="/opt/mc-script/script/modules"
final_user=$(cat /opt/mc-script/variable/final_user.txt)
clear

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
echo "18 - Velocity"
echo "-------------Autre----------------------"
echo "19 - ModPack"
echo "20 - OpenMod"
echo "21 - Débogage"
echo "22 - Info Système"
echo "23 - Quitter"
echo "24 - Mettre à jour mc-script"
echo "25 - Supprimer mc-script"
echo "----------------------------------------"
echo "Que voulez-vous faire ?"
read installation
case $installation in
1) 
bash $invocation/vanilla.sh
bash $invocation/pre_conf_serveur.sh 
bash $invocation/file_permission.sh
bash $invocation/fini.sh
;;
2) 
bash $invocation/snapshot.sh
bash $invocation/pre_conf_serveur.sh 
bash $invocation/file_permission.sh
bash $invocation/fini.sh
;;
3) 
bash $invocation/spigot.sh
bash $invocation/pre_conf_serveur.sh 
bash $invocation/file_permission.sh
bash $invocation/fini.sh
;;
4) 
bash $invocation/bukkit.sh
bash $invocation/pre_conf_serveur.sh 
bash $invocation/file_permission.sh
bash $invocation/fini.sh
;;
5) 
bash $invocation/paperspigot.sh
bash $invocation/pre_conf_serveur.sh 
bash $invocation/file_permission.sh
bash $invocation/fini.sh
;;
6)
bash $invocation/tuinity.sh
bash $invocation/pre_conf_serveur.sh 
bash $invocation/file_permission.sh
bash $invocation/fini.sh
;;
7) 
bash $invocation/purpur.sh
bash $invocation/pre_conf_serveur.sh 
bash $invocation/file_permission.sh
bash $invocation/fini.sh
;;
8)
bash $invocation/forge.sh
bash $invocation/pre_conf_serveur.sh 
bash $invocation/file_permission.sh
bash $invocation/fini.sh
;;
9)
bash $invocation/fabric.sh
bash $invocation/pre_conf_serveur.sh 
bash $invocation/file_permission.sh
bash $invocation/fini.sh
;;
10) 
bash $invocation/sponge.sh
bash $invocation/pre_conf_serveur.sh 
bash $invocation/file_permission.sh
bash $invocation/fini.sh
;;
11) 
bash $invocation/catserver.sh
bash $invocation/pre_conf_serveur.sh 
bash $invocation/file_permission.sh
bash $invocation/fini.sh
;;
12)
bash $invocation/mohist.sh
bash $invocation/pre_conf_serveur.sh 
bash $invocation/file_permission.sh
bash $invocation/fini.sh
;;
13) 
bash $invocation/thermos.sh
bash $invocation/pre_conf_serveur.sh 
bash $invocation/file_permission.sh
bash $invocation/fini.sh
;;
14) 
bash $invocation/bungeecord.sh
bash $invocation/file_permission.sh
bash $invocation/fini.sh
;;
15)
bash $invocation/waterfall.sh 
bash $invocation/file_permission.sh
bash $invocation/fini.sh
;;
16)
bash $invocation/travertine.sh
bash $invocation/file_permission.sh
bash $invocation/fini.sh
;;
17)
bash $invocation/hexacord.sh
bash $invocation/file_permission.sh
bash $invocation/fini.sh
;;
18)
bash $invocation/velocity.sh
bash $invocation/file_permission.sh
bash $invocation/fini.sh
;;
19)
bash $invocation/modpack.sh
bash $invocation/file_permission.sh
bash $invocation/fini.sh
;;
20)
bash $invocation/openMod.sh
bash $invocation/file_permission.sh
bash $invocation/fini.sh
;;
21) 
bash $invocation/debug.sh
;;
22) 
bash $invocation/system_info.sh
;;
23)
bash $invocation/fermeture.sh
;;
24)
bash $invocation/update.sh
;;
25)
bash $invocation/remove.sh
;;
*) 
bash $invocation/saisie_invalide.sh
;;
esac