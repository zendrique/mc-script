# update
dossier="/opt/mc-script"
dossier_update="/opt/mc-script/update"
clear
echo "[.] Vérification des composant élémaentaire..."
apt update
apt install dos2unix git -y
clear
echo "[.] Supression des fichiers..."
rm -R $dossier/script/
rm $dossier/LICENSE $dossier/README.md
clear
echo "[.] Téléchargement de mc-script..."
cd -r /opt/mc-script/update
git clone https://github.com/zendrique/mc-script
clear
echo "[.] Préparation de la mise à jour..."
mv $dossier_update/LICENSE $dossier
mv $dossier_update/installation.sh $dossier
mv -r $dossier_update/script $dossier
dos2unix /opt/mc-script/installation.sh
echo "[.] Démarrage du programme..."
bash /opt/mc-script/installation.sh --update
exit