#!/usr/bin/env bash
final_user=$USER
rm boot.sh
sudo bash initialisation.sh $final_user
exit