# update
dossier="/opt/mc-script"
dossier_update="/opt/mc-script/update/mc-script"
clear
echo "[.] Vérification des composant élémaentaire..."
apt update
apt install dos2unix git -y
clear
echo "[.] Supression des fichiers..."
rm -R $dossier/script/
rm $dossier/LICENSE $dossier/README.md $dossier/boot.sh $dossier/initialisation.sh
clear
echo "[.] Téléchargement de mc-script..."
mkdir $dossier/update
cd $dossier/update
git clone https://github.com/zendrique/mc-script
clear
echo "[.] Préparation de la mise à jour..."
mv $dossier_update/LICENSE $dossier
mv $dossier_update/installation.sh $dossier
mv $dossier_update/script $dossier
dos2unix $dossier/installation.sh
echo "[.] Démarrage du programme..."
bash /opt/mc-script/installation.sh --update
exit