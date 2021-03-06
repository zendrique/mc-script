# Snapshot

# Détéction de sortie de Java
java_validation=$(cat /opt/mc-script/variable/java.txt)
if [ $java_validation -ne "1" ]; then
    exit 1
fi

version_snapshot=`curl https://launchermeta.mojang.com/mc/game/version_manifest.json | jq -r '.latest.snapshot'`
MANIFEST_URL=$(curl -sSL https://launchermeta.mojang.com/mc/game/version_manifest.json | jq --arg VERSION $version_snapshot -r '.versions | .[] | select(.id== $VERSION )|.url')
DOWNLOAD_URL=$(curl ${MANIFEST_URL} | jq .downloads.server | jq -r '. | .url')
dossier=$(cat /opt/mc-script/variable/dossier.txt)

clear
echo "Installation du serveur : snapshot en version" $version_snapshot
cd /home
mkdir $dossier
cd $dossier
rm server.jar
rm start.sh
rm eula.txt
clear
echo "Téléchargement du serveur"
curl -O ${SERVER_JARFILE} $DOWNLOAD_URL
touch eula.txt && echo "eula=true" >> eula.txt
touch start.sh && echo "cd /home/"$dossier"" >> start.sh
echo "screen -d -m -S "$dossier" java -jar server.jar nogui" >> start.sh
cd /home
rm info-$dossier.txt
touch info-$dossier.txt
echo "Pour démarrer votre serveur faites la commande : bash /home/"$dossier"/start.sh" >> info-$dossier.txt
echo "Pour accéder à votre console taper la commande : screen -r" $dossier >> info-$dossier.txt
echo "Détail de l'installation :" >> info-$dossier.txt
echo "Version du serveur :" $version_snapshot >> info-$dossier.txt
echo "API : DatapackAPI" >> info-$dossier.txt
echo "Dossier d'installation : /home/"$dossier >> info-$dossier.txt
echo "Fichier de démarrage de : start.sh" >> info-$dossier.txt
clear
echo "Terminer !"
echo "Pour démarrer votre serveur faites la commande : bash /home/"$dossier"/start.sh"
echo "Pour accéder à votre console taper la commande : screen -r" $dossier
echo "Détail de l'installation :"
echo "Version du serveur :" $version_snapshot
echo "API : DatapackAPI"
echo "Dossier d'installation : /home/"$dossier
echo "Fichier de démarrage de : start.sh"
echo "Un fichier info-"$dossier".txt dans /home a été crée contenant les information afficher si dessue."
