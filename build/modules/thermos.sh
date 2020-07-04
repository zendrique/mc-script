# Thermos
clear
echo "Instalation de : Thermos"
cd /home
echo "Dans quel dossier voulez-vous installer votre serveur ? (ex: serveur1)"
read dossier
echo "Une sauvegarde va être crée dans /home si un serveur et déjà installer et les autres sauvegardes écrasées s’il en existe ctrl + c pour annuler"
sleep 4
rm -f $dossier-backup.zip
zip -r $dossier-backup.zip $dossier/
clear
mkdir $dossier
chmod 777 $dossier/
chmod 777 -R $dossier/
cd $dossier
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
touch start.sh && echo "screen -d -m -S "$dossier" java -jar Thermos.jar nogui" >> start.sh
chmod 777 Thermos.jar
chmod 777 start.sh
mkdir plugins
mkdir mods
cd /home
chmod 777 -R $dossier/
chmod 777 -R $dossier/*
rm -f info-$dossier.txt
touch info-$dossier.txt
echo "Pour démarer votre serveur faites la commande : cd /home/"$dossier" && sh start.sh" >> info-$dossier.txt
echo "Pour accéder à votre console taper la commande : screen -r" $dossier >> info-$dossier.txt
echo "Detail de l'installation" >> info-$dossier.txt
echo "Version du serveur : 1.7.10" >> info-$dossier.txt
echo "API : SpigotAPI, Forge" >> info-$dossier.txt
echo "Dossier d'instalation : /home/"$dossier >> info-$dossier.txt
echo "Dossier des mods : /home/"$dossier"/mods" >> info-$dossier.txt
echo "Dossier des plugins : /home/"$dossier"/plugins" >> info-$dossier.txt
echo "Fichier de démarrage de : start.sh" >> info-$dossier.txt
clear
echo "Terminer !"
echo "Pour démarer votre serveur faites la commande : cd /home/"$dossier" && sh start.sh"
echo "Pour accéder à votre console taper la commande : screen -r" $dossier
echo "Detail de l'installation"
echo "Version du serveur : 1.7.10"
echo "API : SpigotAPI, Forge"
echo "Dossier d'instalation : /home/"$dossier
echo "Dossier des mods : /home/"$dossier"/mods"
echo "Dossier des plugins : /home/"$dossier"/plugins"
echo "Fichier de démarrage de : start.sh"
echo "Un fichier info-"$dossier".txt dans /home a été crée contenant les information afficher si dessue."
