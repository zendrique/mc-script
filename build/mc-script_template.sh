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
echo "6 - Forge 1.15.2"
echo "7 - Forge 1.12.2"
echo "8 - Sponge"
echo "9 - CatServer"
echo "10 - Thermos"
echo "11 - Bungeecord"
echo "12 - Waterfall"
echo "13 - Travertine"
echo "14 - Hexacord"
echo "15 - Débogage"
echo "16 - Info Système"
echo "17 - Quitter"
echo "18 - Mettre à jour mc-script"
echo "19 - Supprimer mc-script"
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
<INSERT_fermeture>
;;
18)
<INSERT_update>
;;
19)
<INSERT_remove>
;;
*) echo "404 Not found."
esac
