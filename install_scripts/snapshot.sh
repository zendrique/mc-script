#!/usr/bin/env bash
# Snapshot

echo "Installation du serveur : snapshot"
cd /home
echo "Une sauvegarde va être crée dans /home si un serveur et déjà installer et les autres sauvegardes écrasées s’il en existe ctrl + c pour annuler"
sleep 4
rm -f snapshot-backup.zip
zip -r snapshot-backup.zip snapshot/
clear
mkdir snapshot
chmod 777 snapshot/
chmod 777 -R snapshot/
cd snapshot
rm -f server.jar
rm -f start.sh
rm -f eula.txt
echo "Téléchargement du serveur"
wget https://launcher.mojang.com/v1/objects/0b7e36b084577fb26148c6341d590ac14606db21/server.jar
touch eula.txt && echo "eula=true" >> eula.txt
touch start.sh && echo "screen -d -m -S snapshot java -Xmx1024M -Xms1024M -jar server.jar nogui" >> start.sh
chmod 777 start.sh
chmod 777 server.jar
cd /home
chmod 777 -R snapshot/
clear
echo "Terminer !\n"
echo "Pour démarrer votre serveur faites la commande : cd /home/snapshot && sh start.sh"
echo "Pour accéder à votre console taper la commande : screen -r snapshot"
echo "Détail de l'installation :"
echo "Version du serveur : 20W09A"
echo "API : DatapackAPI"
echo "Dossier d'installation : /home/snapshot"
echo "Fichier de démarrage de : start.sh"