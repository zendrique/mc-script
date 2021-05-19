# Spigot

spigot_download=https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar

# Détéction de sortie de Java
java_validation=$(cat /opt/mc-script/variable/java.txt)
if [ $java_validation -ne "1" ]; then
    exit 1
fi

clear
echo "Installation du serveur : Spigot"
cd /home
echo "Dans quel dossier voulez-vous installer votre serveur ? (ex: serveur1)"
read dossier
echo $dossier >> /opt/mc-script/variable/dossier.txt
clear
mkdir $dossier
cd $dossier
rm spigot.jar
rm start.sh
rm eula.txt
mkdir buildtools
cd buildtools
clear
echo "Téléchargement de BuildTools..."
curl -O $spigot_download
git config --global --unset core.autocrlf
clear
echo "Pour connaitrer les versions prise ne charge reférer vous à cette page :"
echo "https://www.spigotmc.org/wiki/buildtools/"
echo "Quel version voulez-vous installer ? (ex: 1.12.2)"
read version
java -jar BuildTools.jar --disable-java-check --output-dir /home/$dossier --rev $version
cd /home/$dossier
mv spigot-*.jar spigot.jar
touch eula.txt && echo "eula=true" >> eula.txt
touch start.sh && echo "cd /home/"$dossier"" >> start.sh
echo "screen -d -m -S "$dossier" java -XX:+UseConcMarkSweepGC -jar spigot.jar nogui" >> start.sh
echo "Nettoyage..."
rm -R buildtools
cd /home
rm info-$dossier.txt
touch info-$dossier.txt
echo "Pour démarer votre serveur faites la commande : bash /home/"$dossier"/start.sh" >> info-$dossier.txt
echo "Pour accéder à votre console taper la commande : screen -r" $dossier >> info-$dossier.txt
echo "Detail de l'installation :" >> info-$dossier.txt
echo "Version du serveur :" $version >> info-$dossier.txt
echo "API : SpigotAPI" >> info-$dossier.txt
echo "Dossier d'instalation : /home/"$dossier >> info-$dossier.txt
echo "Fichier de démarrage de : start.sh" >> info-$dossier.txt
clear
echo "Terminer !"
echo "Pour démarer votre serveur faites la commande : bash /home/"$dossier"/start.sh"
echo "Pour accéder à votre console taper la commande : screen -r" $dossier
echo "Detail de l'installation :"
echo "Version du serveur :" $version
echo "API : SpigotAPI"
echo "Dossier d'instalation : /home/"$dossier
echo "Fichier de démarrage de : start.sh"
echo "Un fichier info-"$dossier".txt dans /home a été crée contenant les information afficher si dessue."
