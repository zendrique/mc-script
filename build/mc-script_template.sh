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
echo "7 - Forge"
echo "8 - Sponge"
echo "9 - CatServer"
echo "10 - Mohist"
echo "11 - Thermos"
echo "12 - Bungeecord"
echo "13 - Waterfall"
echo "14 - Travertine"
echo "15 - Hexacord"
echo "16 - ModPack"
echo "17 - OpenMod"
echo "18 - Débogage"
echo "19 - Info Système"
echo "20 - Quitter"
echo "21 - Mettre à jour mc-script"
echo "22 - Supprimer mc-script"
read installation
case $installation in
1) 
<INSERT_vanilla>
<INSERT_fini>
;;
2) 
<INSERT_snapshot>
<INSERT_fini>
;;
3) 
<INSERT_spigot>
<INSERT_fini>
;;
4) 
<INSERT_bukkit>
<INSERT_fini>
;;
5) 
<INSERT_paperspigot>
<INSERT_fini>
;;
6)
<INSERT_tuinity>
<INSERT_fini>
;;
7) 
<INSERT_forge>
<INSERT_fini>
;;
;;
8) 
<INSERT_sponge>
<INSERT_fini>
;;
9) 
<INSERT_catserver>
<INSERT_fini>
;;
10)
<INSERT_mohist>
<INSERT_fini>
;;
11) 
<INSERT_thermos>
<INSERT_fini>
;;
12) 
<INSERT_bungeecord>
<INSERT_fini>
;;
13)
<INSERT_waterfall>
<INSERT_fini>
;;
14)
<INSERT_travertine>
<INSERT_fini>
;;
15)
<INSERT_hexacord>
<INSERT_fini>
;;
16)
<INSERT_modPack>
<INSERT_fini>
;;
17)
<INSERT_openMod>
<INSERT_fini>
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
*) 
<INSERT_saisie_invalide>
;;
esac