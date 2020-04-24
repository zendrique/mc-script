# Forge 1.12.2
clear
echo "Instalation de : Forge 1.12.2"
cd /home
echo "Une sauvegarde va être crée dans /home si un serveur et déjà installer et les autres sauvegardes écrasées s’il en existe ctrl + c pour annuler"
sleep 4
rm -f forge-1.12.2-backup.zip
zip -r forge-1.12.2-backup.zip forge-1.12.2/
clear
mkdir forge-1.12.2
chmod 777 forge-1.12.2/
chmod 777 -R forge-1.12.2/
cd forge-1.12.2
rm -f start.sh
rm -f eula.txt
rm -f forge.jar
rm -f forge-*.jar
rm -R libraries
mkdir mods
chmod 777 mods/
chmod 777 -R mods/
echo "Téléchargement de forge"
wget https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.12.2-14.23.5.2847/forge-1.12.2-14.23.5.2847-installer.jar
clear
mv forge-*-installer.jar forge-installer.jar
echo "Installation de forge"
java -jar forge-installer.jar --installServer
mv forge-*-universal.jar forge.jar
touch eula.txt && echo "eula=true" >> eula.txt
touch start.sh && echo "screen -d -m -S forge-1.12.2 java -jar forge.jar nogui" >> start.sh
chmod 777 start.sh
chmod 777 forge.jar
echo "Nettoyage..."
rm -r forge-installer.jar
rm -f forge-*-installer.jar.log
rm -f forge-installer.jar.log
cd /home
chmod 777 -R forge-1.12.2/
clear
echo "Terminer !\n"
echo "Pour démarer votre serveur faites la commande : cd /home/forge-1.12.2 && sh start.sh"
echo "Pour accéder à votre console taper la commande : screen -r forge-1.12.2"
echo "Detail de l'installation"
echo "Version du serveur : 1.12.2"
echo "API : Forge"
echo "Dossier d'instalation : /home/forge-1.12.2"
echo "Fichier de démarrage de : start.sh"
