# OpenMod

# Détéction de sortie de Java
java_validation=$(cat /opt/mc-script/variable/java.txt)
if [ $java_validation -ne "1" ]; then
    exit 1
fi

dossier=$(cat /opt/mc-script/variable/dossier.txt)

clear
echo "Instalation d'un serveur non pris en charge"
echo "Proposer un template sur le github du projet !"
cd /home
mkdir $dossier
cd $dossier
echo "Veuiller coller le lien DIRECT de téléchargement du fichier jar de votre serveur serveur"
read lien
clear
echo "Téléchargement..."
curl -O $lien
mv *.jar $dossier.jar
rm eula.txt
rm start.sh
touch eula.txt && echo "eula=true" >> eula.txt
touch start.sh && echo "cd /home/"$dossier"" >> start.sh
echo "screen -d -m -S" $dossier "java -XX:+UseConcMarkSweepGC -jar" $dossier".jar nogui" >> start.sh
cd /home
rm info-$dossier.txt
touch info-$dossier.txt
echo "Pour démarer votre serveur faites la commande : bash /home/"$dossier"/start.sh" >> info-$dossier.txt
echo "Pour accéder à votre console taper la commande : screen -r" $dossier >> info-$dossier.txt
echo "Detail de l'installation :" >> info-$dossier.txt
echo "Dossier d'instalation : /home/"$dossier >> info-$dossier.txt
echo "Fichier de démarrage de : start.sh" >> info-$dossier.txt
clear
echo "Terminer !"
echo "Pour démarer votre serveur faites la commande : bash /home/"$dossier"/start.sh"
echo "Pour accéder à votre console taper la commande : screen -r" $dossier
echo "Detail de l'installation :"
echo "Dossier d'instalation : /home/"$dossier
echo "Fichier de démarrage de : start.sh"
echo "Un fichier info-"$dossier".txt dans /home a été crée contenant les information afficher si dessue."
