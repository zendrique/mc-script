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
echo "8 - Fabric"
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
echo "19 - Débogage"
echo "20 - Info Système"
echo "21 - Quitter"
echo "22 - Mettre à jour mc-script"
echo "23 - Supprimer mc-script"
read installation
case $installation in
1) 
<INSERT_vanilla>
<INSERT_pre_conf_serveur>
<INSERT_fini>
;;
2) 
<INSERT_snapshot>
<INSERT_pre_conf_serveur>
<INSERT_fini>
;;
3) 
<INSERT_spigot>
<INSERT_pre_conf_serveur>
<INSERT_fini>
;;
4) 
<INSERT_bukkit>
<INSERT_pre_conf_serveur>
<INSERT_fini>
;;
5) 
<INSERT_paperspigot>
<INSERT_pre_conf_serveur>
<INSERT_fini>
;;
6)
<INSERT_tuinity>
<INSERT_pre_conf_serveur>
<INSERT_fini>
;;
7) 
<INSERT_forge>
<INSERT_pre_conf_serveur>
<INSERT_fini>
;;
8)
<INSERT_fabric>
<INSERT_pre_conf_serveur>
<INSERT_fini>
;;
9) 
<INSERT_sponge>
<INSERT_pre_conf_serveur>
<INSERT_fini>
;;
10) 
<INSERT_catserver>
<INSERT_pre_conf_serveur>
<INSERT_fini>
;;
11)
<INSERT_mohist>
<INSERT_pre_conf_serveur>
<INSERT_fini>
;;
12) 
<INSERT_thermos>
<INSERT_pre_conf_serveur>
<INSERT_fini>
;;
13) 
<INSERT_bungeecord>
<INSERT_pre_conf_serveur>
<INSERT_fini>
;;
14)
<INSERT_waterfall>
<INSERT_pre_conf_serveur>
<INSERT_fini>
;;
15)
<INSERT_travertine>
<INSERT_pre_conf_serveur>
<INSERT_fini>
;;
16)
<INSERT_hexacord>
<INSERT_pre_conf_serveur>
<INSERT_fini>
;;
17)
<INSERT_modPack>
<INSERT_fini>
;;
18)
<INSERT_openMod>
<INSERT_fini>
;;
19) 
<INSERT_debug>
;;
20) 
<INSERT_system_info>
;;
21)
<INSERT_fermeture>
;;
22)
<INSERT_update>
;;
23)
<INSERT_remove>
;;
*) 
<INSERT_saisie_invalide>
;;
esac