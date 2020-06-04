#!/usr/bin/env bash
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
echo "11 - Mohist"
echo "12 - Thermos"
echo "13 - Bungeecord"
echo "14 - Waterfall"
echo "15 - Travertine"
echo "16 - Hexacord"
echo "17 - ModPack"
echo "18 - Débogage"
echo "19 - Info Système"
echo "20 - Quitter"
echo "21 - Mettre à jour mc-script"
echo "22 - Supprimer mc-script"
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
<INSERT_mohist>
;;
12) 
<INSERT_thermos>
;;
13) 
<INSERT_bungeecord>
;;
14)
<INSERT_waterfall>
;;
15)
<INSERT_travertine>
;;
16)
<INSERT_hexacord>
;;
17)
<INSERT_modPack>
;;
18) 
<INSERT_debug>
;;
19) 
<INSERT_system_info>
;;
20)
<INSERT_fermeture>
;;
21)
<INSERT_update>
;;
22)
<INSERT_remove>
;;
*) echo "404 Not found. 'bash /home/mc-script.sh' pour redémarrer le script"
esac
