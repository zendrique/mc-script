# Débug
clear
echo "Démarage du Débug..."
sleep 1
echo "Indiquer le nom du dossier ou se trouvre votre serveur à debug."
read dossier

echo "Vérification des fichier de démarages..."
cd /home/$dossier
rm -f eula.txt
touch eula.txt && echo "eula=true" >> eula.txt

echo "Vérification des permissions..."
sleep 1
cd /home
chmod 777 $dossier
chmod 777 -R $dossier/
chmod 777 -R $dossier/*

echo "Débogage terminer !"
echo "Vous pouvez essayer relencer une installer du script pour essayer de corriger votre probléme"
echo "(note : une backup sera crée pour éviter de perdre vos fichier en cas de rpobléme)."
echo "Si votre Problème n'est pas résolue aller voire"
echo "https://github.com/zendrique/mc-script/issues"
echo "Pour obtenir de l'aide"
echo "Retour au menue dans 20 secondes"
sleep 20
sudo bash /home/mc-script.sh
exit
