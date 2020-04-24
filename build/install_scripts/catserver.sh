# CatServer
clear
echo "Instalation de : CatServer"
cd /home
echo "Une sauvegarde va être crée dans /home si un serveur et déjà installer et les autres sauvegardes écrasées s’il en existe ctrl + c pour annuler"
sleep 4
rm -f CatServer-backup.zip
zip -r catserver-backup.zip catserver/
clear
mkdir catserver
chmod 777 catserver/
chmod 777 -R catserver/
cd catserver
rm -f start.sh
rm -f eula.txt
rm -f catserver.jar
rm -f catserver-*-universal.jar
echo "Téléchargement de CatServer..."
wget https://github.com/Luohuayu/CatServer/releases/download/20.03.29/CatServer-3440193-universal.jar
mv CatServer-*-universal.jar CatServer.jar
chmod 777 CatServer.jar
clear
echo "Installation de catserver..."
touch eula.txt && echo "eula=true" >> eula.txt
touch start.sh && echo "screen -d -m -S catserver java -jar CatServer.jar nogui" >> start.sh
chmod 777 start.sh
mkdir plugins
mkdir mods
cd /home
chmod 777 -R catserver/
clear
echo "Terminer !\n"
echo "Pour démarer votre serveur faites la commande : cd /home/catserver && sh start.sh"
echo "Pour accéder à votre console taper la commande : screen -r catserver"
echo "Detail de l'installation"
echo "Version du serveur : 1.12.2"
echo "API : SpigotAPI, Forge"
echo "Dossier d'instalation : /home/catserver"
echo "Dossier des mods : /home/catserver/mods"
echo "Dossier des plugins : /home/catserver/plugins"
echo "Fichier de démarrage de : start.sh"

