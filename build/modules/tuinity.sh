# Tuinity
clear
echo "Instalation de : Tuinity"
cd /home
echo "Une sauvegarde va être crée dans /home si un serveur et déjà installer et les autres sauvegardes écrasées s’il en existe ctrl + c pour annuler"
sleep 4
rm -f tuinity-backup.zip
zip -r tuinity-backup.zip tuinity/
clear
mkdir tuinity
chmod 777 tuinity/
chmod 777 -R tuinity/
cd tuinity
rm -f tuinity-paperclip.jar
rm -f start.sh
rm -f eula.txt
echo "Téléchargement de tuinity..."
wget https://ci.codemc.io/job/Spottedleaf/job/Tuinity/lastSuccessfulBuild/artifact/tuinity-paperclip.jar
touch eula.txt && echo "eula=true" >> eula.txt
touch start.sh && echo "screen -d -m -S tuinity java -XX:+UseConcMarkSweepGC -jar tuinity-paperclip.jar nogui" >> start.sh
chmod 777 start.sh
chmod 777 tuinity-paperclip.jar
cd /home
chmod 777 -R tuinity/
clear
echo "Terminer !"
echo "Pour démarer votre serveur faites la commande : cd /home/tuinity && sh start.sh"
echo "Pour accéder à votre console taper la commande : screen -r tuinity"
echo "Detail de l'installation :"
echo "Version du serveur : 1.15.2"
echo "API : SpigotAPI"
echo "Dossier d'instalation : /home/tuinity"
echo "Fichier de démarrage de : start.sh"
