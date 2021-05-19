#!/bin/bash

dialog --title "Mc-script accord" \
--backtitle "Mc-script installation" \
--yesno "Mc-script sous licence GPL-3. En utilisant mc-script vous acceptez la charte d'utilisation de Mojang Studio (eula)" 7 60

function remove {
   rm -r /opt/mc-script
   echo "Acoord non accpeter, installation alnuler !"
}


response=$?
case $response in
   0) bash /opt/mc-script/installation/installation.sh ;;
   1) remove;;
   255) remove;
esac