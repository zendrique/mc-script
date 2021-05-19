#!/bin/bash

dialog --title "Mc-script accord" \
--backtitle "Mc-script installation" \
--yesno "Mc-script sous licence GPL-3. En utilisant mc-script vous acceptez la charte d'utilisation de Mojang Studio (eula)"


response=$?
case $response in
   0) bash /opt/mc-script/installation/installation.sh ;;
   1) bash /opt/mc-script/script/utils/remove.sh;;
esac