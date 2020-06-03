# HexaCord
clear
echo "Instalation de : HexaCord"
cd /home
echo "Une sauvegarde va être crée dans /home si un serveur et déjà installer et les autres sauvegardes écrasées s’il en existe ctrl + c pour annuler"
sleep 4
rm -f hexacord.zip
zip -r hexacord.zip hexacord/
clear
mkdir hexacord
chmod 777 hexacord/
chmod 777 -R hexacord/
cd hexacord
rm -f HexaCord.jar
rm -f start.sh
rm -f eula.txt
wget https://yivesmirror.com/files/hexacord/HexaCord-v260.jar
mv HexaCord-*.jar HexaCord.jar
clear
echo "Installation de HexaCord..."
touch start.sh && echo "screen -d -m -S hexacord java -jar HexaCord.jar nogui" >> start.sh
mkdir plugins
cd /home
chmod 777 -R hexacord/
rm -f info-hexacord.txt
touch info-hexacord.txt
echo "Pour démarer votre serveur faites la commande : cd /home/hexacord && sh start.sh" >> info-hexacord.txt
echo "Pour accéder à votre console taper la commande : screen -r hexacord" >> info-hexacord.txt
echo "Detail de l'installation" >> info-hexacord.txt
echo "Version du proxy : 1.7.10 - 1.15.2" >> info-hexacord.txt
echo "API : BungeeCord" >> info-hexacord.txt
echo "Dossier d'instalation : /home/hexacord" >> info-hexacord.txt
echo "Dossier des plugins : /home/hexacord/plugins" >> info-hexacord.txt
echo "Fichier de démarrage de : start.sh" >> info-hexacord.txt
clear
echo "Terminer !"
echo "Pour démarer votre serveur faites la commande : cd /home/hexacord && sh start.sh"
echo "Pour accéder à votre console taper la commande : screen -r hexacord"
echo "Detail de l'installation"
echo "Version du proxy : 1.7.10 - 1.15.2"
echo "API : BungeeCord"
echo "Dossier d'instalation : /home/hexacord"
echo "Dossier des plugins : /home/hexacord/plugins"
echo "Fichier de démarrage de : start.sh"
echo "Un fichier info-hexacord.txt dans /home a été crée contenant les information afficher si dessue."