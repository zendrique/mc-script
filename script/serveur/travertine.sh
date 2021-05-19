# Travertine

version_travertine=1.7.10
travertine_download=https://papermc.io/ci/job/Travertine/lastSuccessfulBuild/artifact/Travertine-Proxy/bootstrap/target/Travertine.jar
dossier=$(cat /opt/mc-script/variable/dossier.txt)

# Détéction de sortie de Java
java_validation=$(cat /opt/mc-script/variable/java.txt)
if [ $java_validation -ne "1" ]; then
    exit 1
fi

clear
echo "Instalation de : Travertine"
cd /home
mkdir $dossier
cd $dossier
rm Travertine.jar
rm start.sh
rm eula.txt
clear
echo "Téléchargement de Travertine"
curl -O $travertine_download
clear
echo "Installation de Travertine..."
touch eula.txt && echo "eula=true" >> eula.txt
touch start.sh && echo "cd /home/"$dossier"" >> start.sh
echo "screen -d -m -S "$dossier" java -jar Travertine.jar nogui" >> start.sh
mkdir plugins
cd /home
rm info-$dossier.txt
touch info-$dossier.txt
echo "Pour démarer votre serveur faites la commande : bash /home/"$dossier"/start.sh" >> info-$dossier.txt
echo "Pour accéder à votre console taper la commande : screen -r" $dossier info-$dossier.txt
echo "Detail de l'installation" info-$dossier.txt
echo "Version du proxy :" $version_travertine info-$dossier.txt
echo "API : BungeeCord" info-$dossier.txt
echo "Dossier d'instalation : /home/"$dossier info-$dossier.txt
echo "Dossier des plugins : /home/"$dossier"/plugins" info-$dossier.txt
echo "Fichier de démarrage de : start.sh" info-$dossier.txt
clear
echo "Terminer !"
echo "Pour démarer votre serveur faites la commande : bash /home/"$dossier"/start.sh"
echo "Pour accéder à votre console taper la commande : screen -r" $dossier
echo "Detail de l'installation"
echo "Version du proxy :" $version_travertine
echo "API : BungeeCord"
echo "Dossier d'instalation : /home/"$dossier
echo "Dossier des plugins : /home/"$dossier"/plugins"
echo "Fichier de démarrage de : start.sh"
echo "Un fichier info-"$dossier".txt dans /home a été crée contenant les information afficher si dessue."
