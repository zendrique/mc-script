# Mohist
clear
echo "Instalation de : Mohist"
cd /home
echo "Dans quel dossier voulez-vous installer votre serveur ? (ex: serveur1)"
read dossier
echo "Une sauvegarde va être crée dans /home si un serveur et déjà installer et les autres sauvegardes écrasées s’il en existe ctrl + c pour annuler"
sleep 4
rm -f mohist-backup.zip
zip -r mohist-backup.zip $dossier/
clear
mkdir $dossier
chmod 777 $dossier/
chmod 777 -R $dossier/
cd $dossier
rm -f start.sh
rm -f eula.txt
rm -f mohist.jar
echo "Téléchargement de mohist..."
wget https://ci.codemc.io/job/Mohist-Community/job/Mohist-1.12.2/528/artifact/build/distributions/Mohist-1.12.2-2541029-server.jar
mv Mohist-*-*-server.jar mohist.jar
chmod 777 mohist.jar
chmod 777 start.sh
clear
echo "Installation de mohist..."
touch eula.txt && echo "eula=true" >> eula.txt
touch start.sh && echo "screen -d -m -S mohist java -jar mohist.jar nogui" >> start.sh
chmod 777 start.sh
mkdir plugins
mkdir mods
cd /home
chmod 777 -R $dossier/
chmod 777 -R $dossier/*
rm -f info-mohist.txt
touch info-mohist.txt
echo "Pour démarer votre serveur faites la commande : cd /home/"$dossier" && sh start.sh" >> info-mohist.txt
echo "Pour accéder à votre console taper la commande : screen -r mohist" >> info-mohist.txt
echo "Detail de l'installation" >> info-mohist.txt
echo "Version du serveur : 1.12.2" >> info-mohist.txt
echo "API : SpigotAPI, Forge" >> info-mohist.txt
echo "Dossier d'instalation : /home/"$dossier >> info-mohist.txt
echo "Dossier des mods : /home/"$dossier"/mods" >> info-mohist.txt
echo "Dossier des plugins : /home/"$dossier"/plugins" >> info-mohist.txt
echo "Fichier de démarrage de : start.sh" >> info-mohist.txt
clear
echo "Terminer !"
echo "Pour démarer votre serveur faites la commande : cd /home/"$dossier" && sh start.sh"
echo "Pour accéder à votre console taper la commande : screen -r mohist"
echo "Detail de l'installation"
echo "Version du serveur : 1.12.2"
echo "API : SpigotAPI, Forge"
echo "Dossier d'instalation : /home/"$dossier
echo "Dossier des mods : /home/"$dossier"/mods"
echo "Dossier des plugins : /home/"$dossier"/plugins"
echo "Fichier de démarrage de : start.sh"
echo "Un fichier info-mohist.txt dans /home a été crée contenant les information afficher si dessue."