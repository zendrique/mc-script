# Supression de mc-scipt
clear
echo "Voulez-vous vraiment supprimer mc-script ? (1 ou 2)"
select remove in "Oui" "Non"; do
    case $remove in
        Oui ) echo "Suppression de mc-script..."
        cd /opt
        rm -R mc-script
        unalias {mc-script}
        echo "Script par zendrique https://github.com/zendrique"
        echo "Contributeur Yadasko https://github.com/Yadasko"
        echo "Fermture..."
        exit break;;
        Non ) mc-script break;;
        esac
done
