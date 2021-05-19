# ModPack

# Détéction de sortie de Java
java_validation=$(cat /opt/mc-script/variable/java.txt)
if [ $java_validation -ne "1" ]; then
    exit 1
fi

dossier=$(cat /opt/mc-script/variable/dossier.txt)

clear
echo "Instalation d'un modPack"
cd /home
mkdir $dossier
cd $dossier
echo "Veuiller coller le lien DIRECT de téléchargement de votre modPack (fichier serveur)"
read lien
clear
echo "Téléchargement..."
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
