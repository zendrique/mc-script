#!/bin/bash

os=$(cat /etc/os-release | grep VERSION_CODENAME | cut -d '=' -f 2)

if [ $os == "bullseye" ]; then
    echo "OS Compatible"
    exit 0
else
    echo "OS non compatible"
    exit 1
fi
