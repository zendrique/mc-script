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
echo "7 - Airplane"
echo "8 - Purpur"
echo "-------------Moddé-----------------------"
echo "9 - Forge"
echo "10 - Fabric"
echo "11 - Sponge"
echo "-------------Hybride---------------------"
echo "12 - CatServer"
echo "13 - Mohist"
echo "14 - Thermos"
echo "-------------Proxy----------------------"
echo "15 - Bungeecord"
echo "16 - Waterfall"
echo "17 - Travertine"
echo "18 - Hexacord"
echo "19 - Velocity"
echo "20 - FLameCord"
echo "-------------Autre----------------------"
echo "21 - ModPack"
echo "22 - OpenMod"
echo "23 - Débogage"
echo "24 - Info Système"
echo "25 - Quitter"
echo "26 - Mettre à jour mc-script"
echo "27 - Supprimer mc-script"
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
bash $invocation/java_detector.sh 11 Airplane
bash $invocation/backup.sh
bash $invocation/airplane.sh
bash $invocation/pre_conf_serveur.sh 
bash $invocation/file_permission.sh
bash $invocation/fini.sh
;;
8) 
bash $invocation/purpur.sh
bash $invocation/pre_conf_serveur.sh 
bash $invocation/file_permission.sh
bash $invocation/fini.sh
;;
9)
bash $invocation/forge.sh
bash $invocation/pre_conf_serveur.sh 
bash $invocation/file_permission.sh
bash $invocation/fini.sh
;;
10)
bash $invocation/fabric.sh
bash $invocation/pre_conf_serveur.sh 
bash $invocation/file_permission.sh
bash $invocation/fini.sh
;;
11) 
bash $invocation/sponge.sh
bash $invocation/pre_conf_serveur.sh 
bash $invocation/file_permission.sh
bash $invocation/fini.sh
;;
12) 
bash $invocation/catserver.sh
bash $invocation/pre_conf_serveur.sh 
bash $invocation/file_permission.sh
bash $invocation/fini.sh
;;
13)
bash $invocation/mohist.sh
bash $invocation/pre_conf_serveur.sh 
bash $invocation/file_permission.sh
bash $invocation/fini.sh
;;
14) 
bash $invocation/thermos.sh
bash $invocation/pre_conf_serveur.sh 
bash $invocation/file_permission.sh
bash $invocation/fini.sh
;;
15) 
bash $invocation/bungeecord.sh
bash $invocation/file_permission.sh
bash $invocation/fini.sh
;;
16)
bash $invocation/waterfall.sh 
bash $invocation/file_permission.sh
bash $invocation/fini.sh
;;
17)
bash $invocation/travertine.sh
bash $invocation/file_permission.sh
bash $invocation/fini.sh
;;
18)
bash $invocation/hexacord.sh
bash $invocation/file_permission.sh
bash $invocation/fini.sh
;;
19)
bash $invocation/velocity.sh
bash $invocation/file_permission.sh
bash $invocation/fini.sh
;;
20)
bash $invocation/flamecord.sh
bash $invocation/file_permission.sh
bash $invocation/fini.sh
;;
21)
bash $invocation/modpack.sh
bash $invocation/file_permission.sh
bash $invocation/fini.sh
;;
22)
bash $invocation/openMod.sh
bash $invocation/file_permission.sh
bash $invocation/fini.sh
;;
23) 
bash $invocation/debug.sh
;;
24) 
bash $invocation/system_info.sh
;;
25)
bash $invocation/fermeture.sh
;;
26)
bash $invocation/update.sh
;;
27)
bash $invocation/remove.sh
;;
*) 
bash $invocation/saisie_invalide.sh
;;
esac