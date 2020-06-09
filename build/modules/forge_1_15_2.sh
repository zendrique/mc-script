# Forge 1.15.2
clear
echo "Instalation de : Forge 1.15.2"
cd /home
echo "Dans quel dossier voulez-vous installer votre serveur ? (ex: serveur1)"
read dossier
echo "Une sauvegarde va être crée dans /home si un serveur et déjà installer et les autres sauvegardes écrasées s’il en existe ctrl + c pour annuler"
sleep 4
rm -f forge-1.15.2-backup.zip
zip -r forge-1.15.2-backup.zip $dossier/
clear
mkdir $dossier
chmod 777 $dossier/
chmod 777 -R $dossier/
cd $dossier
rm -f forge-*.jar
rm -f forge.jar
rm -f start.sh
rm -f eula.txt
rm -R libraries
mkdir mods
chmod 777 mods/
chmod 777 -R mods/
echo "Téléchargement de forge"
wget https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.15.2-31.2.9/forge-1.15.2-31.2.9-installer.jar
mv forge-*-installer.jar forge-installer.jar
clear
echo "Installation de forge 1.15.2"
java -jar forge-installer.jar --installServer
rm -f forge-installer.jar
mv forge-*.jar forge.jar
touch eula.txt && echo "eula=true" >> eula.txt
touch start.sh && echo "screen -d -m -S forge-1.15.2 java -jar forge.jar nogui" >> start.sh
chmod 777 start.sh
chmod 777 forge.jar
echo "Nettoyage..."
rm -f installer.log
cd /home
chmod 777 -R $dossier/
chmod 777 -R $dossier/*
rm -f info-forge-1.15.2.txt
touch info-forge-1.15.2.txt
echo "Pour démarer votre serveur faites la commande : sh /home/"$dossier"/start.sh" >> info-forge-1.15.2.txt
echo "Pour accéder à votre console taper la commande : screen -r forge-1.15.2" >> info-forge-1.15.2.txt
echo "Detail de l'installation :" >> info-forge-1.15.2.txt
echo "Version du serveur : 1.15.2" >> info-forge-1.15.2.txt
echo "API : Forge" >> info-forge-1.15.2.txt
echo "Dossier d'instalation : /home/"$dossier >> info-forge-1.15.2.txt
echo "Dossier des mods : /home/"$dossier"/mods" >> info-forge-1.15.2.txt
echo "Fichier de démarrage de : start.sh" >> info-forge-1.15.2.txt
clear
echo "Terminer !"
echo "Pour démarer votre serveur faites la commande : sh /home/"$dossier"/start.sh"
echo "Pour accéder à votre console taper la commande : screen -r forge-1.15.2"
echo "Detail de l'installation :"
echo "Version du serveur : 1.15.2"
echo "API : Forge"
echo "Dossier d'instalation : /home/"$dossier
echo "Dossier des mods : /home/"$dossier"/mods"
echo "Fichier de démarrage de : start.sh"
echo "Un fichier info-forge-1.15.2.txt dans /home a été crée contenant les information afficher si dessue."
