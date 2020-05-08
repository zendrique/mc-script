# PaperSpigot
clear
echo "Instalation de : PaperSpigot"
cd /home
echo "Une sauvegarde va être crée dans /home si un serveur et déjà installer et les autres sauvegardes écrasées s’il en existe ctrl + c pour annuler"
sleep 4
rm -f paperspigot-backup.zip
zip -r paperspigot-backup.zip paperspigot/
clear
mkdir paperspigot
chmod 777 paperspigot/
chmod 777 -R paperspigot/
cd paperspigot
rm -f paperclip.jar
rm -f start.sh
rm -f eula.txt
echo "Téléchargement de paperspigot..."
wget https://papermc.io/ci/job/Paper-1.15/lastSuccessfulBuild/artifact/paperclip.jar
touch eula.txt && echo "eula=true" >> eula.txt
touch start.sh && echo "screen -d -m -S paperspigot java -Xms3G -Xmx3G -XX:+UseConcMarkSweepGC -jar paperclip.jar nogui" >> start.sh
chmod 777 start.sh
chmod 777 paperclip.jar
cd /home
chmod 777 -R paperspigot/
clear
echo "Terminer !"
echo "Pour démarer votre serveur faites la commande : cd /home/paperspigot && sh start.sh"
echo "Pour accéder à votre console taper la commande : screen -r paperspigot"
echo "Detail de l'installation :"
echo "Version du serveur : 1.15.2"
echo "API : SpigotAPI"
echo "Dossier d'instalation : /home/paperspigot"
echo "Fichier de démarrage de : start.sh"
