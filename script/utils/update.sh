# update

dossier="/opt/mc-script"
dossier_update="/opt/mc-script/update/mc-script"

clear
echo "[.] Vérification des composant élémentaire..."
apt update >> /dev/null
apt install dos2unix git -y >> /dev/null
clear
echo "[.] Supression des fichiers..."
rm -R $dossier/script $dossier/installation $dossier/menue
rm $dossier/README.md $dossier/*.sh $dossier/LICENSE /usr/bin/mc-script
clear
echo "[.] Téléchargement de mc-script..."
mkdir $dossier/update
cd $dossier/update
git clone https://github.com/zendrique/mc-script >> /dev/null
clear
echo "[.] Installation de la mise à jour..."
mv -t $dossier installation menue script
mv -t $dossier LICENSE mc-script README.md
dos2unix $dossier/installation.sh
rm -r $dossier_update
echo "[.] Démarrage du programme..."
bash /opt/mc-script/installation.sh --update
exit 0