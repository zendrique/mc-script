# Présentation
Mc-script est script visant à aider les proprietaires de serveur minecraft peut ou pas experimenter, à crée fracilement un serveur minecraft.
Mc-script peut également aider les personnes plus competantes à eccelérer le déploiment et l'installation de leurs machine et serveur grace à sa suite utilitaire.
Mc-script télécharge automatiquement installe les logicles necessaires met à jour le serveur...
Mc-script fonctionne sur debian et ubuntu.

# Installation
Pour installer mc-script copier colle les commandes suivantes dans un terminale (demande un accet root)
Vous devez disposer du packet : wget (sudo apt install wget)
```bash
1 : cd /home

2 : sudo wget https://github.com/zendrique/mc-script/releases/download/1.0/boot.sh && sudo bash boot.sh
```
# Version prise en charge :
```
Vanilla 1.15.2
Snapshot 20w20b
Forge 1.15.2 et 1.12.2
spigot 1.15.2
bukkit 1.15.2
paper 1.15.2
tuinity 1.15.2
Sponge 1.12.2
CatServer 1.12.2
Thermos 1.7.10
Bungeecord 1.8 - 1.15.2
HexaCord 1.7.10 - 1.15.2
Travertine 1.7.10
Waterfall 1.8 - 1.15.2
```
# Processus de build
Pour plus de lisibilité et de maintenabilité, les sources du script ont étés séparées dans des fichiers différents.

Pour **build le script**, il faut :

1. Avoir cloné le dépôt
2. Se rendre à la racine du dépôt
3. `bash build/build_standalone_script.sh`
4. Le script va remplacer toutes les occurences de "<INSERT_XXX>" avec le contenu du fichier builds/install_scripts/XXX.sh.
5. Le nouveau script pourra être retrouvé à la racine du dépot.

# Ajout de nouveaux scripts
L'ajout de nouveaux scripts ou types d'install n'est pas plus compliqué, mais nécessite plusieurs étapes :

1. Dans le fichier build/script_template.sh, ajouter une nouvelle option au 'case', et suivre le modèle des autres options. Exemple :
```bash
20) 
<INSERT_bukkit_v_XX>
;;
```
2. Créer dans le dossier build/modules le fichier correspondant.
> Attention, le nom du fichier doit correspondre à ce qui a été mis à l'étape 1. Dans notre exemple, le fichier devra s'appeller bukkit_v_XX.sh !
