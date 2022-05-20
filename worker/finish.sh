#!/bin/bash

nom="$1"
java="$2"

if [ "$java" == "1" ]; then
    version_java="8"
elif [ "$java" == "2" ]; then
    version_java="11"
elif [ "$java" == "3" ]; then
    version_java="16"
elif [ "$java" == "4" ]; then
    version_java="17"
else
    echo "Version inconnue"
    exit 1
fi

clear
echo "Installation de votre serveur : $nom terminé !"
echo "Version de Java à utiliser : java $version_java"
echo "Emplcament du serveur : /home/$nom"
echo "Veuillez lancer le script start.sh pour démarrer votre serveur"
echo "En cas d'erreur lors de du démarrage du serveur, assurez vous que la version de Java est bien installée"
echo "Vous pouvez installer la version de java correspondante à votre serveur en utilisant la commande : sudo mc-script-java-manager"
echo "Ou en utilisant la commande : sudo mc-script"
echo "Onglet : Acceder au gestionnaire java > Installer une version de java"
echo "MC-script reéaliser par : Zendrique"