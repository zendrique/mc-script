echo "Installation du serveur : Vanilla"
cd /home
echo "Une sauvegarde va être crée dans /home si un serveur et déjà installer et les autres sauvegardes écrasées s’il en existe ctrl + c pour annuler"
sleep 4
rm -f vanilla-backup.zip
zip -r vanilla-backup.zip vanilla/
clear
mkdir vanilla
chmod 777 vanilla/
chmod 777 -R vanilla/
cd vanilla
rm -f server.jar
rm -f start.sh
rm -f eula.txt
echo "Téléchargement du serveur"
wget https://launcher.mojang.com/v1/objects/bb2b6b1aefcd70dfd1892149ac3a215f6c636b07/server.jar
touch eula.txt && echo "eula=true" >> eula.txt
touch start.sh && echo "screen -d -m -S vanilla java -Xmx1024M -Xms1024M -jar server.jar nogui" >> start.sh
chmod 777 start.sh
chmod 777 server.jar
cd /home
chmod 777 -R vanilla/
clear
echo "Terminer !\n"
echo "Pour démarrer votre serveur faites la commande : cd /home/vanilla && sh start.sh"
echo "Pour accéder à votre console taper la commande : screen -r vanilla"
echo "Détail de l'installation :"
echo "Version du serveur : 1.15.2"
echo "API : DatapackAPI"
echo "Dossier d'installation : /home/vanilla"
echo "Fichier de démarrage de : start.sh"
