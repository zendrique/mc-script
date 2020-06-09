# Autre
clear
echo "Instalation d'un serveur non pris en charge"
echo "Proposer un template sur le github du projet !"
cd /home
echo "Dans quel dossier voulez-vous installer votre serveur ?(ex: serveur1)"
read dossier
clear
mkdir $dossier
chmod 777 $dossier/
chmod 777 -R $dossier/
cd modPack
echo "Veuiller coller le lien DIRECT de téléchargement du fichier jar de votre serveur serveur"
read lien
wget $lien
mv *.jar $nom
rm -f eula.txt
touch eula.txt && echo "eula=true" >> eula.txt
touch start.sh && echo "screen -d -m -S" $dossier "java -XX:+UseConcMarkSweepGC -jar" $dossier.jar "nogui" >> start.sh
touch info-$dossier.txt
cd /home
chmod 777 -R $dossier/
chmod 777 -R $dossier/*
echo "Pour démarer votre serveur faites la commande : cd /home/"$dossier" && sh start.sh" >> info-$dossier.txt
echo "Pour accéder à votre console taper la commande : screen -r" $dossier >> info-$dossier.txt
echo "Detail de l'installation :" >> info-$dossier.txt
echo "Dossier d'instalation : /home/"$dossier >> info-$dossier.txt
echo "Fichier de démarrage de : start.sh" >> info-$dossier.txt
clear
echo "Terminer !"
echo "Pour démarer votre serveur faites la commande : cd /home/"$dossier" && sh start.sh"
echo "Pour accéder à votre console taper la commande : screen -r" $dossier
echo "Detail de l'installation :"
echo "Dossier d'instalation : /home/"$dossier
echo "Fichier de démarrage de : start.sh"
echo "Un fichier info-bukkit.txt dans /home a été crée contenant les information afficher si dessue."
