# FlameCord

version_flamecord="1.7 - 1.16.5"
flamecord_download=https://github.com/2lstudios-mc/FlameCord/releases/download/bc4a8ac/FlameCord.jar
dossier=$(cat /opt/mc-script/variable/dossier.txt)

# Détéction de sortie de Java
java_validation=$(cat /opt/mc-script/variable/java.txt)
if [ $java_validation -ne "1" ]; then
    exit 1
fi

clear
echo "Instalation de : FlameCord"
cd /home
mkdir $dossier
cd $dossier
rm Waterfall.jar
rm start.sh
rm eula.txt
clear
echo "Téléchargement de FlameCord"
curl -O $flamecord_download
clear
echo "Installation de FlameCord..."
echo "cd /home/"$dossier"" >> start.sh
touch start.sh && echo "screen -d -m -S "$dossier" java -Dlog4j2.formatMsgNoLookups=true -jar FlameCord.jar nogui" >> start.sh
mkdir plugins
cd /home
rm info-$dossier.txt
touch info-$dossier.txt
echo "Pour démarer votre serveur faites la commande : bash /home/"$dossier"/start.sh" >> info-$dossier.txt
echo "Pour accéder à votre console taper la commande : screen -r" $dossier >> info-$dossier.txt
echo "Detail de l'installation" >> info-$dossier.txt
echo "Version du proxy :" $version_flamecord >> info-$dossier.txt
echo "API : BungeeCord" >> info-$dossier.txt
echo "Dossier d'instalation : /home/"$dossier >> info-$dossier.txt
echo "Dossier des plugins : /home/"$dossier"/plugins" >> info-$dossier.txt
echo "Fichier de démarrage de : start.sh" >> info-$dossier.txt
clear
echo "Terminer !"
echo "Pour démarer votre serveur faites la commande : bash /home/"$dossier"/start.sh"
echo "Pour accéder à votre console taper la commande : screen -r" $dossier
echo "Detail de l'installation"
echo "Version du proxy :" $version_flamecord
echo "API : BungeeCord"
echo "Dossier d'instalation : /home/"$dossier
echo "Dossier des plugins : /home/"$dossier"/plugins"
echo "Fichier de démarrage de : start.sh"
echo "Un fichier info-"$dossier".txt dans /home a été crée contenant les information afficher si dessue."
