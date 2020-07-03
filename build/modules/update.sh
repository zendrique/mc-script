# update
clear
echo "Démarage du programme..."
apt update && cd /home
clear && apt install dos2unix git -y
git clone https://github.com/zendrique/mc-script && mv /home/mc-script/installation.sh /home
cd /home && dos2unix installation.sh
rm -f boot.sh && bash installation.sh 
exit
