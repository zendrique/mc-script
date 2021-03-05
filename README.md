# Présentation
Mc-script est script visant à aider les propriétaires de serveur Minecraft peut ou pas expérimenté, à créer facilement un serveur Minecraft.
Mc-script peut également aider les personnes plus compétentes à accélérer le déploiement et l'installation de leurs machine et serveur grâce à sa suite utilitaire.
Mc-script télécharge automatiquement installe les logiciels nécessaires, met à jour le serveur, installe java...
Pour exécuter Mc-script la dernière version de Debian 10 est recommandé.

# Installation
Pour installer mc-script copier colle la commande suivante dans un terminal (demande un accès root)
Vous devez disposer du packet : wget (sudo apt install wget)
```bash
wget https://github.com/zendrique/mc-script/releases/download/1.5/boot.sh && bash boot.sh
```
# Version prise en charge :
```
Vanilla 1.16.5
Snapshot 21W08A
Forge toutes versions
Fabric 1.16.5
Spigot
Bukkit
Paperspigot 1.16.5
Tuinity 1.16.5
Purpur 1.16.5
Sponge 1.12.2
CatServer 1.12.2
Mohist toutes versions
Thermos 1.7.10
Bungeecord 1.8 - 1.16.5
HexaCord 1.7.10 - 1.16.5
Travertine 1.7.10
Waterfall 1.8 - 1.16.5
Velocity 1.7.2 - 1.16.5
Mad-Pack
OpenMod
```
# Version Spigot et Bukkit
Les version prise en charge par mc-script sont les version prises en charge par BuildTools.
Plus d'info > https://www.spigotmc.org/wiki/buildtools/

# Fonction OpenMod
La fonction OpenMod vous permet d'utiliser mc-script pour installer un serveur non pris en charge.
À noter qu’il est possible qui vous devriez faire des opérations manuelle avant de pourvoir commencer à utiliser votre serveur.
Cette fonction est notamment utilisée pour installer une version de spigot, bukkit, paperspigot, ... Non prise en charge par mc-script.
Cette fonction n'inclue pas la prise en charge de forge et sponge mais inclue certain de ces forks !
