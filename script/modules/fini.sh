# Fin d'installation d'un service

# Détéction de la sortie d'information Java
java_validation=$(cat /opt/mc-script/variable/java.txt)
if [ $java_validation == "0" ]; then
    rm /opt/mc-script/variable/java.txt
    exit 1
fi

echo "Voulez-vous retourner au menue de mc-script ? (1 ou 2)"
select fin in "Oui" "Non"; do
    case $fin in
        Oui ) bash /opt/mc-script/script/mc-script.sh; break;;
        Non ) echo "Pour exectuer mc-script à nouveau, exécuter la commande : 'bash /opt/mc-scrip/mc-script.sh' dans un terminale"; exit 0;;
        esac
done
