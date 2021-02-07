# Velocity

version_velocity="1.8 - 1.16.5"
velocity_download=https://versions.velocitypowered.com/download/1.1.3.jar

clear
echo "Instalation de : Velocity"
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
clear
mkdir $dossier
chmod 777 $dossier/
chmod 777 -R $dossier/
cd $dossier
rm velocity.jar
rm start.sh
rm eula.txt
wget $velocity_download
mv 1.*.jar velocity.jar
clear
echo "Installation de Velocity..."
touch start.sh && echo "cd /home/"$dossier"" >> start.sh
echo "screen -d -m -S "$dossier" java -jar velocity.jar nogui" >> start.sh
mkdir plugins
chmod 777 velocity.jar
chmod 777 start.sh
cd /home
chmod 777 -R $dossier/
rm info-$dossier.txt
touch info-$dossier.txt
echo "Pour démarer votre serveur faites la commande : bash /home/"$dossier"/start.sh" >> info-$dossier.txt
echo "Pour accéder à votre console taper la commande : screen -r" $dossier >> info-$dossier.txt
echo "Detail de l'installation" >> info-$dossier.txt
echo "Version du proxy :" $version_velocity >> info-$dossier.txt
echo "API : Velocity" >> info-$dossier.txt
echo "Dossier d'instalation : /home/"$dossier >> info-$dossier.txt
echo "Dossier des plugins : /home/"$dossier"/plugins" >> info-$dossier.txt
echo "Fichier de démarrage de : start.sh" >> info-$dossier.txt
clear
echo "Terminer !"
echo "Pour démarer votre serveur faites la commande : bash /home/"$dossier"/start.sh"
echo "Pour accéder à votre console taper la commande : screen -r" $dossier
echo "Detail de l'installation"
echo "Version du proxy :" $version_velocity
echo "API : Velocity"
echo "Dossier d'instalation : /home/"$dossier
echo "Dossier des plugins : /home/"$dossier"/plugins"
echo "Fichier de démarrage de : start.sh"
echo "Un fichier info-"$dossier".txt dans /home a été crée contenant les information afficher si dessue."
