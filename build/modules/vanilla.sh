# Vanilla
clear
echo "Installation du serveur : Vanilla"
cd /home
echo "Dans quel dossier voulez-vous installer votre serveur ? (ex: serveur1)"
read dossier
echo "Une sauvegarde va être crée dans /home si un serveur et déjà installer et les autres sauvegardes écrasées s’il en existe ctrl + c pour annuler"
sleep 4
rm -f vanilla-backup.zip
zip -r vanilla-backup.zip $dossier/
clear
mkdir $dossier
chmod 777 $dossier/
chmod 777 -R $dossier/
cd $dossier
rm -f server.jar
rm -f start.sh
rm -f eula.txt
echo "Téléchargement du serveur"
wget https://launcher.mojang.com/v1/objects/a412fd69db1f81db3f511c1463fd304675244077/server.jar
touch eula.txt && echo "eula=true" >> eula.txt
touch start.sh && echo "screen -d -m -S "$dossier" java -jar server.jar nogui" >> start.sh
chmod 777 start.sh
chmod 777 server.jar
cd /home
chmod 777 -R $dossier/
chmod 777 -R $dossier/*
rm -f info-$dossier.txt
touch info-$dossier.txt
echo "Pour démarrer votre serveur faites la commande : cd /home/"$dossier" && sh start.sh" >> info-$dossier.txt
echo "Pour accéder à votre console taper la commande : screen -r" $dossier >> info-$dossier.txt
echo "Détail de l'installation :" >> info-$dossier.txt
echo "Version du serveur : 1.16.1" >> info-$dossier.txt
echo "API : DatapackAPI" >> info-$dossier.txt
echo "Dossier d'installation : /home/"$dossier >> info-$dossier.txt
echo "Fichier de démarrage de : start.sh" >> info-$dossier.txt
clear
echo "Terminer !"
echo "Pour démarrer votre serveur faites la commande : cd /home/"$dossier" && sh start.sh"
echo "Pour accéder à votre console taper la commande : screen -r" $dossier
echo "Détail de l'installation :"
echo "Version du serveur : 1.16.1"
echo "API : DatapackAPI"
echo "Dossier d'installation : /home/"$dossier
echo "Fichier de démarrage de : start.sh"
echo "Un fichier info-"$dossier".txt dans /home a été crée contenant les information afficher si dessue."
