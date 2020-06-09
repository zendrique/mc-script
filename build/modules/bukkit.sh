# Bukkit
clear
echo "Instalation de : Bukkit"
cd /home
echo "Dans quel dossier voulez-vous installer votre serveur ? (ex: serveur1)"
read dossier
echo "Une sauvegarde va être crée dans /home si un serveur et déjà installer et les autres sauvegardes écrasées s’il en existe ctrl + c pour annuler"
sleep 4
rm -f bukkit-backup.zip
zip -r bukkit-backup.zip $dossier/
clear
mkdir $dossier
chmod 777 $dossier/
chmod 777 -R $dossier/
cd $dossier
rm -f craftbukkit.jar
rm -f start.sh
rm -f eula.txt
mkdir buildtools
cd buildtools
echo "Téléchargement de BuildTools..."
wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
git config --global --unset core.autocrlf
clear
echo "Pour connaitrer les versions prise ne charge reférer vous à cette page :"
echo "https://www.spigotmc.org/wiki/buildtools/"
echo "Quel version voulez-vous installer ? (ex: 1.12.2)"
read version
java -jar BuildTools.jar --rev $version --compile craftbukkit
mv craftbukkit-*.jar /home/$dossier
cd /home/$dossier
mv craftbukkit-* craftbukkit.jar
touch eula.txt && echo "eula=true" >> eula.txt
touch start.sh && echo "screen -d -m -S bukkit java -XX:+UseConcMarkSweepGC -jar craftbukkit.jar nogui" >> start.sh
chmod 777 start.sh
chmod 777 craftbukkit.jar
clear
echo "Nettoyage..."
rm -R buildtools
cd /home
chmod 777 -R $dossier/
chmod 777 -R $dossier/*
rm -f info-bukkit.txt
touch info-bukkit.txt
echo "Pour démarer votre serveur faites la commande : cd /home/"$dossier" && sh start.sh" >> info-bukkit.txt
echo "Pour accéder à votre console taper la commande : screen -r bukkit" >> info-bukkit.txt
echo "Detail de l'installation :" >> info-bukkit.txt
echo "Version du serveur :" $version >> info-bukkit.txt
echo "API : SpigotAPI" >> info-bukkit.txt
echo "Dossier d'instalation : /home/"$dossier >> info-bukkit.txt
echo "Fichier de démarrage de : start.sh" >> info-bukkit.txt
clear
echo "Terminer !"
echo "Pour démarer votre serveur faites la commande : cd /home/"$dossier" && sh start.sh"
echo "Pour accéder à votre console taper la commande : screen -r bukkit"
echo "Detail de l'installation :"
echo "Version du serveur :" $version
echo "API : SpigotAPI"
echo "Dossier d'instalation : /home/"$dossier
echo "Fichier de démarrage de : start.sh"
echo "Un fichier info-bukkit.txt dans /home a été crée contenant les information afficher si dessue."
