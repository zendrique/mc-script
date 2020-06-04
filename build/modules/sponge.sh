# Sponge
clear
echo "Instalation de : Sponge Forge"
cd /home
echo "Une sauvegarde va être crée dans /home si un serveur et déjà installer et les autres sauvegardes écrasées s’il en existe ctrl + c pour annuler"
sleep 4
rm -f sponge-backup.zip
zip -r sponge-backup.zip sponge/
clear
mkdir sponge
chmod 777 sponge/
chmod 777 -R sponge/
cd sponge
rm -f start.sh
rm -f eula.txt
rm -f forge.jar
rm -f forge-*.jar
rm -R libraries
echo "Téléchargement de forge"
wget https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.12.2-14.23.5.2854/forge-1.12.2-14.23.5.2854-installer.jar
mv forge-*-installer.jar forge-installer.jar
clear
echo "Installation de forge"
java -jar forge-installer.jar --installServer
mv forge-*-universal.jar forge.jar
touch eula.txt && echo "eula=true" >> eula.txt
touch start.sh && echo "screen -d -m -S sponge java -jar forge.jar nogui" >> start.sh
chmod 777 start.sh
chmod 777 forge.jar
clear
echo "Nettoyage..."
rm -f forge-installer.jar
rm -f forge-*-installer.jar.log
rm -f forge-installer.jar.log
echo "Instalation de sponge..."
mkdir mods
chmod 777 mods/
chmod 777 -R mods/
cd mods
rm -f spongeforge-*.jar
wget https://repo.spongepowered.org/maven/org/spongepowered/spongeforge/1.12.2-2838-7.2.2/spongeforge-1.12.2-2838-7.2.2.jar
mv spongeforge-*.jar sponge.jar
chmod 777 sponge.jar
mkdir plugins
chmod 777 plugins/
chmod 777 -R plugins/
cd /home
chmod 777 -R sponge/
chmod 777 -R sponge/*
rm -f info-sponge.txt
touch info-sponge.txt
echo "Pour démarer votre serveur faites la commande : cd /home/sponge && sh start.sh" >> info-sponge.txt
echo "Pour accéder à votre console taper la commande : screen -r sponge" >> info-sponge.txt
echo "Detail de l'installation" >> info-sponge.txt
echo "Version du serveur : 1.12.2" >> info-sponge.txt
echo "API : Sponge Forge, Forge" >> info-sponge.txt
echo "Dossier d'instalation : /home/forge" >> info-sponge.txt
echo "Dossier des mods : /home/forge/mods" >> info-sponge.txt
echo "Dossier des plugins : /home/forge/mods/plugins" >> info-sponge.txt
echo "Fichier de démarrage de : start.sh" >> info-sponge.txt
clear
echo "Terminer !"
echo "Pour démarer votre serveur faites la commande : cd /home/sponge && sh start.sh"
echo "Pour accéder à votre console taper la commande : screen -r sponge"
echo "Detail de l'installation"
echo "Version du serveur : 1.12.2"
echo "API : Sponge Forge, Forge"
echo "Dossier d'instalation : /home/forge"
echo "Dossier des mods : /home/forge/mods"
echo "Dossier des plugins : /home/forge/mods/plugins"
echo "Fichier de démarrage de : start.sh"
echo "Un fichier info-sponge.txt dans /home a été crée contenant les information afficher si dessue."