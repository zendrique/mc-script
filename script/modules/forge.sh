# Forge

forge_16_download=https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.16.5-36.0.0/forge-1.16.5-36.0.0-installer.jar
forge_15_download=https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.15.2-31.2.43/forge-1.15.2-31.2.43-installer.jar
forge_12_download=https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.12.2-14.23.5.2854/forge-1.12.2-14.23.5.2854-installer.jar
forge_10_download=https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.10.2-12.18.3.2511/forge-1.10.2-12.18.3.2511-installer.jar
forge_7_download=https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.7.10-10.13.4.1614-1.7.10/forge-1.7.10-10.13.4.1614-1.7.10-installer.jar

clear

function installation {
    echo "Instalation de : Forge" $version
    cd /home
    echo "Dans quel dossier voulez-vous installer votre serveur ? (ex: serveur1)"
    read dossier
    echo $dossier >> /opt/mc-script/variable/dossier.txt
    bash /opt/mc-script/modules/backup.sh
    clear
    mkdir $dossier
    cd $dossier
    rm forge-*.jar
    rm forge.jar
    rm start.sh
    rm eula.txt
    rm -R libraries
    mkdir mods
    clear
    echo "Téléchargement de forge" $version
    if [ "$version" == "1.16.5" ]
    then
      curl -O $forge_16_download
    fi
    if [ "$version" == "1.15.2" ]
    then
      curl -O $forge_15_download
    fi
    if [ "$version" == "1.12.2" ]
    then
      curl -O $forge_12_download
    fi
    if [ "$version" == "1.10.2" ]
    then
      curl -O $forge_10_download
    fi
    if [ "$version" == "1.7.10" ]
    then
      curl -O $forge_7_download
    fi
    if [ "$version" == "autre" ]
    then
      curl -O $lien
    fi
    mv forge-*-installer.jar forge-installer.jar
    clear
    echo "Installation de forge" $version
    java -jar forge-installer.jar --installServer
    rm -f forge-installer.jar
    mv forge-*.jar forge.jar
    touch eula.txt && echo "eula=true" >> eula.txt
    touch start.sh && echo "cd /home/"$dossier"" >> start.sh
    echo "screen -d -m -S "$dossier" java -jar forge.jar nogui" >> start.sh
    echo "Nettoyage..."
    rm installer.log
    rm forge-installer.jar.log
    cd /home
    rm info-$dossier.txt
    touch info-$dossier.txt
    echo "Pour démarer votre serveur faites la commande : bash /home/"$dossier"/start.sh" >> info-$dossier.txt
    echo "Pour accéder à votre console taper la commande : screen -r" $dossier >> info-$dossier.txt
    echo "Detail de l'installation :" >> info-$dossier.txt
    echo "Version du serveur :" $version >> info-$dossier.txt
    echo "API : Forge" >> info-$dossier.txt
    echo "Dossier d'instalation : /home/"$dossier >> info-$dossier.txt
    echo "Dossier des mods : /home/"$dossier"/mods" >> info-$dossier.txt
    echo "Fichier de démarrage de : start.sh" >> info-$dossier.txt
    clear
    echo "Terminer !"
    echo "Pour démarer votre serveur faites la commande : bash /home/"$dossier"/start.sh"
    echo "Pour accéder à votre console taper la commande : screen -r" $dossier
    echo "Detail de l'installation :"
    echo "Version du serveur :" $version
    echo "API : Forge"
    echo "Dossier d'instalation : /home/"$dossier
    echo "Dossier des mods : /home/"$dossier"/mods"
    echo "Fichier de démarrage de : start.sh"
    echo "Un fichier info-"$dossier".txt dans /home a été crée contenant les information afficher si dessue."
    exit
}

echo "Quel version de forge voulez-vous installer ? (1, 2, 3 ou 4)" 
select version in "1.16.5" "1.15.2" "1.12.2" "1.10.2" "1.7.10" "autre"; do
    case $version in
        1.16.5) instalation break;;
        1.15.2 ) instalation break;;
        1.12.2 ) instalation break;;
        1.10.2 ) instalation break;;
        1.7.10 ) instalation break;;
        autre ) echo "Merci d'indiquer le lien de téléchargement directe de l'installateur forge au format jar" 
        read lien
        instalation break;;
        esac
done
