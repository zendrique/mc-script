# PaperSpigot

version_paperspigot=1.16.1
paperspigot_download=https://papermc.io/ci/job/Paper-1.16/lastSuccessfulBuild/artifact/paperclip.jar

clear
echo "Instalation de : PaperSpigot"
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
rm -f paperclip.jar
rm -f start.sh
rm -f eula.txt
echo "Téléchargement de paperspigot..."
wget $paperspigot_download
touch eula.txt && echo "eula=true" >> eula.txt
touch start.sh && echo "screen -d -m -S "$dossier" java -XX:+UseConcMarkSweepGC -jar paperclip.jar nogui" >> start.sh
chmod 777 start.sh
chmod 777 paperclip.jar
cd /home
chmod 777 -R $dossier/
chmod 777 -R $dossier/*
rm -f info-$dossier.txt
touch info-$dossier.txt
echo "Pour démarer votre serveur faites la commande : cd /home/"$dossier" && sh start.sh" >> info-$dossier.txt
echo "Pour accéder à votre console taper la commande : screen -r" $dossier >> info-$dossier.txt
echo "Detail de l'installation :" >> info-$dossier.txt
echo "Version du serveur :" $version_paperspigot >> info-$dossier.txt
echo "API : SpigotAPI" >> info-$dossier.txt
echo "Dossier d'instalation : /home/"$dossier >> info-$dossier.txt
echo "Fichier de démarrage de : start.sh" >> info-$dossier.txt
clear
echo "Terminer !"
echo "Pour démarer votre serveur faites la commande : cd /home/"$dossier" && sh start.sh"
echo "Pour accéder à votre console taper la commande : screen -r" $dossier
echo "Detail de l'installation :"
echo "Version du serveur :" $version_paperspigot
echo "API : SpigotAPI"
echo "Dossier d'instalation : /home/$dossier"
echo "Fichier de démarrage de : start.sh"
echo "Un fichier info-"$dossier".txt dans /home a été crée contenant les information afficher si dessue."
