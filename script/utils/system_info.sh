# Info système
clear
echo "Votre Système :"
uname -a
echo "Version de Debian :"
cat /etc/issue
echo "Contributeurs : Zendrique et Yadasko"
echo "Voulez-vous continuer ? (1 ou 2)"
select remove in "Oui" "Non"; do
    case $remove in
        Oui ) bash /opt/mc-script/mc-script.sh
        exit break;;
        Non ) exit; break;;
        esac
done
