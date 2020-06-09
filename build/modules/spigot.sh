# Spigot
echo "Installation du serveur : Spigot"
cd /home
echo "Dans quel dossier voulez-vous installer votre serveur ? (ex: serveur1)"
read dossier
echo "Une sauvegarde va être crée dans /home si un serveur et déjà installer et les autres sauvegardes écrasées s’il en existe ctrl + c pour annuler"
sleep 4
rm -f spigot-backup.zip
zip -r spigot-backup.zip $dossier/
clear
mkdir $dossier
chmod 777 $dossier/
chmod 777 -R $dossier/
cd $dossier
rm -f spigot.jar
rm -f start.sh
rm -f eula.txt
mkdir buildtools
cd buildtools
echo "Téléchargement de BuildTools..."
wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
git config --global --unset core.autocrlf
clear
echo "Pour connaitrer les versions prise ne hcarge reférer vous à cette page :"
echo "https://www.spigotmc.org/wiki/buildtools/"
echo "Quel version voulez-vous installer ? (ex: 1.12.2)"
read version
java -jar BuildTools.jar --rev $version
mv spigot-*.jar /home/$dossier
cd /home/$dossier
mv spigot-*.jar spigot.jar
touch eula.txt && echo "eula=true" >> eula.txt
touch start.sh && echo "screen -d -m -S spigot java -XX:+UseConcMarkSweepGC -jar spigot.jar nogui" >> start.sh
chmod 777 start.sh
chmod 777 spigot.jar
echo "Nettoyage..."
rm -R buildtools
cd /home
chmod 777 -R $dossier/
chmod 777 -R $dossier/*
rm -f info-spigot.txt
touch info-spigot.txt
echo "Pour démarer votre serveur faites la commande : sh /home/"$dossier"/start.sh" >> info-spigot.txt
echo "Pour accéder à votre console taper la commande : screen -r spigot" >> info-spigot.txt
echo "Detail de l'installation :" >> info-spigot.txt
echo "Version du serveur :" $version >> info-spigot.txt
echo "API : SpigotAPI" >> info-spigot.txt
echo "Dossier d'instalation : /home/"$dossier >> info-spigot.txt
echo "Fichier de démarrage de : start.sh" >> info-spigot.txt
clear
echo "Terminer !"
echo "Pour démarer votre serveur faites la commande : sh /home/"$dossier"/start.sh"
echo "Pour accéder à votre console taper la commande : screen -r spigot"
echo "Detail de l'installation :"
echo "Version du serveur :" $version
echo "API : SpigotAPI"
echo "Dossier d'instalation : /home/"$dossier
echo "Fichier de démarrage de : start.sh"
echo "Un fichier info-spigot.txt dans /home a été crée contenant les information afficher si dessue."
