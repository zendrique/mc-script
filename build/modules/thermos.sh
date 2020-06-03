# Thermos
clear
echo "Instalation de : Thermos"
cd /home
echo "Une sauvegarde va être crée dans /home si un serveur et déjà installer et les autres sauvegardes écrasées s’il en existe ctrl + c pour annuler"
sleep 4
rm -f thermos.zip
zip -r thermos.zip thermos/
clear
mkdir thermos
chmod 777 thermos/
chmod 777 -R thermos/
cd thermos
rm -f start.sh
rm -f eula.txt
rm -f Thermos-1.7.10-1614-server.jar
rm -f Thermos.jar
rm -R libraries
clear
echo "Installation de Thermos..."
wget https://github.com/CyberdyneCC/Thermos/releases/download/58/Thermos-1.7.10-1614-server.jar
wget https://github.com/CyberdyneCC/Thermos/releases/download/58/libraries.zip
mv Thermos-1.7.10-*-server.jar Thermos.jar
unzip libraries.zip
rm -f libraries.zip
touch eula.txt && echo "eula=true" >> eula.txt
touch start.sh && echo "screen -d -m -S thermos java -jar Thermos.jar nogui" >> start.sh
mkdir plugins
mkdir mods
cd /home
chmod 777 -R thermos/
rm -f info-thermos.txt
touch info-thermos.txt
echo "Pour démarer votre serveur faites la commande : cd /home/thermos && sh start.sh" >> info-thermos.txt
echo "Pour accéder à votre console taper la commande : screen -r thermos" >> info-thermos.txt
echo "Detail de l'installation" >> info-thermos.txt
echo "Version du serveur : 1.7.10" >> info-thermos.txt
echo "API : SpigotAPI, Forge" >> info-thermos.txt
echo "Dossier d'instalation : /home/thermos" >> info-thermos.txt
echo "Dossier des mods : /home/thermos/mods" >> info-thermos.txt
echo "Dossier des plugins : /home/thermos/plugins" >> info-thermos.txt
echo "Fichier de démarrage de : start.sh" >> info-thermos.txt
clear
echo "Terminer !"
echo "Pour démarer votre serveur faites la commande : cd /home/thermos && sh start.sh"
echo "Pour accéder à votre console taper la commande : screen -r thermos"
echo "Detail de l'installation"
echo "Version du serveur : 1.7.10"
echo "API : SpigotAPI, Forge"
echo "Dossier d'instalation : /home/thermos"
echo "Dossier des mods : /home/thermos/mods"
echo "Dossier des plugins : /home/thermos/plugins"
echo "Fichier de démarrage de : start.sh"
echo "Un fichier info-thermos.txt dans /home a été crée contenant les information afficher si dessue."