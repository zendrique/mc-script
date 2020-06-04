# Débogage
clear
echo "Démarage du Débogage..."
sleep 1
echo "Vérification des fichier de démarages..."
cd /home/vanilla
rm -f eula.txt
rm -f start.sh
touch eula.txt && echo "eula=true" >> eula.txt
touch start.sh && echo "screen -d -m -S vanilla java -Xmx1024M -Xms1024M -jar server.jar nogui" >> start.sh

cd /home/snapshot
rm -f eula.txt
rm -f start.sh
touch eula.txt && echo "eula=true" >> eula.txt
touch start.sh && echo "screen -d -m -S snapshot java -Xmx1024M -Xms1024M -jar server.jar nogui" >> start.sh

cd /home/spigot
rm -f eula.txt
rm -f start.sh
touch eula.txt && echo "eula=true" >> eula.txt
touch start.sh && echo "screen -d -m -S spigot java -Xms3G -Xmx3G -XX:+UseConcMarkSweepGC -jar spigot.jar nogui" >> start.sh

cd /home/bukkit
rm -f eula.txt
rm -f start.sh
touch eula.txt && echo "eula=true" >> eula.txt
touch start.sh && echo "screen -d -m -S bukkit java -Xms3G -Xmx3G -XX:+UseConcMarkSweepGC -jar craftbukkit.jar nogui" >> start.sh

cd /home/paperspigot
rm -f eula.txt
rm -f start.sh
touch eula.txt && echo "eula=true" >> eula.txt
touch start.sh && echo "screen -d -m -S paperspigot java -Xms3G -Xmx3G -XX:+UseConcMarkSweepGC -jar paperclip.jar nogui" >> start.sh

cd /home/forge-1.15.2
rm -f eula.txt
rm -f start.sh
touch eula.txt && echo "eula=true" >> eula.txt
touch start.sh && echo "screen -d -m -S forge-1.15.2 java -jar forge.jar nogui" >> start.sh

cd /home/forge-1.12.2
rm -f eula.txt
rm -f start.sh
touch eula.txt && echo "eula=true" >> eula.txt
touch start.sh && echo "screen -d -m -S forge-1.12.2 java -jar forge.jar nogui" >> start.sh

cd /home/sponge
rm -f eula.txt
rm -f start.sh
touch eula.txt && echo "eula=true" >> eula.txt
touch start.sh && echo "screen -d -m -S sponge java -jar forge.jar nogui" >> start.sh

cd /home/catserver
rm -f eula.txt
rm -f start.sh
touch eula.txt && echo "eula=true" >> eula.txt
touch start.sh && echo "screen -d -m -S catserver java -jar CatServer.jar nogui" >> start.sh

cd /home/thermos
rm -f eula.txt
rm -f start.sh
touch eula.txt && echo "eula=true" >> eula.txt
touch start.sh && echo "screen -d -m -S thermos java -jar Thermos.jar nogui" >> start.sh

cd /home/bungeecord
rm -f eula.txt
rm -f start.sh
touch eula.txt && echo "eula=true" >> eula.txt
touch start.sh && echo "screen -d -m -S bungeecord java -jar BungeeCord.jar nogui" >> start.sh

cd /home/waterfall
rm -f eula.txt
rm -f start.sh
touch eula.txt && echo "eula=true" >> eula.txt
touch start.sh && echo "screen -d -m -S waterfall java -jar Waterfall.jar nogui" >> start.sh

cd /home/travertine
rm -f eula.txt
rm -f start.sh
touch eula.txt && echo "eula=true" >> eula.txt
touch start.sh && echo "screen -d -m -S travertine java -jar Travertine.jar nogui" >> start.sh

cd /home/hexacord
rm -f eula.txt
rm -f start.sh
touch eula.txt && echo "eula=true" >> eula.txt
touch start.sh && echo "screen -d -m -S hexacord java -jar HexaCord.jar nogui" >> start.sh

cd /home/modPack
rm -f eula.txt
touch eula.txt && echo "eula=true" >> eula.txt

cd /home/mohist
rm -f eula.txt
rm -f start.sh
touch eula.txt && echo "eula=true" >> eula.txt
touch start.sh && echo "screen -d -m -S mohist java -jar mohist.jar nogui" >> start.sh

cd /home/tuinity
rm -f eula.txt
rm -f start.sh
touch eula.txt && echo "eula=true" >> eula.txt
touch start.sh && echo "screen -d -m -S tuinity java -XX:+UseConcMarkSweepGC -jar tuinity-paperclip.jar nogui" >> start.sh

clear
echo "Vérification des permissions..."
sleep 1
cd /home
chmod 777 vanilla
chmod 777 -R vanilla/

chmod 777 snapshot/
chmod 777 -R snapshot/

chmod 777 spigot/
chmod 777 -R spigot/

chmod 777 bukkit/
chmod 777 -R bukkit/

chmod 777 paperspigot/
chmod 777 -R paperspigot/

chmod 777 forge-1.15.2/
chmod 777 -R forge-1.15.2/

chmod 777 forge-12.2/
chmod 777 -R forge-1.12.2/

chmod 777 sponge/
chmod 777 -R sponge/

chmod 777 catserver
chmod 777 -R catserver/

chmod 777 thermos
chmod 777 -R thermos/

chmod 777 bungeecord
chmod 777 -R bungeecord/

chmod 777 waterfall
chmod 777 -R waterfall/

chmod 777 travertine
chmod 777 -R travertine/

chmod 777 hexacord
chmod 777 -R hexacord/

chmod 777 modPack
chmod 777 -R hexacord/

chmod 777 mohist
chmod 777 -R mohist/

chmod 777 tuinity
chmod 777 -R tuinity/

clear
echo "Débogage terminer !"
echo "Si votre Problème n'est pas résolue aller voire"
echo "https://github.com/zendrique/mc-script/issues"
echo "Pour obtenir de l'aide"