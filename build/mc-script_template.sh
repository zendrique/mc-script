#!/usr/bin/env bash
clear

if [ "$EUID" -ne 0 ]; then 
    echo "[!] Veuillez lancer le script en root (via sudo)"
    exit
fi

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
echo "18 - OpenMod"
echo "19 - Préconfigurer votre serveur"
echo "20 - Débogage"
echo "21 - Info Système"
echo "22 - Quitter"
echo "23 - Mettre à jour mc-script"
echo "24 - Supprimer mc-script"
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
<INSERT_openMod>
;;
19)
<INSERT_pre_conf_serveur>
;;
20) 
<INSERT_debug>
;;
21) 
<INSERT_system_info>
;;
22)
<INSERT_fermeture>
;;
23)
<INSERT_update>
;;
24)
<INSERT_remove>
;;
*) 
<INSERT_saisie_invalide>
;;
esac