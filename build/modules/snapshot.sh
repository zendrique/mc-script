# Snapshot

version_snapshot="1.16.2 Release Candidate 2"
snapshot_download=https://launcher.mojang.com/v1/objects/45287d794fa2631b8da9b9002696ebe406fbed6b/server.jar

clear
echo "Installation du serveur : snapshot"
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
rm -f server.jar
rm -f start.sh
rm -f eula.txt
echo "Téléchargement du serveur"
wget $snapshot_download
touch eula.txt && echo "eula=true" >> eula.txt
touch start.sh && echo "screen -d -m -S "$dossier" java -jar server.jar nogui" >> start.sh
chmod 777 start.sh
chmod 777 server.jar
cd /home
chmod 777 -R $dossier/
chmod 77 -R $dossier/*
rm -f info-$dossier.txt
touch info-$dossier.txt
echo "Pour démarrer votre serveur faites la commande : cd /home/"$dossier" && sh start.sh" >> info-$dossier.txt
echo "Pour accéder à votre console taper la commande : screen -r" $dossier >> info-$dossier.txt
echo "Détail de l'installation :" >> info-$dossier.txt
echo "Version du serveur :" $version_snapshot >> info-$dossier.txt
echo "API : DatapackAPI" >> info-$dossier.txt
echo "Dossier d'installation : /home/"$dossier >> info-$dossier.txt
echo "Fichier de démarrage de : start.sh" >> info-$dossier.txt
clear
echo "Terminer !"
echo "Pour démarrer votre serveur faites la commande : cd /home/"$dossier" && sh start.sh"
echo "Pour accéder à votre console taper la commande : screen -r" $dossier
echo "Détail de l'installation :"
echo "Version du serveur :" $version_snapshot
echo "API : DatapackAPI"
echo "Dossier d'installation : /home/"$dossier
echo "Fichier de démarrage de : start.sh"
echo "Un fichier info-"$dossier".txt dans /home a été crée contenant les information afficher si dessue."
