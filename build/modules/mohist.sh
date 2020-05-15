# Mohist
clear
echo "Instalation de : Mohist"
cd /home
echo "Une sauvegarde va être crée dans /home si un serveur et déjà installer et les autres sauvegardes écrasées s’il en existe ctrl + c pour annuler"
sleep 4
rm -f mohist-backup.zip
zip -r mohist-backup.zip mohist/
clear
mkdir mohist
chmod 777 mohist/
chmod 777 -R mohist/
cd mohist
rm -f start.sh
rm -f eula.txt
rm -f mohist.jar
echo "Téléchargement de mohist..."
wget https://ci.codemc.io/job/Mohist-Community/job/Mohist-1.12.2/521/artifact/build/distributions/Mohist-1.12.2-a99a910-server.jar
mv Mohist-*-*-server.jar mohist.jar
chmod 777 mohist.jar
clear
echo "Installation de mohist..."
touch eula.txt && echo "eula=true" >> eula.txt
touch start.sh && echo "screen -d -m -S mohist java -jar mohist.jar nogui" >> start.sh
chmod 777 start.sh
mkdir plugins
mkdir mods
cd /home
chmod 777 -R mohist/
clear
echo "Terminer !"
echo "Pour démarer votre serveur faites la commande : cd /home/mohist && sh start.sh"
echo "Pour accéder à votre console taper la commande : screen -r mohist"
echo "Detail de l'installation"
echo "Version du serveur : 1.12.2"
echo "API : SpigotAPI, Forge"
echo "Dossier d'instalation : /home/mohist"
echo "Dossier des mods : /home/mohist/mods"
echo "Dossier des plugins : /home/mohist/plugins"
echo "Fichier de démarrage de : start.sh"