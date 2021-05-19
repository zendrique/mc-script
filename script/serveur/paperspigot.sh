# PaperSpigot

version_paperspigot=1.16.5
paperspigot_download=https://papermc.io/ci/job/Paper-1.16/lastSuccessfulBuild/artifact/paperclip.jar

# Détéction de sortie de Java
java_validation=$(cat /opt/mc-script/variable/java.txt)
if [ $java_validation -ne "1" ]; then
    exit 1
fi

clear
echo "Instalation de : PaperSpigot"
cd /home
echo "Dans quel dossier voulez-vous installer votre serveur ? (ex: serveur1)"
read dossier
echo $dossier >> /opt/mc-script/variable/dossier.txt
clear
mkdir $dossier
cd $dossier
rm paperclip.jar
rm start.sh
rm eula.txt
clear
echo "Téléchargement de paperspigot..."
curl -O $paperspigot_download
touch eula.txt && echo "eula=true" >> eula.txt
touch start.sh && echo "cd /home/"$dossier"" >> start.sh
echo "screen -d -m -S "$dossier" java -XX:+UseConcMarkSweepGC -jar paperclip.jar nogui" >> start.sh
cd /home
rm info-$dossier.txt
touch info-$dossier.txt
echo "Pour démarer votre serveur faites la commande : bash /home/"$dossier"/start.sh" >> info-$dossier.txt
echo "Pour accéder à votre console taper la commande : screen -r" $dossier >> info-$dossier.txt
echo "Detail de l'installation :" >> info-$dossier.txt
echo "Version du serveur :" $version_paperspigot >> info-$dossier.txt
echo "API : SpigotAPI" >> info-$dossier.txt
echo "Dossier d'instalation : /home/"$dossier >> info-$dossier.txt
echo "Fichier de démarrage de : start.sh" >> info-$dossier.txt
clear
echo "Terminer !"
echo "Pour démarer votre serveur faites la commande : bash /home/"$dossier"/start.sh"
echo "Pour accéder à votre console taper la commande : screen -r" $dossier
echo "Detail de l'installation :"
echo "Version du serveur :" $version_paperspigot
echo "API : SpigotAPI"
echo "Dossier d'instalation : /home/$dossier"
echo "Fichier de démarrage de : start.sh"
echo "Un fichier info-"$dossier".txt dans /home a été crée contenant les information afficher si dessue."
