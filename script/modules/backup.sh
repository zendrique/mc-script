# backup

dossier=$(cat /opt/mc-script/variable/dossier.txt)
java_validation=$(cat /opt/mc-script/variable/java.txt)

# Détéction de la sortie d'information Java
if [ $java_validation -ne "1" ]; then
    exit 1
fi

clear

function existe {
    echo "Une sauvegaurde du dossier "$dossier" va être crée"
    echo "Voulez vous continuer ?"
    select validation in "Oui" "Non"; do
    case $validation in
            Oui )  rm /home/dossier.zip
            zip -r /home/$dossier.zip /home/$dossier 
            clear
            echo "Une suaveguarde avec le nom : "$dossier".zip a été crée"
            break;;
            Non ) break;;
        esac
    done

}

function non-existe  {
    clear
    echo "[.] Acune suaveguarde à crée"
    exit
}

if [ -d "/home/$dossier" ];then
existe
sleep 3
else
non-existe
sleep 2
fi

exit