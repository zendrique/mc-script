# Présentation
Mc-script est script visant à aider les proprietaires de serveur minecraft peut ou pas experimenter, à crée fracilement un serveur minecraft.
Mc-script peut également aider les personnes plus competantes à eccelérer le déploiment et l'installation de leurs machine et serveur grace à sa suite utilitaire.
Mc-script télécharge automatiquement installe les logicles necessaires met à jour le serveur...
Pour exectuer Mc-script nous recommendons d'utiliser Debian.

# Installation
Pour installer mc-script copier colle les commandes suivantes dans un terminale (demande un accet root)
Vous devez disposer du packet : wget (sudo apt install wget)
```bash
1 : cd /home

2 : sudo wget https://github.com/zendrique/mc-script/releases/download/1.2/boot.sh && sudo bash boot.sh
```
# Version prise en charge :
```
Vanilla 1.16.1
Snapshot 1.16.2 Release Candidate 2
Forge toutes versions
spigot
bukkit
paper 1.16.1
tuinity 1.15.2
Sponge 1.12.2
CatServer 1.12.2
Mohist 1.12.2
Thermos 1.7.10
Bungeecord 1.8 - 1.16.1
HexaCord 1.7.10 - 1.16.1
Travertine 1.7.10
Waterfall 1.8 - 1.16.1
Mad-Pack
OpenMod
```
# Version Spigot et Bukkit
Les version prise en charge par mc-script sont les version prises en charge par BuildTools.
Plus d'info > https://www.spigotmc.org/wiki/buildtools/

# Fonction OpenMod
La fonction OpenMod vous permet d'utiliser mc-script pour installer un serveur non prise en charge.
A noter que il est possible qui vous devriez faire des operations manuelle avent de pourvoire commencer à utliser votre serveur.
Cette fonction est notament utilise pour installer une version de spigot, bukkit, paperspigot,... Non prise en charge par mc-script.
Cette fonction n'inclue pas la prise en charge de forge et sponge mais incule certain de ces fork !

# Processus de build
Pour plus de lisibilité et de maintenabilité, les sources du script ont étés séparées dans des fichiers différents.

Pour **build le script**, il faut :

1. Avoir cloné le dépôt
2. Se rendre à la racine du dépôt
3. `bash build/build_standalone_script.sh`
4. Le script va remplacer toutes les occurences de "<INSERT_XXX>" avec le contenu du fichier builds/modules/XXX.sh.
5. Le nouveau script pourra être retrouvé à la racine du dépot.

# Ajout de nouveaux scripts
L'ajout de nouveaux scripts ou types d'install n'est pas plus compliqué, mais nécessite plusieurs étapes :

1. Dans le fichier build/mc-script_template.sh, ajouter une nouvelle option au 'case', et suivre le modèle des autres options. Exemple :
```bash
20) 
<INSERT_bukkit_v_XX>
;;
```
2. Créer dans le dossier build/modules le fichier correspondant.
> Attention, le nom du fichier doit correspondre à ce qui a été mis à l'étape 1. Dans notre exemple, le fichier devra s'appeller bukkit_v_XX.sh !
