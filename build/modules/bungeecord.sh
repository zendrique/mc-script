# Bungeecord

version_bungeecord="1.8 - 1.16.4"
bungeecord_download=https://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/bootstrap/target/BungeeCord.jar

clear
echo "Instalation de : BungeeCord"
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
rm BungeeCord.jar
rm start.sh
rm eula.txt
wget $bungeecord_download
clear
echo "Installation de BungeeCord..."
touch start.sh && echo "cd /home"$dossier"" >> start.sh
echo "screen -d -m -S "$dossier" java -jar BungeeCord.jar nogui" >> start.sh
mkdir plugins
chmod 777 BungeeCord.jar
chmod 777 start.sh
cd /home
chmod 777 -R $dossier/
rm info-$dossier.txt
touch info-$dossier.txt
echo "Pour démarer votre serveur faites la commande : bash /home/"$dossier"/start.sh" >> info-$dossier.txt
echo "Pour accéder à votre console taper la commande : screen -r" $dossier >> info-$dossier.txt
echo "Detail de l'installation" >> info-$dossier.txt
echo "Version du proxy :" $version_bungeecord >> info-$dossier.txt
echo "API : BungeeCord" >> info-$dossier.txt
echo "Dossier d'instalation : /home/"$dossier >> info-$dossier.txt
echo "Dossier des plugins : /home/"$dossier"/plugins" >> info-$dossier.txt
echo "Fichier de démarrage de : start.sh" >> info-$dossier.txt
clear
echo "Terminer !"
echo "Pour démarer votre serveur faites la commande : bash /home/"$dossier"/start.sh"
echo "Pour accéder à votre console taper la commande : screen -r" $dossier
echo "Detail de l'installation"
echo "Version du proxy :" $version_bungeecord
echo "API : BungeeCord"
echo "Dossier d'instalation : /home/"$dossier
echo "Dossier des plugins : /home/"$dossier"/plugins"
echo "Fichier de démarrage de : start.sh"
echo "Un fichier info-"$dossier".txt dans /home a été crée contenant les information afficher si dessue."
