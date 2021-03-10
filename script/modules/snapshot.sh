# Snapshot

version_snapshot="21W10A"
snapshot_download=https://launcher.mojang.com/v1/objects/5998d2c7c15fea04b2541efdcbec4c8cfe5df2a6/server.jar

clear
echo "Installation du serveur : snapshot"
cd /home
echo "Dans quel dossier voulez-vous installer votre serveur ? (ex: serveur1)"
read dossier
echo "[?] Une sauvegarde va être crée au nom de "$dossier"-backup.zip ci un fichier ou dossier portant déja se nom, il sera écrasé, voulez-vous continuer ? (1 ou 2)" 
select sauvegarde in "Oui" "Non"; do
    case $sauvegarde in
        Oui ) break;;
        Non ) exit; break;;
    esac
done
rm $dossier-backup.zip
zip -r $dossier-backup.zip $dossier/
echo $dossier > /opt/mc-script/variable/dossier.txt
clear
mkdir $dossier
cd $dossier
rm server.jar
rm start.sh
rm eula.txt
echo "Téléchargement du serveur"
wget $snapshot_download
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
