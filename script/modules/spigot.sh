# Spigot

spigot_download=https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar

clear
echo "Installation du serveur : Spigot"
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
rm /opt/mc-script/dossier.txt
echo $dossier > /opt/mc-script/dossier.txt
clear
mkdir $dossier
chmod 777 $dossier/
chmod 777 -R $dossier/
cd $dossier
rm spigot.jar
rm start.sh
rm eula.txt
mkdir buildtools
cd buildtools
echo "Téléchargement de BuildTools..."
wget $spigot_download
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
chmod 777 start.sh
chmod 777 spigot.jar
echo "Nettoyage..."
rm -R buildtools
cd /home
chmod 777 -R $dossier/
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