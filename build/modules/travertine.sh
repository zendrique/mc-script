# Travertine
clear
echo "Instalation de : Travertine"
cd /home
echo "Dans quel dossier voulez-vous installer votre serveur ? (ex: serveur1)"
read dossier
echo "Une sauvegarde va être crée dans /home si un serveur et déjà installer et les autres sauvegardes écrasées s’il en existe ctrl + c pour annuler"
sleep 4
rm -f travertine.zip
zip -r travertine.zip $dossier/
clear
mkdir $dossier
chmod 777 $dossier/
chmod 777 -R $dossier/
cd $dossier
rm -f Travertine.jar
rm -f start.sh
rm -f eula.txt
wget https://papermc.io/ci/job/Travertine/lastSuccessfulBuild/artifact/Travertine-Proxy/bootstrap/target/Travertine.jar
clear
echo "Installation de Travertine..."
touch start.sh && echo "screen -d -m -S travertine java -jar Travertine.jar nogui" >> start.sh
chmod 777 Travertine.jar
chmod 777 start.sh
mkdir plugins
cd /home
chmod 777 -R $dossier/
chmod 777 -R $dossier/*
rm -f info-travertine.txt
touch info-travertine.txt
echo "Pour démarer votre serveur faites la commande : cd /home/"$dossier" && sh start.sh" >> info-travertine.txt
echo "Pour accéder à votre console taper la commande : screen -r travertine" info-travertine.txt
echo "Detail de l'installation" info-travertine.txt
echo "Version du proxy : 1.7.10" info-travertine.txt
echo "API : BungeeCord" info-travertine.txt
echo "Dossier d'instalation : /home/"$dossier info-travertine.txt
echo "Dossier des plugins : /home/"$dossier"/plugins" info-travertine.txt
echo "Fichier de démarrage de : start.sh" info-travertine.txt
clear
echo "Terminer !"
echo "Pour démarer votre serveur faites la commande : cd /home/"$dossier" && sh start.sh"
echo "Pour accéder à votre console taper la commande : screen -r travertine"
echo "Detail de l'installation"
echo "Version du proxy : 1.7.10"
echo "API : BungeeCord"
echo "Dossier d'instalation : /home/"$dossier
echo "Dossier des plugins : /home/"$dossier"/plugins"
echo "Fichier de démarrage de : start.sh"
echo "Un fichier info-travertine.txt dans /home a été crée contenant les information afficher si dessue."
