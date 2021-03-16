# Mohist

detector="/opt/mc-script/script/version/mohist-detector.sh"
patch="/opt/mc-script/variable/mohist-version.txt"

clear

function instalation {
    echo "Instalation de : Mohist" $version
    cd /home
    echo "Dans quel dossier voulez-vous installer votre serveur ? (ex: serveur1)"
    read dossier
    echo $dossier >> /opt/mc-script/variable/dossier.txt
    bash /opt/mc-script/modules/backup.sh
    clear
    mkdir $dossier
    cd $dossier
    rm start.sh
    rm eula.txt
    rm mohist.jar
    clear
    echo "Téléchargement de mohist" $version
    if [ "$version" == "1.16.5" ]
    then
      clear
      echo "Détermination du lien..."
      version_16=$(curl -s 'https://mohistmc.com/api/1.16.5/latest' | jq -r '.url')
      curl -O $version_16
    fi
    if [ "$version" == "1.12.2" ]
    then
      clear
      echo "Détermination du lien..."
      version_12=$(curl -s 'https://mohistmc.com/api/1.12.2/latest' | jq -r '.url')
      curl -O $version_12
    fi
    if [ "$version" == "1.7.10" ]
    then
      clear
      echo "Détermination du lien..."
      version_7=$(curl -s 'https://mohistmc.com/api/1.7.10/latest' | jq -r '.url')
      curl -O $version_7
    fi
    mv mohist-*.jar mohist.jar
    clear
    echo "Installation de mohist..."
    touch eula.txt && echo "eula=true" >> eula.txt
    touch start.sh && echo "cd /home/"$dossier"" >> start.sh
    echo "screen -d -m -S "$dossier" java -jar mohist.jar nogui" >> start.sh
    mkdir plugins
    mkdir mods
    cd /home
    rm info-$dossier.txt
    touch info-$dossier.txt
    echo "Pour démarer votre serveur faites la commande : bash /home/"$dossier"/start.sh" >> info-$dossier.txt
    echo "Pour accéder à votre console taper la commande : screen -r" $dossier >> info-$dossier.txt
    echo "Detail de l'installation" >> info-$dossier.txt
    echo "Version du serveur :" $version >> info-$dossier.txt
    echo "API : SpigotAPI, Forge" >> info-$dossier.txt
    echo "Dossier d'instalation : /home/"$dossier >> info-$dossier.txt
    echo "Dossier des mods : /home/"$dossier"/mods" >> info-$dossier.txt
    echo "Dossier des plugins : /home/"$dossier"/plugins" >> info-$dossier.txt
    echo "Fichier de démarrage de : start.sh" >> info-$dossier.txt
    clear
    echo "Terminer !"
    echo "Pour démarer votre serveur faites la commande : bash /home/"$dossier"/start.sh"
    echo "Pour accéder à votre console taper la commande : screen -r" $dossier
    echo "Detail de l'installation"
    echo "Version du serveur :" $version
    echo "API : SpigotAPI, Forge"
    echo "Dossier d'instalation : /home/"$dossier
    echo "Dossier des mods : /home/"$dossier"/mods"
    echo "Dossier des plugins : /home/"$dossier"/plugins"
    echo "Fichier de démarrage de : start.sh"
    echo "Un fichier info-"$dossier".txt dans /home a été crée contenant les information afficher si dessue."
}


echo "Quel version de mohist voulez-vous installer ? (1, 2 ou 3)" 
select version in "1.16.5" "1.12.2" "1.7.10"; do
    case $version in
        1.16.5) instalation 
        exit break;;
        1.12.2 ) instalation 
        exit break;;
        1.7.10 ) instalation 
        exit break;;
        esac
done
