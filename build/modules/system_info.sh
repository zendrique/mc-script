# Info système
clear
echo "Votre Système :"
uname -a
echo "Contributeurs : Zendrique et Yadasko"
echo "Il est recommander d'éxectuer mc-script sur Debian."
echo "Mc-script devrais fonction sur les sytéme fonctionnant avec, apt même si le fonctionnement du scripte n'est pas garentie à 100%."
echo "Retour au menue dans 10 secondes."
echo "Voulez-vous continuer ? (1 ou 2)"
select remove in "Oui" "Non"; do
    case $remove in
        Oui ) bash /opt/mc-script/mc-script.sh
        exit break;;
        Non ) exit break;;
        esac
done
