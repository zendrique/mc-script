# Vanilla

version_vanilla=`curl https://launchermeta.mojang.com/mc/game/version_manifest.json | jq -r '.latest.release'`
MANIFEST_URL=$(curl -sSL https://launchermeta.mojang.com/mc/game/version_manifest.json | jq --arg VERSION $version_vanilla -r '.versions | .[] | select(.id== $VERSION )|.url')
DOWNLOAD_URL=$(curl ${MANIFEST_URL} | jq .downloads.server | jq -r '. | .url')

clear
echo "Installation du serveur : Vanilla en" $version_vanilla
cd /home
echo "Dans quel dossier voulez-vous installer votre serveur ? (ex: serveur1)"
read dossier
echo $dossier >> /opt/mc-script/variable/dossier.txt
bash /opt/mc-script/modules/backup.sh
clear
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
echo "Version du serveur :" $version_vanilla >> info-$dossier.txt
echo "API : DatapackAPI" >> info-$dossier.txt
echo "Dossier d'installation : /home/"$dossier >> info-$dossier.txt
echo "Fichier de démarrage de : start.sh" >> info-$dossier.txt
clear
echo "Terminer !"
echo "Pour démarrer votre serveur faites la commande : bash /home/"$dossier"/start.sh"
echo "Pour accéder à votre console taper la commande : screen -r" $dossier
echo "Détail de l'installation :"
echo "Version du serveur :" $version_vanilla
echo "API : DatapackAPI"
echo "Dossier d'installation : /home/"$dossier
echo "Fichier de démarrage de : start.sh"
echo "Un fichier info-"$dossier".txt dans /home a été crée contenant les information afficher si dessue."
