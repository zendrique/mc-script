# Airplane

version_airplane=1.16.5
airplane_download=https://dl.airplane.gg/latest/Airplane-JDK11/launcher-airplane.jar
dossier=$(cat /opt/mc-script/variable/dossier.txt)

# Détéction de sortie de Java
java_validation=$(cat /opt/mc-script/variable/java.txt)
if [ $java_validation -ne "1" ]; then
    exit 1
fi

clear
echo "Instalation de : Aireplane"
cd /home
mkdir $dossier
cd $dossier
rm launcher-airplane.jar
rm start.sh
rm eula.txt
clear
echo "Téléchargement de airplane..."
curl -O $airplane_download
touch eula.txt && echo "eula=true" >> eula.txt
touch start.sh && echo "cd /home/"$dossier"" >> start.sh
echo "screen -d -m -S "$dossier" java -XX:+UseConcMarkSweepGC -Dlog4j2.formatMsgNoLookups=true -jar launcher-airplane.jar nogui" >> start.sh
cd /home
rm info-$dossier.txt
touch info-$dossier.txt
echo "Pour démarer votre serveur faites la commande : bash /home/"$dossier"/start.sh" >> info-$dossier.txt
echo "Pour accéder à votre console taper la commande : screen -r" $dossier >> info-$dossier.txt
echo "Detail de l'installation :" >> info-$dossier.txt
echo "Version du serveur :" $airplane_tuinity >> info-$dossier.txt
echo "API : SpigotAPI" >> info-$dossier.txt
echo "Dossier d'instalation : /home/"$dossier >> info-$dossier.txt
echo "Fichier de démarrage de : start.sh" >> info-$dossier.txt
clear
echo "Terminer !"
echo "Pour démarer votre serveur faites la commande : bash /home/"$dossier"/start.sh"
echo "Pour accéder à votre console taper la commande : screen -r" $dossier
echo "Detail de l'installation :"
echo "Version du serveur :" $airplane_tuinity
echo "API : SpigotAPI"
echo "Dossier d'instalation : /home/"$dossier
echo "Fichier de démarrage de : start.sh"
echo "Un fichier info-"$dossier".txt dans /home a été crée contenant les information afficher si dessue."
