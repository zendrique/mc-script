# Vanilla
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
touch start.sh && echo "screen -d -m -S vanilla java -jar server.jar nogui" >> start.sh
chmod 777 start.sh
chmod 777 server.jar
cd /home
chmod 777 -R vanilla/
chmod 777 -R vanilla/*
rm -f info-vanilla.txt
touch info-vanilla.txt
echo "Pour démarrer votre serveur faites la commande : sh /home/vanilla/start.sh" >> info-vanilla.txt
echo "Pour accéder à votre console taper la commande : screen -r vanilla" >> info-vanilla.txt
echo "Détail de l'installation :" >> info-vanilla.txt
echo "Version du serveur : 1.15.2" >> info-vanilla.txt
echo "API : DatapackAPI" >> info-vanilla.txt
echo "Dossier d'installation : /home/vanilla" >> info-vanilla.txt
echo "Fichier de démarrage de : start.sh" >> info-vanilla.txt
clear
echo "Terminer !"
echo "Pour démarrer votre serveur faites la commande : sh /home/vanilla/start.sh"
echo "Pour accéder à votre console taper la commande : screen -r vanilla"
echo "Détail de l'installation :"
echo "Version du serveur : 1.15.2"
echo "API : DatapackAPI"
echo "Dossier d'installation : /home/vanilla"
echo "Fichier de démarrage de : start.sh"
echo "Un fichier info-vanilla.txt dans /home a été crée contenant les information afficher si dessue."