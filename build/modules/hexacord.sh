# HexaCord
clear
echo "Instalation de : HexaCord"
cd /home
echo "Dans quel dossier voulez-vous installer votre serveur ? (ex: serveur1)"
read dossier
echo "Une sauvegarde va être crée dans /home si un serveur et déjà installer et les autres sauvegardes écrasées s’il en existe ctrl + c pour annuler"
sleep 4
rm -f hexacord.zip
zip -r hexacord.zip $dossier/
clear
mkdir $dossier
chmod 777 $dossier/
chmod 777 -R $dossier/
cd $dossier
rm -f HexaCord.jar
rm -f start.sh
rm -f eula.txt
wget https://yivesmirror.com/files/hexacord/HexaCord-v260.jar
mv HexaCord-*.jar HexaCord.jar
clear
echo "Installation de HexaCord..."
touch start.sh && echo "screen -d -m -S hexacord java -jar HexaCord.jar nogui" >> start.sh
mkdir plugins
chmod 777 HexaCord.jar
chmod 777 start.sh
cd /home
chmod 777 -R $dossier/
chmod 777 -R $dossier/*
rm -f info-hexacord.txt
touch info-hexacord.txt
echo "Pour démarer votre serveur faites la commande : cd /home/"$dossier" && sh start.sh" >> info-hexacord.txt
echo "Pour accéder à votre console taper la commande : screen -r hexacord" >> info-hexacord.txt
echo "Detail de l'installation" >> info-hexacord.txt
echo "Version du proxy : 1.7.10 - 1.15.2" >> info-hexacord.txt
echo "API : BungeeCord" >> info-hexacord.txt
echo "Dossier d'instalation : /home/"$dossier >> info-hexacord.txt
echo "Dossier des plugins : /home/"$dossier"/plugins" >> info-hexacord.txt
echo "Fichier de démarrage de : start.sh" >> info-hexacord.txt
clear
echo "Terminer !"
echo "Pour démarer votre serveur faites la commande : cd /home/"$dossier" && sh start.sh"
echo "Pour accéder à votre console taper la commande : screen -r hexacord"
echo "Detail de l'installation"
echo "Version du proxy : 1.7.10 - 1.15.2"
echo "API : BungeeCord"
echo "Dossier d'instalation : /home/"$dossier
echo "Dossier des plugins : /home/"$dossier"/plugins"
echo "Fichier de démarrage de : start.sh"
echo "Un fichier info-hexacord.txt dans /home a été crée contenant les information afficher si dessue."
