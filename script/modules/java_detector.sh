# Java detector

# Dans le cas que aucne version de java est demander
if [ $1 = "--noargs" ]; then
    echo "Ok c'est bon"
    echo "1" >> $variable/java.txt
    exit 0
fi

module_version = $1
module_name = $2
variable="/opt/mc-script/variable"

# Code da la variable java.txt
# 0 = Installation annuler
# 1 = Installation valider ou confirmer
touch /opt/mc-script/variable/java.txt

java_version=$(java -version 2>&1 \
  | head -1 \
  | cut -d'"' -f2 \
  | sed 's/^1\.//' \
  | cut -d'.' -f1 
)

clear
echo "Détérmination de votre version de Java..."
echo "Version de Java détecter :" $java_version
echo "Version demander par le module :" $module_version
echo "Nom du module :" $module_name

function changer {
    apt autoremove --purge -y adoptopenjdk-$java_version-hotspot
    apt update
    apt install -y adoptopenjdk-$module_version-hotspot
    echo "1" >> $variable/java.txt
    exit 0
}

function ingorer {
    echo "Etes-vous sûre ? Cette action n'est pas recommender et vos risque et préils !"
    select version in "Oui" "Non"; do
    case $version in
        Oui )  echo "1" >> $variable/java.txt break;;
        Non ) menue break;;
        esac
    done
}

function menue {
    echo "Que voulez vous faire ?"
    echo "1 - Quitter"
    echo "2 - Installer la version demander et deesintaller l'autre (recommender)"
    echo "3 - Ne rien faire poursuivre l'installation"
    select version in "1" "2" "3"; do
    case $version in
        1 ) echo "0" >> $variable/java.txt 
        exit 1;;
        2 ) changer exit 0;;
        3 ) ingorer exit 0;;
        esac
    done
}

function erreur {
    echo "La version de Java demander : Java "$module_version" n'est pas installer sur votre serveur."
    echo "Version installer sur votre serveur : Java" $java_version
    menue
}

function ok {
    echo "Version de Java compatible !"
    exit 0
}

if [ "$module_version" -eq "$java_version" ]; then
    ok
    else
    erreur
fi
exit 0