# CatServer
clear
echo "Instalation de : CatServer"
cd /home
echo "Dans quel dossier voulez-vous installer votre serveur ? (ex: serveur1)"
read dossier
echo "Une sauvegarde va être crée dans /home si un serveur et déjà installer et les autres sauvegardes écrasées s’il en existe ctrl + c pour annuler"
sleep 4
rm -f catServer-backup.zip
zip -r catserver-backup.zip $dossier/
clear
mkdir $dossier
chmod 777 $dossier/
chmod 777 -R $dossier/
cd $dossier
rm -f start.sh
rm -f eula.txt
rm -f catserver.jar
rm -f catserver-*-universal.jar
echo "Téléchargement de CatServer..."
wget https://github.com/Luohuayu/CatServer/releases/download/20.06.01/CatServer-de043b8-universal.jar
mv CatServer-*-universal.jar CatServer.jar
chmod 777 CatServer.jar
clear
echo "Installation de catserver..."
touch eula.txt && echo "eula=true" >> eula.txt
touch start.sh && echo "screen -d -m -S catserver java -jar CatServer.jar nogui" >> start.sh
chmod 777 start.sh
chmod 777 CatServer.jar
mkdir plugins
mkdir mods
cd /home
chmod 777 -R $dossier/
chmod 777 -R $dossier/*
rm -f info-catserver.txt
echo "Pour démarer votre serveur faites la commande : sh /home/"$dossier"/start.sh" >> info-catserver.txt
echo "Pour accéder à votre console taper la commande : screen -r catserver" >> info-catserver.txt
echo "Detail de l'installation" >> info-catserver.txt
echo "Version du serveur : 1.12.2" >> info-catserver.txt
echo "API : SpigotAPI, Forge" >> info-catserver.txt
echo "Dossier d'instalation : /home/"$dossier >> info-catserver.txt
echo "Dossier des mods : /home/"$dossier"/mods" >> info-catserver.txt
echo "Dossier des plugins : /home/"$dossier"/plugins" >> info-catserver.txt
echo "Fichier de démarrage de : start.sh" >> info-catserver.txt
clear
echo "Terminer !"
echo "Pour démarer votre serveur faites la commande : sh /home/"$dossier"/start.sh"
echo "Pour accéder à votre console taper la commande : screen -r catserver"
echo "Detail de l'installation"
echo "Version du serveur : 1.12.2"
echo "API : SpigotAPI, Forge"
echo "Dossier d'instalation : /home/"$dossier""
echo "Dossier des mods : /home/"$dossier"/mods"
echo "Dossier des plugins : /home/"$dossier"/plugins"
echo "Fichier de démarrage de : start.sh"
echo "Un fichier info-catserver.txt dans /home a été crée contenant les information afficher si dessue."
