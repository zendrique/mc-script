# Présentation
Mc-script est script visant à aider les propriétaires de serveur Minecraft peut ou pas expérimenté, à créer facilement un serveur Minecraft.
Mc-script peut également aider les personnes plus compétentes à accélérer le déploiement et l'installation de leurs machine et serveur grâce à sa suite utilitaire.
Mc-script télécharge automatiquement installe les logiciels nécessaires, met à jour le serveur, installe java...
Pour exécuter Mc-script la dernière version de Debian 10 est recommandé.

# Installation
Pour installer mc-script copier colle la commande suivante dans un terminal (demande un accès root)
Vous devez disposer du packet : wget (sudo apt install wget)
```bash
wget https://github.com/zendrique/mc-script/releases/download/1.6/boot-mc-script.sh && bash boot-mc-script.sh
```
# Version prise en charge :
```
Vanilla dernière version
Snapshot dernière version
Forge toutes versions
Fabric 1.16.5
Spigot
Bukkit
Paperspigot 1.17
Tuinity 1.16.5
Airplane 1.16.5 (JDK 11)
Purpur 1.16.5
Sponge 1.12.2
CatServer 1.12.2
Mohist toutes versions
Thermos 1.7.10
Bungeecord 1.8 - 1.17
HexaCord 1.7.10 - 1.16.5
Travertine 1.7.10
Waterfall 1.8 - 1.16.5
Velocity 1.7.2 - 1.16.5
FlameCord 1.7 - 1.16.5
Mad-Pack
OpenMod
```
# Utilisation
Le script se présente tout simplement sous la forme d'un menu qui vous demandes ce que vous voulez installer
Quand mc-script est installé vous pouvez le démarrer tout simplement avec la commande suivante :
```
mc-script
```

# Version Spigot et Bukkit
Les version prise en charge par mc-script sont les version prises en charge par BuildTools.
Plus d'info > https://www.spigotmc.org/wiki/buildtools/

# Fonction OpenMod
La fonction OpenMod vous permet d'utiliser mc-script pour installer un serveur non pris en charge.
À noter qu’il est possible qui vous devriez faire des opérations manuelle avant de pourvoir commencer à utiliser votre serveur.
Cette fonction est notamment utilisée pour installer une version de spigot, bukkit, paperspigot, ... Non prise en charge par mc-script.
Cette fonction n'inclue pas la prise en charge de forge et sponge mais inclue certain de ces forks !
