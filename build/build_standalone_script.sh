#!/usr/bin/env bash

echo "[.] Building standalone script..."

SCRIPT_PATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

rm -f ${SCRIPT_PATH}/../script.sh &&
cp ${SCRIPT_PATH}/script_template.sh ${SCRIPT_PATH}/script.sh 

for file in ${SCRIPT_PATH}/install_scripts/*
do
    file_name=$(echo $file | rev |  cut -d'/' -f 1 | rev | cut -d'.' -f 1)
    script_path="${SCRIPT_PATH}/install_scripts/${file_name}.sh"
    sed -i -e "/<INSERT_${file_name}>/{r ${script_path}" -e 'd}' ${SCRIPT_PATH}/script.sh
    echo "[*] ${file_name} a bien été ajouté"
done
mv ${SCRIPT_PATH}/script.sh ${SCRIPT_PATH}/../script.sh
echo "[*] Le fichier script.sh a bien été créé."
