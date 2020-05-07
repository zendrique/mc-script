#!/usr/bin/env bash
clear
echo "Démarage du programme.."
echo "Vérification des composant élémantaire..."
apt update && apt upgrade -y
apt install nano screen curl git zip apt-transport-https ca-certificates dirmngr gnupg software-properties-common -y
wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | apt-key add -
add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/
apt update
apt install adoptopenjdk-8-hotspot -y
clear
echo "Suppression du script..."
echo "Script par zendrique https://github.com/zendrique"
echo "Contributeur Yadasko https://github.com/Yadasko"
cd /home
rm -R mc-script
rm -f installation.sh
rm -f script.sh
echo "Mise à jour de mc-script..."
cd /home
echo "Téléchargement de mc-script..."
git clone https://github.com/zendrique/mc-script
clear
echo "[.] Compilation de mc-script"
cd /home/mc-script
bash build/build_standalone_script.sh
mv script.sh /home
clear
echo "[.] Démarage de mc-script"
cd /home
bash script.sh
