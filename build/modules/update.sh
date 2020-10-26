# update
clear
echo "Démarage du programme..."
apt update && cd /opt
clear && apt install dos2unix git -y
git clone https://github.com/zendrique/mc-script
bash /opt/mc-script/installation.sh
exit
