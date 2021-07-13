# Supression de mc-scipt

clear
function remove {
    echo "Suppression de mc-script..."
    cd /opt
    rm -R mc-script
    rm /usr/bin/mc-script
    echo "Script par zendrique https://github.com/zendrique"
    echo "Contributeur Yadasko https://github.com/Yadasko"
    echo "Fermture..."
}

dialog --title "Mc-script désinstallation" \
--backtitle "Mc-script désintallation" \
--yesno "Voulez-vous vraiment désinstallation" 7 60

response=$?
case $response in
   0) remove;;
   1) mc-script;;
   255) remove;
esac
clear
exit 0