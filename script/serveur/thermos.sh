# Thermos

version_thermors=1.7.10
thermos_download=https://github.com/CyberdyneCC/Thermos/releases/download/58/Thermos-1.7.10-1614-server.jar
libraries_thermos_download=https://github.com/CyberdyneCC/Thermos/releases/download/58/Thermos-1.7.10-1614-server.jar
dossier=$(cat /opt/mc-script/variable/dossier.txt)

# Détéction de sortie de Java
java_validation=$(cat /opt/mc-script/variable/java.txt)
if [ $java_validation -ne "1" ]; then
    exit 1
fi

clear
echo "Instalation de : Thermos"
cd /home
mkdir $dossier
cd $dossier
rm start.sh
rm eula.txt
rm Thermos-1.7.10-1614-server.jar
rm Thermos.jar
rm -R libraries
clear
echo "Installation de Thermos..."
curl -O $thermos_download
curl -O $libraries_thermos_download
mv Thermos-1.7.10-*-server.jar Thermos.jar
unzip libraries.zip
rm libraries.zip
touch eula.txt && echo "eula=true" >> eula.txt
touch start.sh && echo "cd /home/"$dossier"" >> start.sh
echo "screen -d -m -S "$dossier" java -jar Thermos.jar nogui" >> start.sh
mkdir plugins
mkdir mods
cd /home
rm info-$dossier.txt
touch info-$dossier.txt
echo "Pour démarer votre serveur faites la commande : bash /home/"$dossier"/start.sh" >> info-$dossier.txt
echo "Pour accéder à votre console taper la commande : screen -r" $dossier >> info-$dossier.txt
echo "Detail de l'installation" >> info-$dossier.txt
echo "Version du serveur :" $version_thermors >> info-$dossier.txt
echo "API : SpigotAPI, Forge" >> info-$dossier.txt
echo "Dossier d'instalation : /home/"$dossier >> info-$dossier.txt
echo "Dossier des mods : /home/"$dossier"/mods" >> info-$dossier.txt
echo "Dossier des plugins : /home/"$dossier"/plugins" >> info-$dossier.txt
echo "Fichier de démarrage de : start.sh" >> info-$dossier.txt
clear
echo "Terminer !"
echo "Pour démarer votre serveur faites la commande : bash /home/"$dossier"/start.sh"
echo "Pour accéder à votre console taper la commande : screen -r" $dossier
echo "Detail de l'installation"
echo "Version du serveur :" $version_thermors
echo "API : SpigotAPI, Forge"
echo "Dossier d'instalation : /home/"$dossier
echo "Dossier des mods : /home/"$dossier"/mods"
echo "Dossier des plugins : /home/"$dossier"/plugins"
echo "Fichier de démarrage de : start.sh"
echo "Un fichier info-"$dossier".txt dans /home a été crée contenant les information afficher si dessue."
