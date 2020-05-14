#!/usr/bin/env bash
#Supporter pour la version 1.15.2 de minecraft, Snapshot 20w17a, prise ne charge de forge 1.12.2 et 1.15.2 et BungeeCord 1.15.2 - 1.8
clear

echo "[?] Que voulez-vous installer ou mettre à jour ?"
echo "Taper le nombre qui correspond à ce que vous voulez installer et appuyer sur entrer."
echo "1 - Vanilla"
echo "2 - Snapshot"
echo "3 - Spigot"
echo "4 - Bukkit"
echo "5 - PaperSpigot"
echo "6 - tuinity"
echo "7 - Forge 1.15.2"
echo "8 - Forge 1.12.2"
echo "9 - Sponge"
echo "10 - CatServer"
echo "11 - Thermos"
echo "12 - Bungeecord"
echo "13 - Waterfall"
echo "14 - Travertine"
echo "15 - Hexacord"
echo "16 - Débogage"
echo "17 - Info Système"
echo "18 - Quitter"
echo "19 - Mettre à jour mc-script"
echo "20 - Supprimer mc-script"
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
<INSERT_tuinity>
;;
7) 
<INSERT_forge_1_15_2>
;;
8) 
<INSERT_forge_1_12_2>
;;
9) 
<INSERT_sponge>
;;
10) 
<INSERT_catserver>
;;
11) 
<INSERT_thermos>
;;
12) 
<INSERT_bungeecord>
;;
13)
<INSERT_waterfall>
;;
14)
<INSERT_travertine>
;;
15)
<INSERT_hexacord>
;;
16) 
<INSERT_debug>
;;
17) 
<INSERT_system_info>
;;
18)
<INSERT_fermeture>
;;
19)
<INSERT_update>
;;
20)
<INSERT_remove>
;;
*) echo "404 Not found."
esac
