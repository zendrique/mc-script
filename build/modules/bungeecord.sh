# Bungeecord
clear
echo "Instalation de : BungeeCord"
cd /home
echo "Dans quel dossier voulez-vous installer votre serveur ? (ex: serveur1)"
read dossier
echo "Une sauvegarde va être crée dans /home si un serveur et déjà installer et les autres sauvegardes écrasées s’il en existe ctrl + c pour annuler"
sleep 4
rm -f bungeecord.zip
zip -r bungeecord.zip $dossier/
clear
mkdir $dossier
chmod 777 $dossier/
chmod 777 -R $dossier/
cd $dossier
rm -f BungeeCord.jar
rm -f start.sh
rm -f eula.txt
wget https://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/bootstrap/target/BungeeCord.jar
clear
echo "Installation de BungeeCord..."
touch start.sh && echo "screen -d -m -S bungeecord java -jar BungeeCord.jar nogui" >> start.sh
mkdir plugins
chmod 777 BungeeCord.jar
chmod 777 start.sh
cd /home
chmod 777 -R $dossier/
chmod 777 -R $dossier/*
rm -f info-bungeecord.txt
touch info-bungeecord.txt
echo "Pour démarer votre serveur faites la commande : sh /home/"$dossier"/start.sh" >> info-bungeecord.txt
echo "Pour accéder à votre console taper la commande : screen -r bungeecord" >> info-bungeecord.txt
echo "Detail de l'installation" >> info-bungeecord.txt
echo "Version du proxy : 1.8 - 1.15.2" >> info-bungeecord.txt
echo "API : BungeeCord" >> info-bungeecord.txt
echo "Dossier d'instalation : /home/"$dossier >> info-bungeecord.txt
echo "Dossier des plugins : /home/"$dossier"/plugins" >> info-bungeecord.txt
echo "Fichier de démarrage de : start.sh" >> info-bungeecord.txt
clear
echo "Terminer !"
echo "Pour démarer votre serveur faites la commande : sh /home/"$dossier"/start.sh"
echo "Pour accéder à votre console taper la commande : screen -r bungeecord"
echo "Detail de l'installation"
echo "Version du proxy : 1.8 - 1.15.2"
echo "API : BungeeCord"
echo "Dossier d'instalation : /home/"$dossier
echo "Dossier des plugins : /home/"$dossier"/plugins"
echo "Fichier de démarrage de : start.sh"
echo "Un fichier info-bungeecord.txt dans /home a été crée contenant les information afficher si dessue."
