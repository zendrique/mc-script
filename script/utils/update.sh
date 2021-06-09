# update

dossier="/opt/mc-script"
dossier_update="/opt/mc-script/update/mc-script"

clear
echo "[.] Vérification des composant élémentaire..."
apt update >> /dev/null
apt install dos2unix git -y >> /dev/null
clear
echo "[.] Supression des fichiers..."
cd $dossier
rm -r installation menue script
rm LICENSE README.md
clear
echo "[.] Téléchargement de mc-script..."
mkdir $dossier/update
cd $dossier/update
git clone https://github.com/zendrique/mc-script >> /dev/null
clear
echo "[.] Installation de la mise à jour..."
cd $dossier_update
mv installation $dossier
mv menue $dossier
mv script $dossier
mv LICENSE $dossier
mv README.md $dossier
dos2unix $dossier/installation.sh
cd $dossier
rm -r $dossier_update
echo "[.] Démarrage du programme..."
bash $dossier/installation/installation.sh --update
exit 0