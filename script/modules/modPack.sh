# ModPack
clear
echo "Instalation d'un modPack"
cd /home
echo "Dans quel dossier voulez-vous installer votre serveur ? (ex: serveur1)"
read dossier
echo $dossier >> /opt/mc-script/variable/dossier.txt
bash /opt/mc-script/modules/backup.sh
clear
mkdir $dossier
cd $dossier
echo "Veuiller coller le lien DIRECT de téléchargement de votre modPack (fichier serveur)"
read lien
curl -O $lien
unzip *.zip
rm eula.txt
touch eula.txt && echo "eula=true" >> eula.txt
cd /home
clear
echo "Terminer !"
echo "Le fihier à été télécharger et décompresser dans le répertoire /home/"$dossier
echo "Vous devez peut-être effectuer certainne manipulation suplémentaire avent de pouvoir commencer à jouer"
echo "Les fichier de modPack sont tous different de se fais nous ne pouvons garentire une installation correcte"
echo "Detail de l'installation :"
echo "Dossier d'instalation : /home/modPack"$dossier
