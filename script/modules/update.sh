# update
clear
echo "Démarrage du programme..."
apt update && cd /opt
rm -R mc-script
clear && apt install dos2unix git -y
git clone https://github.com/zendrique/mc-script
dos2unix /opt/mc-script/installation.sh
bash /opt/mc-script/installation.sh --update
exit
