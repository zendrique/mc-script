# Fin d'installation d'un service
echo "Voulez-vous retourner au menue de mc-script ? (1 ou 2)"
select fin in "Oui" "Non"; do
    case $fin in
        Oui ) bash /opt/mc-script/mc-script.sh; break;;
        Non ) echo "Pour exectuer mc-script à nouveau, exécuter la commande : 'bash /opt/mc-scrip/mc-script.sh' dans un terminale"; exit;;
        esac
done
