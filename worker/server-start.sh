#!/bin/bash

dosier="/home"

nom="$1"
java="$2"
architecture=$("uname -m")

if [ "$architecture" == "x86_64" ]; then
    architecture="amd64"
elif [ "$architecture" == "aarch64"]; then # (ARM 64-bits uniquement)
    architecture="aarch64"
else
    architecture="INCONNUE"
    clear
    echo "Architecture processeur inconnue ! Vous deverez adapter le script de démarrarrage vous-même !"
    echo "Reprise du script dans 10 secondes..."
    sleep 10
fi

if [ "$java" == "1" ]; then
    bin=/usr/lib/jvm/java-8-openjdk-$architecture/bin
elif [ "$java" == "2" ]; then
    bin=/usr/lib/jvm/java-11-openjdk-$architecture/bin
elif [ "$java" == "3" ]; then
    bin=/usr/lib/jvm/java-16-openjdk-$architecture/bin
elif [ "$java" == "4" ]; then
    bin=/usr/lib/jvm/java-17-openjdk-$architecture/bin
fi

echo "#!/bin/bash" > /home/$nom/start.sh
echo "$bin -jar serveur.jar --nogui" >> $dossier/$nom/start.sh


# Pour signaler qu'il y à eu un problème dans le cas ou l'architecture n'est pas connue
# Diferrent de 1 car c'est un avertissement et non une erreur
if [ "$architecture" == "INCONNUE" ]; then
    exit 2
fi

exit 0