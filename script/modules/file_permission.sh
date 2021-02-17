#!/usr/bin/env bash

path="/home"
dossier=$(cat /opt/mc-script/variable/dossier.txt)
final_user=$(cat /opt/mc-script/variable/final_user.txt)

sudo chown -R $final_user:$final_user $path/$dossier
exit