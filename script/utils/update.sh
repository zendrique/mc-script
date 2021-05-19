# update

dossier="/opt/mc-script"
dossier_update="/opt/mc-script/update/mc-script"

clear
echo "[.] Vérification des composant élémentaire..."
apt update >> /dev/null
apt install dos2unix git -y >> /dev/null
clear
echo "[.] Supression des fichiers..."
rm -R $dossier/script/
rm $dossier/README.md $dossier/*.sh $dossier/LICENSE /usr/bin/mc-script
clear
echo "[.] Téléchargement de mc-script..."
mkdir $dossier/update
cd $dossier/update
git clone https://github.com/zendrique/mc-script >> /dev/null
clear
echo "[.] Préparation de la mise à jour..."
mv $dossier_update/* $dossier
mv -r $dossier_update/* $dossier
rm -r $dossier_update
dos2unix $dossier/installation.sh
echo "[.] Démarrage du programme..."
bash /opt/mc-script/installation.sh --update
exit