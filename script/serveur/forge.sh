# Forge

# Détéction de sortie de Java
java_validation=$(cat /opt/mc-script/variable/java.txt)
if [ $java_validation -ne "1" ]; then
    exit 1
fi

dossier=$(cat /opt/mc-script/variable/dossier.txt)

clear
echo "En quel version du jeux voulez-vous ?"
echo "ex : 1.12.2"
read MC_VERSION
clear
echo "Quel version de Forge voulez-vous ?"
echo "(vide) pour la dernière en date"
read FORGE_VERSION
clear
mkdir $dossier
cd $dossier
rm *.jar
rm start.sh
clear
echo "eula=true" >> eula.txt

if [ ! -z ${FORGE_VERSION} ]; then
    DOWNLOAD_LINK=https://files.minecraftforge.net/maven/net/minecraftforge/forge/${FORGE_VERSION}/forge-${FORGE_VERSION}
    FORGE_JAR=forge-${FORGE_VERSION}*.jar
else
    JSON_DATA=$(curl -sSL https://files.minecraftforge.net/maven/net/minecraftforge/forge/promotions_slim.json)

    if [ "${MC_VERSION}" == "latest" ] || [ "${MC_VERSION}" == "" ] ; then
        echo -e "Optention de la dernière version de forge."
        MC_VERSION=$(echo -e ${JSON_DATA} | jq -r '.promos | del(."latest-1.7.10") | del(."1.7.10-latest-1.7.10") | to_entries[] | .key | select(contains("latest")) | split("-")[0]' | sort -t. -k 1,1n -k 2,2n -k 3,3n -k 4,4n | tail -1)
    	BUILD_TYPE=latest
    fi

    if [ "${BUILD_TYPE}" != "latest" ] && [ "${BUILD_TYPE}" != "latest" ]; then
        BUILD_TYPE=latest
    fi

    clear
    echo -e "Version de Minecraft : ${MC_VERSION}"
    echo -e "Version de Forge : ${BUILD_TYPE}"
    sleep 2

    ## quelque variable pour la version
    FILE_SITE=$(echo -e ${JSON_DATA} | jq -r '.homepage' | sed "s/http:/https:/g")
    VERSION_KEY=$(echo -e ${JSON_DATA} | jq -r --arg MC_VERSION "${MC_VERSION}" --arg BUILD_TYPE "${BUILD_TYPE}" '.promos | del(."latest-1.7.10") | del(."1.7.10-latest-1.7.10") | to_entries[] | .key | select(contains($MC_VERSION)) | select(contains($BUILD_TYPE))')

    ## localisation de la version de forge
    if [ "${VERSION_KEY}" == "" ] && [ "${BUILD_TYPE}" == "latest" ]; then
        echo -e "retour à la dernière version recommandée en raison de l'absence de version recommandée de forge pour la version mc demandée."
        VERSION_KEY=$(echo -e ${JSON_DATA} | jq -r --arg MC_VERSION "${MC_VERSION}" '.promos | del(."latest-1.7.10") | del(."1.7.10-latest-1.7.10") | to_entries[] | .key | select(contains($MC_VERSION)) | select(contains("latest"))')
    fi

    ## Erreur si la version de MC existe pas
    if [ "${VERSION_KEY}" == "" ] || [ "${VERSION_KEY}" == "null" ]; then
    	echo -e "L'installation a échoué car il n'y a pas de version valide de forge pour la version sur minecraft sélectionnée."
    	exit 1
    fi

    FORGE_VERSION=$(echo -e ${JSON_DATA} | jq -r --arg VERSION_KEY "$VERSION_KEY" '.promos | .[$VERSION_KEY]')

    if [ "${MC_VERSION}" == "1.7.10" ] || [ "${MC_VERSION}" == "1.8.9" ]; then
        DOWNLOAD_LINK=${FILE_SITE}${MC_VERSION}-${FORGE_VERSION}-${MC_VERSION}/forge-${MC_VERSION}-${FORGE_VERSION}-${MC_VERSION}
        FORGE_JAR=forge-${MC_VERSION}-${FORGE_VERSION}-${MC_VERSION}.jar
        if [ "${MC_VERSION}" == "1.7.10" ]; then
            FORGE_JAR=forge-${MC_VERSION}-${FORGE_VERSION}-${MC_VERSION}-universal.jar
        fi
    else
        DOWNLOAD_LINK=${FILE_SITE}${MC_VERSION}-${FORGE_VERSION}/forge-${MC_VERSION}-${FORGE_VERSION}
        FORGE_JAR=forge-${MC_VERSION}-${FORGE_VERSION}.jar
    fi
fi

# Téléchargement de forge
echo -e "Téléchargement de la version de forge ${FORGE_VERSION}"
if [ ! -z "${DOWNLOAD_LINK}" ]; then 
    if curl --output /dev/null --silent --head --fail ${DOWNLOAD_LINK}-installer.jar; then
        echo -e "Le lien de téléchargement du fichier d'installation est valide."
    else
        echo -e "le lien n'est pas valide"
        exit 2
    fi
else
    echo -e "pas de lien de téléchargement"
    exit 3
fi

curl -s -o installer.jar -sS ${DOWNLOAD_LINK}-installer.jar

# Vérification du lien
if [ ! -f ./installer.jar ]; then
    echo "!!! Erreur lors du téléchargement de la version de forge ${FORGE_VERSION} !!!"
    exit
fi

# Installation du serveur
echo -e "Installation du serveur forge.\n"
java -jar installer.jar --installServer || { echo -e "l'installation a échoué"; exit 4; }
echo "screen -d -m -S "$dossier" java -jar forge.jar nogui" >> start.sh
echo -e "Néttoyage"
rm -rf installer.jar
rm installer.jar.log
mv forge-*.jar forge.jar

# Recap de fin
echo "Pour démarer votre serveur faites la commande : bash /home/"$dossier"/start.sh" >> info-$dossier.txt
echo "Pour accéder à votre console taper la commande : screen -r" $dossier >> info-$dossier.txt
echo "Detail de l'installation" >> info-$dossier.txt
echo "Version de Minecraft :" $MC_VERSION >> info-$dossier.txt
echo "Version de Forge :" $FORGE_VERSION >> info-$dossier.txt
echo "API : Forge" >> info-$dossier.txt
echo "Dossier d'instalation : /home/"$dossier >> info-$dossier.txt
echo "Dossier des mods : /home/"$dossier"/mods" >> info-$dossier.txt
echo "Fichier de démarrage de : start.sh" >> info-$dossier.txt
clear
echo "Terminer !"
echo "Pour démarer votre serveur faites la commande : bash /home/"$dossier"/start.sh"
echo "Pour accéder à votre console taper la commande : screen -r" $dossier
echo "Detail de l'installation"
echo "Version du serveur :" $MC_VERSION
echo "Version de Forge :" $FORGE_VERSION
echo "API : Forge"
echo "Dossier d'instalation : /home/"$dossier
echo "Dossier des mods : /home/$dossier/mods"
echo "Fichier de démarrage de : start.sh"
echo "Un fichier info-"$dossier".txt dans /home a été crée contenant les information afficher si dessue."
