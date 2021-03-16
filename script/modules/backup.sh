# backup

dossier=$(cat /opt/mc-script/variable/dossier.txt)
clear

function existe {
    echo "Une vauvegaurde du dossier "$dossier" va être crée"
    echo "Voulez vous continuer ?"
    select validation in "Oui" "Non"; do
    case $validation in
            Oui )  zip -r /home/backup.zip /home/$dossier break;;
            Non ) break;;
        esac
    done

}

function non-existe  {
    echo "[.] Acune suaveguarde à crée"
    exit
}

fi [ -d "/home/$dossier" ];then
existe
else
non-existe
fi

exit