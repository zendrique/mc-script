mc-script est script visant à aider les proprietaires de serveur minecraft peut ou pas experimenter, à crée fracilement un serveur minecraft.
mc-script télécharge automatiquement installe les logicles necessaires met à jour le serveur...
mc-script fonctionne sur debian et ubuntu.

Pour installer mc-script copier colle les commandes suivante dans un terminale (demande un accet root)
Vous devez disposer de packet wget

1 : cd /home

2: sudo wget https://github.com/zendrique/mc-script/releases/download/0.11/script.sh && sudo sh script.sh

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
2. Créer dans le dossier build/install_scripts le fichier correspondant.
> Attention, le nom du fichier doit correspondre à ce qui a été mis à l'étape 1. Dans notre exemple, le fichier devra s'appeller bukkit_v_XX.sh !
