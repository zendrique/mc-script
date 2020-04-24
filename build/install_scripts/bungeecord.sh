# Bungeecord
clear
echo "Instalation de : BungeeCord"
cd /home
echo "Une sauvegarde va être crée dans /home si un serveur et déjà installer et les autres sauvegardes écrasées s’il en existe ctrl + c pour annuler"
sleep 4
rm -f bungeecord.zip
zip -r bungeecord.zip bungeecord/
clear
mkdir bungeecord
chmod 777 bungeecord/
chmod 777 -R bungeecord/
cd bungeecord
rm -f BungeeCord.jar
rm -f start.sh
rm -f eula.txt
wget https://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/bootstrap/target/BungeeCord.jar
clear
echo "Installation de BungeeCord..."
touch start.sh && echo "screen -d -m -S bungeecord java -jar BungeeCord.jar nogui" >> start.sh
mkdir plugins
cd /home
chmod 777 -R bungeecord/
clear
echo "Terminer !\n"
echo "Pour démarer votre serveur faites la commande : cd /home/bungeecord && sh start.sh"
echo "Pour accéder à votre console taper la commande : screen -r bungeecord"
echo "Detail de l'installation"
echo "Version du proxy : 1.8 - 1.15.2"
echo "API : BungeeCord"
echo "Dossier d'instalation : /home/bungeecord"
echo "Dossier des plugins : /home/bungeecord/plugins"
echo "Fichier de démarrage de : start.sh"
