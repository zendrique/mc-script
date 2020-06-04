# Snapshot
clear
echo "Installation du serveur : snapshot"
cd /home
echo "Une sauvegarde va être crée dans /home si un serveur et déjà installer et les autres sauvegardes écrasées s’il en existe ctrl + c pour annuler"
sleep 4
rm -f snapshot-backup.zip
zip -r snapshot-backup.zip snapshot/
clear
mkdir snapshot
chmod 777 snapshot/
chmod 777 -R snapshot/
cd snapshot
rm -f server.jar
rm -f start.sh
rm -f eula.txt
echo "Téléchargement du serveur"
wget https://launcher.mojang.com/v1/objects/ce66f98cabc1038ceba3b715b7dad5f70e27f88a/server.jar
touch eula.txt && echo "eula=true" >> eula.txt
touch start.sh && echo "screen -d -m -S snapshot java -jar server.jar nogui" >> start.sh
chmod 777 start.sh
chmod 777 server.jar
cd /home
chmod 777 -R snapshot/
chmod 77 -R snapshot/*
rm -f info-snapshot.txt
touch info-snapshot.txt
echo "Pour démarrer votre serveur faites la commande : cd /home/snapshot && sh start.sh" >> info-snapshot.txt
echo "Pour accéder à votre console taper la commande : screen -r snapshot" >> info-snapshot.txt
echo "Détail de l'installation :" >> info-snapshot.txt
echo "Version du serveur : 1.16 pre release 1" >> info-snapshot.txt
echo "API : DatapackAPI" >> info-snapshot.txt
echo "Dossier d'installation : /home/snapshot" >> info-snapshot.txt
echo "Fichier de démarrage de : start.sh" >> info-snapshot.txt
clear
echo "Terminer !"
echo "Pour démarrer votre serveur faites la commande : cd /home/snapshot && sh start.sh"
echo "Pour accéder à votre console taper la commande : screen -r snapshot"
echo "Détail de l'installation :"
echo "Version du serveur : 1.16 pre release 1"
echo "API : DatapackAPI"
echo "Dossier d'installation : /home/snapshot"
echo "Fichier de démarrage de : start.sh"
echo "Un fichier info-snapshot.txt dans /home a été crée contenant les information afficher si dessue."
