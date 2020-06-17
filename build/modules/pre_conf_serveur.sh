# Pre conf serveur
clear
echo "Quel est le nom du dossier ou se trouve le serveur à configurer ?"
read dossier
cd /home/$dossier
clear
echo "Votre configuration actuelle sera supprimer voulez-vous continuer ? (1 ou 2)" 
select crack in "Oui" "Non"; do
    case $crack in
        Oui ) break;;
        Non ) exit break;;
        esac
done
rm -f server.properties
rm -f spigot.yml
rm -f bukkit.yml
clear
echo "Quel port voulez vous tuilisez ?"
read port
touch server.properties
echo "server-port="$port >> server.properties
clear
echo "Voulez-vous activier les version crack ? (1 ou 2)" 
select crack in "Oui" "Non"; do
    case $crack in
        Oui ) echo "online-mode=false" >> server.properties; break;;
        Non ) echo "online-mode=true" >> server.properties; break;;
        esac
done
clear
echo "Voulez-vous activier la prise en charge de bungeecord ? (1 ou 2)"
touch spigot.yml
echo "settings:" >> spigot.yml
select bungeecord in "Oui" "Non"; do
    case $bungeecord in
        Oui ) echo "  bungeecord=true" >> spigot.yml && echo "online-mode=false" >> server.properties; break;;
        Non ) echo "  bungeecord=false" >> spigot.yml; break;;
        esac
done
clear
echo "Voulez-vous activier le pvp ? (1 ou 2)"
select pvp in "Oui" "Non"; do
    case $pvp in
        Oui ) echo "pvp=true" >> server.properties; break;;
        Non ) echo "pvp=false" >> server.properties; break;;
        esac
done
clear
echo "Voulez-vous activier le nether ? (1 ou 2)"
select nether in "Oui" "Non"; do
    case $nether in
        Oui ) echo "allow-nether=true" >> server.properties; break;;
        Non ) echo "allow-nether=false" >> server.properties; break;;
        esac
done
clear
echo "Voulez-vous activier l'end ? (1 ou 2)"
touch bukkit.yml
echo "settings:" >> bukkit.yml
select end in "Oui" "Non"; do
    case $end in
        Oui ) echo "  allow-end: true" >> bukkit.yml; break;;
        Non ) echo "  allow-end=false" >> bukkit.yml; break;;
        esac
done
clear
echo "Voulez-vous activier les command block ? (1 ou 2)"
select commandBlock in "Oui" "Non"; do
    case $commandBlock in
        Oui ) echo "enable-command-block=true" >> server.properties; break;;
        Non ) echo "allow-nether=false" >> server.properties; break;;
        esac
done
clear
echo "Quel distance de vue voulez-vous ? (6 recommander)"
read vue
echo "view-distance="$vue >> server.properties
clear
echo "Quel reyon de spawn protection voulez vous ? (false = désactiver)"
read spawn
echo "spawn-protection="$spawn >> server.properties
clear
echo "Combien de jouers max voulez-vous ?"
read max
echo "max-players="$max >> server.properties
clear
echo "Commant voulez-vous nomer votre monde ?"
read monde
echo "level-name="$monde >> server.properties
clear
echo "Quel motd voulez-vous ? (ex : mon serveur minecraft à moi)"
read motd
echo "motd"=$motd >> server.properties
clear
echo "Voulez-vous activier la white-list ? (1 ou 2)"
select whiteList in "Oui" "Non"; do
    case $whiteList in
        Oui ) echo "white-list=true" >> server.properties; break;;
        Non ) echo "white-list=false" >> server.properties; break;;
        esac
done
clear
echo "Voulez-vous activier la génration des structures ? (1 ou 2)"
select structures in "Oui" "Non"; do
    case $structures in
        Oui ) echo "generate-structures=true" >> server.properties; break;;
        Non ) echo "generate-structures=false" >> server.properties; break;;
        esac
done
clear
echo "Quel gamemode voulez-vous ? (1, 2, 3 ou 4)"
select gamemode in "Survival" "Creative" "Spectator" "Adventure"; do
    case $gamemode in
        Survival ) echo "gamemode=survival" >> server.properties; break;;
        Creative ) echo "gamemode=creative" >> server.properties; break;;
        Spectator ) echo "gamemode=spectator" >> server.properties; break;;
        Adventure ) echo "gamemode=adventure" >> server.properties; break;;
        esac
done
clear
echo "Quel dificulté voulez-vous ? (1, 2, 3 ou 4)"
select difficulty in "Paisible" "Facile" "Normal" "Difficile"; do
    case $difficulty in
        Paisible ) echo "difficulty=peaceful" >> server.properties; break;;
        Facile ) echo "difficulty=easy" >> server.properties; break;;
        Normal ) echo "difficulty=normal" >> server.properties; break;;
        Difficile ) echo "difficulty=hard" >> server.properties; break;;
        esac
done
clear
echo "Voulez-vous autoriser le fly ? (1 ou 2)"
select fly in "Oui" "Non"; do
    case $fly in
        Oui ) echo "allow-flight=true" >> server.properties; break;;
        Non ) echo "allow-flight=false" >> server.properties; break;;
        esac
done
chmod 777 server.properties
chmod 777 spigot.yml
chmod 777 bukkit.yml
clear
cd /home
echo "Voici votre confuguration :" >> info-$dossier.txt
echo "Dossier du serveur :" >> $dossier info-$dossier.txt
echo "Port de votre serveur :" >> $port info-$dossier.txt
echo "Vesion crack :" >> $crack info-$dossier.txt
echo "Bungeecord :" >> $bungeecord info-$dossier.txt
echo "pvp :" >> $pvp info-$dossier.txt
echo "Nether :" >> $nether info-$dossier.txt
echo "End :" >> $end info-$dossier.txt
echo "Command bolock :" >> $commandBlock info-$dossier.txt
echo  "Distance de vue :" >> $vue info-$dossier.txt
echo "Spawn protection :" >> $spawn info-$dossier.txt
echo "Joueurs max :" >> $max info-$dossier.txt
echo "Nom du monde :" >> $mode info-$dossier.txt
echo "Motd :" >> $motd info-$dossier.txt
echo "White-liste :" >> $whiteList info-$dossier.txt
echo "Génration des structures :" >> $structures info-$dossier.txt
echo "Gamemode :" >> $gamemode info-$dossier.txt
echo "Dificulté :" >> $difficulty info-$dossier.txt
echo "Fly :" >> $fly info-$dossier.txt

clear

echo "Términer !"
echo "Voici votre confuguration :"
echo "Dossier du serveur :" $dossier
echo "Port de votre serveur :" $port
echo "Vesion crack :" $crack
echo "Bungeecord :" $bungeecord
echo "pvp :" $pvp
echo "Nether :" $nether
echo "End :" $end
echo "Command bolock :" $commandBlock
echo  "Distance de vue :" $vue
echo "Spawn protection :" $spawn
echo "Joueurs max :" $max
echo "Nom du monde :" $mode
echo "Motd :" $motd
echo "White-liste :" $whiteList
echo "Génration des structures :" $structures
echo "Gamemode :" $gamemode
echo "Dificulté :" $difficulty
echo "Fly :" $fly
echo "Information sauvegarder dans info-"$dossier".txt"
