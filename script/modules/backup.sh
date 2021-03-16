# backup

dossier=$(cat /opt/mc-script/variable/dossier.txt)
clear

function existe {
    echo "Une vauvegaurde du dossier "$dossier" va être crée"
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