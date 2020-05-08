# Spigot

echo "Installation du serveur : Spigot"
cd /home
echo "Une sauvegarde va être crée dans /home si un serveur et déjà installer et les autres sauvegardes écrasées s’il en existe ctrl + c pour annuler"
sleep 4
rm -f spigot-backup.zip
zip -r spigot-backup.zip spigot/
clear
mkdir spigot
chmod 777 spigot/
chmod 777 -R spigot/
cd spigot
rm -f spigot.jar
rm -f start.sh
rm -f eula.txt
mkdir buildtools
cd buildtools
echo "Téléchargement de BuildTools..."
wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
git config --global --unset core.autocrlf
java -jar BuildTools.jar --rev latest
mv spigot-*.jar /home/spigot
cd /home/spigot
mv spigot-*.jar spigot.jar
touch eula.txt && echo "eula=true" >> eula.txt
touch start.sh && echo "screen -d -m -S spigot java -Xms3G -Xmx3G -XX:+UseConcMarkSweepGC -jar spigot.jar nogui" >> start.sh
chmod 777 start.sh
chmod 777 spigot.jar
echo "Nettoyage..."
rm -R buildtools
cd /home
chmod 777 -R spigot/
clear
echo "Terminer !"
echo "Pour démarer votre serveur faites la commande : cd /home/spigot && sh start.sh"
echo "Pour accéder à votre console taper la commande : screen -r spigot"
echo "Detail de l'installation :"
echo "Version du serveur : 1.15.2"
echo "API : SpigotAPI"
echo "Dossier d'instalation : /home/spigot"
echo "Fichier de démarrage de : start.sh"