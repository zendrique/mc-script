#!/bin/bash

os=$(cat /etc/issue)

if [ "$os" == "Debian GNU/Linux 11 \n \l" ]; then
    exit 0
else
    exit 1
fi