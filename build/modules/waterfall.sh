# Waterfall
clear
echo "Instalation de : Waterfall"
cd /home
echo "Dans quel dossier voulez-vous installer votre serveur ? (ex: serveur1)"
read dossier
echo "Une sauvegarde va être crée dans /home si un serveur et déjà installer et les autres sauvegardes écrasées s’il en existe ctrl + c pour annuler"
sleep 4
rm -f waterfall.zip
zip -r waterfall.zip $dossier/
clear
mkdir $dossier
chmod 777 $dossier/
chmod 777 -R $dossier/
cd $dossier
rm -f Waterfall.jar
rm -f start.sh
rm -f eula.txt
wget https://papermc.io/ci/job/Waterfall/lastSuccessfulBuild/artifact/Waterfall-Proxy/bootstrap/target/Waterfall.jar
clear
echo "Installation de Waterfall..."
touch start.sh && echo "screen -d -m -S waterfall java -jar Waterfall.jar nogui" >> start.sh
chmod 777 Waterfall.jar
chmod 777 start.sh
mkdir plugins
cd /home
chmod 777 -R $dossier/
chmod 777 -R $dossier/*
rm -f info-waterfall.txt
touch info-waterfall.txt
echo "Pour démarer votre serveur faites la commande : sh /home/"$dossier"/start.sh" >> info-waterfall.txt
echo "Pour accéder à votre console taper la commande : screen -r waterfall" >> info-waterfall.txt
echo "Detail de l'installation" >> info-waterfall.txt
echo "Version du proxy : 1.8 - 1.15.2" >> info-waterfall.txt
echo "API : BungeeCord" >> info-waterfall.txt
echo "Dossier d'instalation : /home/"$dossier >> info-waterfall.txt
echo "Dossier des plugins : /home/"$dossier"/plugins" >> info-waterfall.txt
echo "Fichier de démarrage de : start.sh" >> info-waterfall.txt
clear
echo "Terminer !"
echo "Pour démarer votre serveur faites la commande : sh /home/"$dossier"/start.sh"
echo "Pour accéder à votre console taper la commande : screen -r waterfall"
echo "Detail de l'installation"
echo "Version du proxy : 1.8 - 1.15.2"
echo "API : BungeeCord"
echo "Dossier d'instalation : /home/"$dossier
echo "Dossier des plugins : /home/"$dossier"/plugins"
echo "Fichier de démarrage de : start.sh"
echo "Un fichier info-waterfall.txt dans /home a été crée contenant les information afficher si dessue."
