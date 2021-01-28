# Sponge

version_sponge=1.12.2
sponge_download=https://repo.spongepowered.org/maven/org/spongepowered/spongeforge/1.12.2-2838-7.3.0/spongeforge-1.12.2-2838-7.3.0.jar
forge_sponge_download=https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.12.2-14.23.5.2854/forge-1.12.2-14.23.5.2854-installer.jar

clear
echo "Instalation de : Sponge Forge"
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
rm start.sh
rm eula.txt
rm forge.jar
rm forge-*.jar
rm -R libraries
echo "Téléchargement de forge"
wget $forge_sponge_download
mv forge-*-installer.jar forge-installer.jar
clear
echo "Installation de forge"
java -jar forge-installer.jar --installServer
rm forge-installer.jar
mv forge-*.jar forge.jar
touch eula.txt && echo "eula=true" >> eula.txt
touch start.sh && echo "cd /home/"$dossier"" >> start.sh
echo "screen -d -m -S "$dossier" java -jar forge.jar nogui" >> start.sh
chmod 777 start.sh
chmod 777 forge.jar
clear
echo "Nettoyage..."
rm -f installer.log
rm -f forge-installer.jar.log
echo "Instalation de sponge..."
mkdir mods
chmod 777 mods/
chmod 777 -R mods/
cd mods
rm sponge.jar
wget $sponge_download
mv spongeforge-*.jar sponge.jar
chmod 777 sponge.jar
mkdir plugins
chmod 777 plugins/
chmod 777 -R plugins/
cd /home
chmod 777 -R $dossier/
rm info-$dossier.txt
touch info-$dossier.txt
echo "Pour démarer votre serveur faites la commande : bash /home/"$dossier"/start.sh" >> info-$dossier.txt
echo "Pour accéder à votre console taper la commande : screen -r" $dossier >> info-$dossier.txt
echo "Detail de l'installation" >> info-$dossier.txt
echo "Version du serveur :" $version_sponge >> info-$dossier.txt
echo "API : Sponge Forge, Forge" >> info-$dossier.txt
echo "Dossier d'instalation : /home/"$dossier >> info-$dossier.txt
echo "Dossier des mods : /home/"$dossier"/mods" >> info-$dossier.txt
echo "Dossier des plugins : /home/"$dossier"/mods/plugins" >> info-$dossier.txt
echo "Fichier de démarrage de : start.sh" >> info-$dossier.txt
clear
echo "Terminer !"
echo "Pour démarer votre serveur faites la commande : bash /home/"$dossier"/start.sh"
echo "Pour accéder à votre console taper la commande : screen -r" $dossier
echo "Detail de l'installation"
echo "Version du serveur :" $version_sponge
echo "API : Sponge Forge, Forge"
echo "Dossier d'instalation : /home/"$dossier
echo "Dossier des mods : /home/$dossier/mods"
echo "Dossier des plugins : /home/$dossier/mods/plugins"
echo "Fichier de démarrage de : start.sh"
echo "Un fichier info-"$dossier".txt dans /home a été crée contenant les information afficher si dessue."