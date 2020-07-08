# Forge

forge_16_download=https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.16.1-32.0.47/forge-1.16.1-32.0.47-installer.jar

forge_15_download=https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.15.2-31.2.30/forge-1.15.2-31.2.30-installer.jar

forge_12_download=https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.12.2-14.23.5.2854/forge-1.12.2-14.23.5.2854-installer.jar

forge_10_download=https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.10.2-12.18.3.2511/forge-1.10.2-12.18.3.2511-installer.jar

forge_7_download=https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.7.10-10.13.4.1614-1.7.10/forge-1.7.10-10.13.4.1614-1.7.10-installer.jar

clear
echo "Quel version de forge voulez-vous installer ? (1, 2, 3 uo 4)" 
select version in "1.16.1" "1.15.2" "1.12.2" "1.10.2" "1.7.10" "autre"; do
    case $version in
        1.16.1)
        echo "Instalation de : Forge" $version
        cd /home
        echo "Dans quel dossier voulez-vous installer votre serveur ? (ex: serveur1)"
        read dossier
        echo "Une sauvegarde va être crée dans /home si un serveur et déjà installer et les autres sauvegardes écrasées s’il en existe ctrl + c pour annuler"
        sleep 4
        rm -f $dossier-backup.zip
        zip -r $dossier-backup.zip $dossier/
        clear
        mkdir $dossier
        chmod 777 $dossier/
        chmod 777 -R $dossier/
        cd $dossier
        rm -f forge-*.jar
        rm -f forge.jar
        rm -f start.sh
        rm -f eula.txt
        rm -R libraries
        mkdir mods
        chmod 777 mods/
        chmod 777 -R mods/
        echo "Téléchargement de forge"
        wget $forge_16_download
        mv forge-*-installer.jar forge-installer.jar
        clear
        echo "Installation de forge" $version
        java -jar forge-installer.jar --installServer
        rm -f forge-installer.jar
        mv forge-*.jar forge.jar
        touch eula.txt && echo "eula=true" >> eula.txt
        touch start.sh && echo "screen -d -m -S "$dossier" java -jar forge.jar nogui" >> start.sh
        chmod 777 start.sh
        chmod 777 forge.jar
        echo "Nettoyage..."
        rm -f installer.log
        rm -f forge-installer.jar.log
        cd /home
        chmod 777 -R $dossier/
        chmod 777 -R $dossier/*
        rm -f info-$dossier.txt
        touch info-$dossier.txt
        echo "Pour démarer votre serveur faites la commande : cd /home/"$dossier" && sh start.sh" >> info-$dossier.txt
        echo "Pour accéder à votre console taper la commande : screen -r" $dossier >> info-$dossier.txt
        echo "Detail de l'installation :" >> info-$dossier.txt
        echo "Version du serveur :" $version >> info-$dossier.txt
        echo "API : Forge" >> info-$dossier.txt
        echo "Dossier d'instalation : /home/"$dossier >> info-$dossier.txt
        echo "Dossier des mods : /home/"$dossier"/mods" >> info-$dossier.txt
        echo "Fichier de démarrage de : start.sh" >> info-$dossier.txt
        clear
        echo "Terminer !"
        echo "Pour démarer votre serveur faites la commande : cd /home/"$dossier" && sh start.sh"
        echo "Pour accéder à votre console taper la commande : screen -r" $dossier
        echo "Detail de l'installation :"
        echo "Version du serveur : 1.16.1"
        echo "API : Forge"
        echo "Dossier d'instalation : /home/"$dossier
        echo "Dossier des mods : /home/"$dossier"/mods"
        echo "Fichier de démarrage de : start.sh"
        echo "Un fichier info-"$dossier".txt dans /home a été crée contenant les information afficher si dessue." break;;

        1.15.2 ) 
        clear
        echo "Instalation de : Forge" $version
        cd /home
        echo "Dans quel dossier voulez-vous installer votre serveur ? (ex: serveur1)"
        read dossier
        echo "Une sauvegarde va être crée dans /home si un serveur et déjà installer et les autres sauvegardes écrasées s’il en existe ctrl + c pour annuler"
        sleep 4
        rm -f $dossier-backup.zip
        zip -r $dossier-backup.zip $dossier/
        clear
        mkdir $dossier
        chmod 777 $dossier/
        chmod 777 -R $dossier/
        cd $dossier
        rm -f forge-*.jar
        rm -f forge.jar
        rm -f start.sh
        rm -f eula.txt
        rm -R libraries
        mkdir mods
        chmod 777 mods/
        chmod 777 -R mods/
        echo "Téléchargement de forge"
        wget $forge_15_download
        mv forge-*-installer.jar forge-installer.jar
        clear
        echo "Installation de forge" $version
        java -jar forge-installer.jar --installServer
        rm -f forge-installer.jar
        mv forge-*.jar forge.jar
        touch eula.txt && echo "eula=true" >> eula.txt
        touch start.sh && echo "screen -d -m -S "$dossier" java -jar forge.jar nogui" >> start.sh
        chmod 777 start.sh
        chmod 777 forge.jar
        echo "Nettoyage..."
        rm -f installer.log
        rm -f forge-installer.jar.log
        cd /home
        chmod 777 -R $dossier/
        chmod 777 -R $dossier/*
        rm -f info-$dossier.txt
        touch info-$dossier.txt
        echo "Pour démarer votre serveur faites la commande : cd /home/"$dossier" && sh start.sh" >> info-$dossier.txt
        echo "Pour accéder à votre console taper la commande : screen -r" $dossier >> info-$dossier.txt
        echo "Detail de l'installation :" >> info-$dossier.txt
        echo "Version du serveur :" $version >> info-$dossier.txt
        echo "API : Forge" >> info-$dossier.txt
        echo "Dossier d'instalation : /home/"$dossier >> info-$dossier.txt
        echo "Dossier des mods : /home/"$dossier"/mods" >> info-$dossier.txt
        echo "Fichier de démarrage de : start.sh" >> info-$dossier.txt
        clear
        echo "Terminer !"
        echo "Pour démarer votre serveur faites la commande : cd /home/"$dossier" && sh start.sh"
        echo "Pour accéder à votre console taper la commande : screen -r" $dossier
        echo "Detail de l'installation :"
        echo "Version du serveur :" $version
        echo "API : Forge"
        echo "Dossier d'instalation : /home/"$dossier
        echo "Dossier des mods : /home/"$dossier"/mods"
        echo "Fichier de démarrage de : start.sh"
        echo "Un fichier info-"$dossier".txt dans /home a été crée contenant les information afficher si dessue." break;;

        1.12.2 ) 
        clear
        echo "Instalation de : Forge" $version
        cd /home
        echo "Dans quel dossier voulez-vous installer votre serveur ? (ex: serveur1)"
        read dossier
        echo "Une sauvegarde va être crée dans /home si un serveur et déjà installer et les autres sauvegardes écrasées s’il en existe ctrl + c pour annuler"
        sleep 4
        rm -f $dossier-backup.zip
        zip -r $dossier-backup.zip $dossier/
        clear
        mkdir $dossier
        chmod 777 $dossier/
        chmod 777 -R $dossier/
        cd $dossier
        rm -f start.sh
        rm -f eula.txt
        rm -f forge.jar
        rm -f forge-*.jar
        rm -R libraries
        mkdir mods
        chmod 777 mods/
        chmod 777 -R mods/
        echo "Téléchargement de forge"
        wget $forge_12_download
        mv forge-*-installer.jar forge-installer.jar
        clear
        echo "Installation de forge" $version
        java -jar forge-installer.jar --installServer
        rm -f forge-installer.jar
        mv forge-*.jar forge.jar
        touch eula.txt && echo "eula=true" >> eula.txt
        touch start.sh && echo "screen -d -m -S "$dossier" java -jar forge.jar nogui" >> start.sh
        chmod 777 start.sh
        chmod 777 forge.jar
        echo "Nettoyage..."
        rm -f installer.log
        rm -f forge-installer.jar.log
        cd /home
        chmod 777 -R $dossier/
        chmod 777 -R $dossier/*
        rm -f info-$dossier.txt
        touch info-$dossier.txt
        echo "Pour démarer votre serveur faites la commande : cd /home/"$dossier" && sh start.sh" >> info-$dossier.txt
        echo "Pour accéder à votre console taper la commande : screen -r" $dossier >> info-$dossier.txt
        echo "Detail de l'installation" >> info-$dossier.txt
        echo "Version du serveur :" $version >> info-$dossier.txt
        echo "API : Forge" >> info-$dossier.txt
        echo "Dossier d'instalation : /home/"$dossier >> info-$dossier.txt
        echo "Fichier de démarrage de : start.sh" >> info-$dossier.txt
        clear
        echo "Terminer !"
        echo "Pour démarer votre serveur faites la commande : cd /home/"$dossier" && sh start.sh"
        echo "Pour accéder à votre console taper la commande : screen -r" $dossier
        echo "Detail de l'installation"
        echo "Version du serveur :" $version
        echo "API : Forge"
        echo "Dossier d'instalation : /home/"$dossier
        echo "Fichier de démarrage de : start.sh"
        echo "Un fichier info-"$dossier".txt dans /home a été crée contenant les information afficher si dessue." break;;

        1.10.2 ) 
        clear
        echo "Instalation de : Forge" $version
        cd /home
        echo "Dans quel dossier voulez-vous installer votre serveur ? (ex: serveur1)"
        read dossier
        echo "Une sauvegarde va être crée dans /home si un serveur et déjà installer et les autres sauvegardes écrasées s’il en existe ctrl + c pour annuler"
        sleep 4
        rm -f $dossier-backup.zip
        zip -r $dossier-backup.zip $dossier/
        clear
        mkdir $dossier
        chmod 777 $dossier/
        chmod 777 -R $dossier/
        cd $dossier
        rm -f start.sh
        rm -f eula.txt
        rm -f forge.jar
        rm -f forge-*.jar
        rm -R libraries
        mkdir mods
        chmod 777 mods/
        chmod 777 -R mods/
        echo "Téléchargement de forge"
        wget $forge_10_download
        mv forge-*-installer.jar forge-installer.jar
        clear
        echo "Installation de forge" $version
        java -jar forge-installer.jar --installServer
        rm -f forge-installer.jar
        mv forge-*.jar forge.jar
        touch eula.txt && echo "eula=true" >> eula.txt
        touch start.sh && echo "screen -d -m -S "$dossier" java -jar forge.jar nogui" >> start.sh
        chmod 777 start.sh
        chmod 777 forge.jar
        echo "Nettoyage..."
        rm -f installer.log
        rm -f forge-installer.jar.log
        cd /home
        chmod 777 -R $dossier/
        chmod 777 -R $dossier/*
        rm -f info-$dossier.txt
        touch info-$dossier.txt
        echo "Pour démarer votre serveur faites la commande : cd /home/"$dossier" && sh start.sh" >> info-$dossier.txt
        echo "Pour accéder à votre console taper la commande : screen -r" $dossier >> info-$dossier.txt
        echo "Detail de l'installation" >> info-$dossier.txt
        echo "Version du serveur :" $version >> info-$dossier.txt
        echo "API : Forge" >> info-$dossier.txt
        echo "Dossier d'instalation : /home/"$dossier >> info-$dossier.txt
        echo "Fichier de démarrage de : start.sh" >> info-$dossier.txt
        clear
        echo "Terminer !"
        echo "Pour démarer votre serveur faites la commande : cd /home/"$dossier" && sh start.sh"
        echo "Pour accéder à votre console taper la commande : screen -r" $dossier
        echo "Detail de l'installation"
        echo "Version du serveur :" $version
        echo "API : Forge"
        echo "Dossier d'instalation : /home/"$dossier
        echo "Fichier de démarrage de : start.sh"
        echo "Un fichier info-"$dossier".txt dans /home a été crée contenant les information afficher si dessue." break;;

        1.7.10 )
        echo "Instalation de : Forge" $version
        cd /home
        echo "Dans quel dossier voulez-vous installer votre serveur ? (ex: serveur1)"
        read dossier
        echo "Une sauvegarde va être crée dans /home si un serveur et déjà installer et les autres sauvegardes écrasées s’il en existe ctrl + c pour annuler"
        sleep 4
        rm -f $dossier-backup.zip
        zip -r $dossier-backup.zip $dossier/
        clear
        mkdir $dossier
        chmod 777 $dossier/
        chmod 777 -R $dossier/
        cd $dossier
        rm -f start.sh
        rm -f eula.txt
        rm -f forge.jar
        rm -f forge-*.jar
        rm -R libraries
        mkdir mods
        chmod 777 mods/
        chmod 777 -R mods/
        clear
        echo "Téléchargement de forge" $version
        wget $forge_7_download
        mv forge-*-installer.jar forge-installer.jar
        clear
        echo "Installation de forge" $version
        java -jar forge-installer.jar --installServer
        rm -f forge-installer.jar
        mv forge-*.jar forge.jar
        touch eula.txt && echo "eula=true" >> eula.txt
        touch start.sh && echo "screen -d -m -S "$dossier" java -jar forge.jar nogui" >> start.sh
        chmod 777 start.sh
        chmod 777 forge.jar
        echo "Nettoyage..."
        rm -f installer.log
        rm -f forge-installer.jar.log
        cd /home
        chmod 777 -R $dossier/
        chmod 777 -R $dossier/*
        rm -f info-$dossier.txt
        touch info-$dossier.txt
        echo "Pour démarer votre serveur faites la commande : cd /home/"$dossier" && sh start.sh" >> info-$dossier.txt
        echo "Pour accéder à votre console taper la commande : screen -r" $dossier >> info-$dossier.txt
        echo "Detail de l'installation" >> info-$dossier.txt
        echo "Version du serveur :" $version >> info-$dossier.txt
        echo "API : Forge" >> info-$dossier.txt
        echo "Dossier d'instalation : /home/"$dossier >> info-$dossier.txt
        echo "Fichier de démarrage de : start.sh" >> info-$dossier.txt
        clear
        echo "Terminer !"
        echo "Pour démarer votre serveur faites la commande : cd /home/"$dossier" && sh start.sh"
        echo "Pour accéder à votre console taper la commande : screen -r" $dossier
        echo "Detail de l'installation"
        echo "Version du serveur :" $version
        echo "API : Forge"
        echo "Dossier d'instalation : /home/"$dossier
        echo "Fichier de démarrage de : start.sh"
        echo "Un fichier info-"$dossier".txt dans /home a été crée contenant les information afficher si dessue." break;;


        autre ) 
        clear
        echo "Instalation de : Une autre version de forge"
        cd /home
        echo "Dans quel dossier voulez-vous installer votre serveur ? (ex: serveur1)"
        read dossier
        echo "Une sauvegarde va être crée dans /home si un serveur et déjà installer et les autres sauvegardes écrasées s’il en existe ctrl + c pour annuler"
        sleep 4
        rm -f $dossier-backup.zip
        zip -r $dossier-backup.zip $dossier/
        clear
        mkdir $dossier
        chmod 777 $dossier/
        chmod 777 -R $dossier/
        cd $dossier
        rm -f start.sh
        rm -f eula.txt
        rm -f forge.jar
        rm -f forge-*.jar
        rm -R libraries
        mkdir mods
        chmod 777 mods/
        chmod 777 -R mods/
        clear
        echo "Merci d'indiquer le lien de tléchargement direct de l'installateur non windows de forge."
        read lien
        wget $lien
        mv forge-*-installer.jar forge-installer.jar
        clear
        echo "Installation de forge"
        java -jar forge-installer.jar --installServer
        rm -f forge-installer.jar
        mv forge-*.jar forge.jar
        touch eula.txt && echo "eula=true" >> eula.txt
        touch start.sh && echo "screen -d -m -S "$dossier" java -jar forge.jar nogui" >> start.sh
        chmod 777 start.sh
        chmod 777 forge.jar
        echo "Nettoyage..."
        rm -f installer.log
        rm -f forge-installer.jar.log
        cd /home
        chmod 777 -R $dossier/
        chmod 777 -R $dossier/*
        rm -f info-$dossier.txt
        touch info-$dossier.txt
        echo "Pour démarer votre serveur faites la commande : cd /home/"$dossier" && sh start.sh" >> info-$dossier.txt
        echo "Pour accéder à votre console taper la commande : screen -r" $dossier >> info-$dossier.txt
        echo "Detail de l'installation" >> info-$dossier.txt
        echo "Version du serveur : Forge autre" >> info-$dossier.txt
        echo "API : Forge" >> info-$dossier.txt
        echo "Dossier d'instalation : /home/"$dossier >> info-$dossier.txt
        echo "Fichier de démarrage de : start.sh" >> info-$dossier.txt
        clear
        echo "Terminer !"
        echo "Pour démarer votre serveur faites la commande : cd /home/"$dossier" && sh start.sh"
        echo "Pour accéder à votre console taper la commande : screen -r" $dossier
        echo "Detail de l'installation"
        echo "Version du serveur : Forge autre"
        echo "API : Forge"
        echo "Dossier d'instalation : /home/"$dossier
        echo "Fichier de démarrage de : start.sh"
        echo "Un fichier info-"$dossier".txt dans /home a été crée contenant les information afficher si dessue." break;;
        esac
done
