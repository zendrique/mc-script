#!/usr/bin/env bash
#Supporter pour la version 1.15.2 de minecraft et prise ne charge de forge 1.12.2
#commande lencement du script
# sudo -s
#cd /home && wget ...
#chmod +x script.sh && sh script.sh

echo "Chargement..."
sleep 2
echo "Mise à jour du système..."
apt update && apt upgrade -y

clear

echo "Téléchargement des dépendance et logiciel utile..."

apt install nano -y
apt install screen -y
apt install curl -y
apt install git -y
apt install zip -y
apt install default-jre -y
apt install openjdk-8-jre-headless -y
apt install default-jdk -y
clear

echo "Que voulez-vous installer ?\n"
echo "1 - Vanilla\n"
echo "2 - Snapshot\n"
echo "3 - Spigot\n"
echo "4 - Bukkit\n"
echo "5 - PaperSpigot\n"
echo "6 - Forge 1.15.2\n"
echo "7 - Forge 1.12.2\n"
echo "8 - Sponge\n"
echo "9 - CatServer\n"
echo "10 - Info Système\n"
echo "11 - Quitter\n"
echo "Taper le nombre qui correspond à ce que vous voulez installer et appuyer sur entrer."
read installation
case $installation in
1)
# Vanilla
clear
echo "Installation du serveur : Vanilla"
cd /home
mkdir vanilla
cd vanilla
echo "Téléchargement du serveur"
wget https://launcher.mojang.com/v1/objects/bb2b6b1aefcd70dfd1892149ac3a215f6c636b07/server.jar
touch eula.txt && echo "eula=true" >> eula.txt
touch start.sh && echo "screen -d -m -S vanilla java -Xmx1024M -Xms1024M -jar server.jar nogui" >> start.sh
chmod +x start.sh
echo "Terminer !\n"
echo "Pour démarrer votre serveur faites la commande : cd /home/vanilla && sh start.sh"
echo "Pour ecceder à votre console taper la commande : screen -r vanilla"
echo "Détail de l'installation :"
echo "Version du serveur : 1.15.2"
echo "API : DatapackAPI"
echo "Dossier d'installation : /home/vanilla"
echo "Fichier de démarrage de : start.sh"
;;
2)
# Snapshot
clear
echo "Installation du serveur : snapshot"
cd /home
mkdir snapshot
cd snapshot
echo "Téléchargement du serveur"
wget https://launcher.mojang.com/v1/objects/6f1e5ae00b938bbe15560b7174be7a3b4c78c450/server.jar
touch eula.txt && echo "eula=true" >> eula.txt
touch start.sh && echo "screen -d -m -S snapshot java -Xmx1024M -Xms1024M -jar server.jar nogui" >> start.sh
chmod +x start.sh
echo "Terminer !\n"
echo "Pour démarrer votre serveur faites la commande : cd /home/snapshot && sh start.sh"
echo "Pour ecceder à votre console taper la commande : screen -r snapshot"
echo "Détail de l'installation :"
echo "Version du serveur : 20W09A"
echo "API : DatapackAPI"
echo "Dossier d'installation : /home/snapshot"
echo "Fichier de démarrage de : start.sh"
;;
3)
# Spigot
clear
echo "Installation du serveur : Spigot"
cd /home
mkdir spigot
cd spigot
mkdir buildtools
cd buildtools
echo "Téléchargement de BuildTools..."
wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
git config --global --unset core.autocrlf
java -jar BuildTools.jar --rev latest
mv spigot-15.2.jar /home/spigot
cd /home/spigot
touch eula.txt && echo "eula=true" >> eula.txt
touch start.sh && echo "screen -d -m -S spigot java -Xms3G -Xmx3G -XX:+UseConcMarkSweepGC -jar spigot.jar nogui" >> start.sh
chmod +x start.sh
echo "Nettoyage..."
rm -R buildtools
clear
echo "Terminer !\n"
echo "Pour démarer votre serveur faites la commande : cd /home/spigot && sh start.sh"
echo "Pour ecceder à votre console taper la commande : screen -r spigot"
echo "Detail de l'installation :"
echo "Version du serveur : 1.15.2"
echo "API : SpigotAPI"
echo "Dossier d'instalation : /home/spigot"
echo "Fichier de démarrage de : start.sh"
;;
4)
# Bukkit
clear
echo "Instalation de : Bukkit"
cd /home
mkdir bukkit
cd bukkit
mkdir buildtools
cd buildtools
echo "Téléchargement de BuildTools..."
wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
git config --global --unset core.autocrlf
java -jar BuildTools.jar --rev latest --compile craftbukkit
mv craftbukkit-1.15.2.jar /home/bukkit
cd /home/bukkit
touch eula.txt && echo "eula=true" >> eula.txt
touch start.sh && echo "screen -d -m -S bukkit java -Xms3G -Xmx3G -XX:+UseConcMarkSweepGC -jar craftbukkit-1.15.2.jar nogui" >> start.sh
chmod +x start.sh
echo "Nettoyage..."
rm -R buildtools
clear
echo "Terminer !\n"
echo "Pour démarer votre serveur faites la commande : cd /home/bukkit && sh start.sh"
echo "Pour ecceder à votre console taper la commande : screen -r bukkit"
echo "Detail de l'installation :"
echo "Version du serveur : 1.15.2"
echo "API : SpigotAPI"
echo "Dossier d'instalation : /home/bukkit"
echo "Fichier de démarrage de : start.sh"
;;
5)
# PaperSpigot
clear
echo "Instalation de : PaperSpigot"
cd /home
mkdir paperspigot
cd paperspigot
echo "Téléchargement de paperspigot..."
wget https://papermc.io/ci/job/Paper-1.15/lastSuccessfulBuild/artifact/paperclip.jar
touch eula.txt && echo "eula=true" >> eula.txt
touch start.sh && echo "screen -d -m -S paperspigot java -Xms3G -Xmx3G -XX:+UseConcMarkSweepGC -jar paperclip.jar nogui" >> start.sh
chmod +x start.sh
clear
echo "Terminer !\n"
echo "Pour démarer votre serveur faites la commande : cd /home/paperspigot && sh start.sh"
echo "Pour ecceder à votre console taper la commande : screen -r paperspigot"
echo "Detail de l'installation :"
echo "Version du serveur : 1.15.2"
echo "API : SpigotAPI"
echo "Dossier d'instalation : /home/paperspigot"
echo "Fichier de démarrage de : start.sh"
;;
6)
# Forge 1.15.2
clear
echo "Instalation de : Forge 1.15.2"
cd /home
mkdir forge-1.15.2
cd forge-1.15.2
mkdir mods
echo "Téléchargement de forge"
wget https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.15.2-31.1.18/forge-1.15.2-31.1.18-installer.jar
clear
echo "Installation de forge 1.15.2"
java -jar forge-1.15.2-31.1.18-installer.jar --installServer
touch eula.txt && echo "eula=true" >> eula.txt
touch start.sh && echo "screen -d -m -S forge-1.15.2 java -jar forge-1.15.2-31.1.18.jar nogui" >> start.sh
chmod +x start.sh
echo "Nettoyage..."
rm -R forge-1.15.2-31.1.18-installer.jar
clear
echo "Terminer !\n"
echo "Pour démarer votre serveur faites la commande : cd /home/forge-1.15.2 && sh start.sh"
echo "Pour ecceder à votre console taper la commande : screen -r forge-1.15.2"
echo "Detail de l'installation :"
echo "Version du serveur : 1.15.2"
echo "API : Forge"
echo "Dossier d'instalation : /home/forge-1.15.2"
echo "Fichier de démarrage de : start.sh"
;;
7)
# Forge 1.12.2
clear
echo "Instalation de : Forge 1.12.2"
cd /home
mkdir forge-1.12.2
cd forge-1.12.2
mkdir mods
echo "Téléchargement de forge"
wget https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.12.2-14.23.5.2847/forge-1.12.2-14.23.5.2847-installer.jar
clear
echo "Installation de forge"
java -jar forge-1.12.2-14.23.5.2847-installer.jar --installServer
touch eula.txt && echo "eula=true" >> eula.txt
touch start.sh && echo "screen -d -m -S forge-1.12.2 java -jar forge-1.12.2-14.23.5.2847-universal.jar nogui" >> start.sh
chmod +x start.sh
echo "Nettoyage..."
rm -R forge-1.12.2-14.23.5.2847-universal.jar
clear
echo "Terminer !\n"
echo "Pour démarer votre serveur faites la commande : cd /home/forge-1.12.2 && sh start.sh"
echo "Pour ecceder à votre console taper la commande : screen -r forge-1.12.2"
echo "Detail de l'installation"
echo "Version du serveur : 1.12.2"
echo "API : Forge"
echo "Dossier d'instalation : /home/forge-1.12.2"
echo "Fichier de démarrage de : start.sh"
;;
8)
# Sponge
clear
echo "Instalation de : Sponge Forge"
cd /home
mkdir sponge
cd sponge
echo "Téléchargement de forge"
wget https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.12.2-14.23.5.2847/forge-1.12.2-14.23.5.2847-installer.jar
clear
echo "Installation de forge"
java -jar forge-1.12.2-14.23.5.2847-installer.jar --installServer
touch eula.txt && echo "eula=true" >> eula.txt
touch start.sh && echo "screen -d -m -S sponge java -jar forge-1.12.2-14.23.5.2847-universal.jar nogui" >> start.sh
chmod +x start.sh
clear
echo "Nettoyage..."
rm -R forge-1.12.2-14.23.5.2847-installer.jar
rm -f rm -f forge-1.12.2-14.23.5.2847-installer.jar.log
echo "Instalation de sponge..."
mkdir mods
cd mods
wget https://repo.spongepowered.org/maven/org/spongepowered/spongeforge/1.12.2-2838-7.1.9/spongeforge-1.12.2-2838-7.1.9.jar
mkdir plugins
clear
echo "Terminer !\n"
echo "Pour démarer votre serveur faites la commande : cd /home/sponge && sh start.sh"
echo "Pour ecceder à votre console taper la commande : screen -r sponge"
echo "Detail de l'installation"
echo "Version du serveur : 1.12.2"
echo "API : Sponge Forge, Forge"
echo "Dossier d'instalation : /home/forge"
echo "Dossier des mods : /home/forge/mods"
echo "Dossier des plugins : /home/forge/mods/plugins"
echo "Fichier de démarrage de : start.sh"
;;
9)
# CatServer
clear
cd /home
mkdir catserver
cd catserver
echo "Téléchargement de CatServer..."
wget https://github.com/Luohuayu/CatServer/releases/download/20.02.28/CatServer-05e5dcd-universal.jar
clear
echo "Installation de catserver"
touch eula.txt && echo "eula=true" >> eula.txt
touch start.sh && echo "screen -d -m -S catserver java -jar CatServer-05e5dcd-universal.jar nogui" >> start.sh
chmod +x start.sh
mkdir plugins
mkdir mods
clear
echo "Terminer !\n"
echo "Pour démarer votre serveur faites la commande : cd /home/catserver && sh start.sh"
echo "Pour ecceder à votre console taper la commande : screen -r catserver"
echo "Detail de l'installation"
echo "Version du serveur : 1.12.2"
echo "API : SpigotAPI, Forge"
echo "Dossier d'instalation : /home/catserver"
echo "Dossier des mods : /home/catserver/mods"
echo "Dossier des plugins : /home/catserver/plugins"
echo "Fichier de démarrage de : start.sh"
;;
10)
# Info systéme
clear
echo "Votre Système :"
uname -a
echo "version du script : 0.1\n"
echo "contributeur : zendrique"
echo "Se script est concue pour fonctionner avec les systémes d'exploitation utilisant comment gestionnaire de packet apt"
echo "nous recommendons d'utiliser debian ou ubuntu."
;;
11)
# Quiter
echo "Suppression du script..."
cd /home
rm -f script.sh
echo "Script par zendrique https://github.com/zendrique"
echo "Fermture..."
break
;;
*) echo "Saisie non valide"
;;
esac
