# Fin d'installation d'un service
echo "Voulez-vous retourner au menue de mc-script ? (1 ou 2)"
select fin in "Oui" "Non"; do
    case $fin in
        Oui ) bash /home/mc-script.sh && exit break;;
        Non ) exit;;
        esac
done