# Fabric

version_fabric=1.16.5
fabric_download=https://maven.fabricmc.net/net/fabricmc/fabric-installer/0.7.3/fabric-installer-0.7.3.jar
dossier=$(cat /opt/mc-script/variable/dossier.txt)

# Détéction de sortie de Java
java_validation=$(cat /opt/mc-script/variable/java.txt)
if [ $java_validation -ne "1" ]; then
    exit 1
fi

clear
echo "Installation du serveur : Fabric"
cd /home
mkdir $dossier
cd $dossier
rm server.jar
rm start.sh
rm eula.txt
rm fabric-server-launch.jar
clear
echo "Téléchargement de Fabric"
curl -O $fabric_download
mv fabric-installer-*.jar fabric-installer.jar
clear
echo "Installation de Fabric..."
java -jar fabric-installer.jar server -downloadMinecraft
touch eula.txt && echo "eula=true" >> eula.txt
touch start.sh && echo "cd /home/"$dossier"" >> start.sh
echo "screen -d -m -S "$dossier" java -Dlog4j2.formatMsgNoLookups=true -jar fabric-server-launch.jar nogui" >> start.sh
rm fabric-installer.jar
cd /home
rm info-$dossier.txt
touch info-$dossier.txt
echo "Pour démarrer votre serveur faites la commande : bash /home/"$dossier"/start.sh" >> info-$dossier.txt
echo "Pour accéder à votre console taper la commande : screen -r" $dossier >> info-$dossier.txt
echo "Détail de l'installation :" >> info-$dossier.txt
echo "Version du serveur :" $version_vanilla >> info-$dossier.txt
echo "API : Fabric" >> info-$dossier.txt
echo "Dossier d'installation : /home/"$dossier >> info-$dossier.txt
echo "Dossier des mods : /home/"$dossier"/mods" >> info-$dossier.txt
echo "Fichier de démarrage de : start.sh" >> info-$dossier.txt
clear
echo "Terminer !"
echo "Pour démarrer votre serveur faites la commande : bash /home/"$dossier"/start.sh"
echo "Pour accéder à votre console taper la commande : screen -r" $dossier
echo "Détail de l'installation :"
echo "Version du serveur :" $version_vanilla
echo "API : Fabric"
echo "Dossier d'installation : /home/"$dossier
echo "Dossier des mods : /home/"$dossier"/mods"
echo "Fichier de démarrage de : start.sh"
echo "Un fichier info-"$dossier".txt dans /home a été crée contenant les information afficher si dessue."
