# ModPack
clear
echo "Instalation d'un modPack"
cd /home
echo "Dans quel dossier voulez-vous installer votre serveur ? (ex: serveur1)"
read dossier
echo "Une sauvegarde va être crée dans /home si un serveur et déjà installer et les autres sauvegardes écrasées s’il en existe ctrl + c pour annuler"
sleep 4
rm -f $dossier-backup.zip
zip -r $dossier-backup.zip $dossier/
clear
mkdir $dossier
chmod 777 $dossier/
chmod 777 -R $dossier/
cd $dossier
echo "Veuiller coller le lien DIRECT de téléchargement de votre modPack (fichier serveur)"
read lien
wget $lien
unzip *.zip
rm -f eula.txt
touch eula.txt && echo "eula=true" >> eula.txt
cd /home
chmod 777 -R $dossier/
chmod 777 -R $dossier/*
clear
echo "Terminer !"
echo "Le fihier à été télécharger et décompresser dans le répertoire /home/"$dossier
echo "Vous devez peut-être effectuer certainne manipulation suplémentaire avent de pouvoir commencer à jouer"
echo "Les fichier de modPack sont tous different de se fais nous ne pouvons garentire une installation correcte"
echo "Detail de l'installation"
echo "Dossier d'instalation : /home/modPack"$dossier
