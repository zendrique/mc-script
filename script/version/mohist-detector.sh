#!/usr/bin/env bash

pach="/opt/mc-script/variable"

if [ "$1" == "--1.7.10" ]
then
  clear
  echo "Détermination du lien..."
  version_7=$(curl -s 'https://mohistmc.com/api/1.7.10/latest' | jq -r '.url')
  echo $version_7 >> $pach/mohist-version.txt
fi
if [ "$1" == "--1.12.2" ]
then
  clear
  echo "Détermination du lien..."
  version_12=$(curl -s 'https://mohistmc.com/api/1.12.2/latest' | jq -r '.url')
  echo $version_12 >> $pach/mohist-version.txt
fi
if [ "$1" == "--1.16.5" ]
then
  clear
  echo "Détermination du lien..."
  version_16=$(curl -s 'https://mohistmc.com/api/1.16.5/latest' | jq -r '.url')
  echo $version_16 >> $pach/mohist-version.txt
fi
exit