#!/usr/bin/env bash
# Bukkit
clear
echo "Instalation de : Bukkit"
cd /home
echo "Une sauvegarde va être crée dans /home si un serveur et déjà installer et les autres sauvegardes écrasées s’il en existe ctrl + c pour annuler"
sleep 4
rm -f bukkit-backup.zip
zip -r bukkit-backup.zip bukkit/
clear
mkdir bukkit
chmod 777 bukkit/
chmod 777 -R bukkit/
cd bukkit
rm -f craftbukkit.jar
rm -f start.sh
rm -f eula.txt
mkdir buildtools
cd buildtools
echo "Téléchargement de BuildTools..."
wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
git config --global --unset core.autocrlf
java -jar BuildTools.jar --rev latest --compile craftbukkit
mv craftbukkit-*.jar /home/bukkit
cd /home/bukkit
mv craftbukkit-* craftbukkit.jar
touch eula.txt && echo "eula=true" >> eula.txt
touch start.sh && echo "screen -d -m -S bukkit java -Xms3G -Xmx3G -XX:+UseConcMarkSweepGC -jar craftbukkit.jar nogui" >> start.sh
chmod 777 start.sh
chmod 777 craftbukkit.jar
echo "Nettoyage..."
rm -R buildtools
cd /home
chmod 777 -R bukkit/
clear
echo "Terminer !\n"
echo "Pour démarer votre serveur faites la commande : cd /home/bukkit && sh start.sh"
echo "Pour accéder à votre console taper la commande : screen -r bukkit"
echo "Detail de l'installation :"
echo "Version du serveur : 1.15.2"
echo "API : SpigotAPI"
echo "Dossier d'instalation : /home/bukkit"
echo "Fichier de démarrage de : start.sh"