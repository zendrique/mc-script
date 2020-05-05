# Travertine
clear
echo "Instalation de : Travertine"
cd /home
echo "Une sauvegarde va être crée dans /home si un serveur et déjà installer et les autres sauvegardes écrasées s’il en existe ctrl + c pour annuler"
sleep 4
rm -f travertine.zip
zip -r travertine.zip travertine/
clear
mkdir travertine
chmod 777 travertine/
chmod 777 -R travertine/
cd travertine
rm -f Travertine.jar
rm -f start.sh
rm -f eula.txt
wget https://papermc.io/ci/job/Travertine/lastSuccessfulBuild/artifact/Travertine-Proxy/bootstrap/target/Travertine.jar
clear
echo "Installation de Travertine..."
touch start.sh && echo "screen -d -m -S travertine java -jar Travertine.jar nogui" >> start.sh
mkdir plugins
cd /home
chmod 777 -R travertine/
clear
echo "Terminer !\n"
echo "Pour démarer votre serveur faites la commande : cd /home/travertine && sh start.sh"
echo "Pour accéder à votre console taper la commande : screen -r travertine"
echo "Detail de l'installation"
echo "Version du proxy : 1.7.10"
echo "API : BungeeCord"
echo "Dossier d'instalation : /home/travertine"
echo "Dossier des plugins : /home/travertine/plugins"
echo "Fichier de démarrage de : start.sh"
