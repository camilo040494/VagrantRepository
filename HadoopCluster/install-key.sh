#!/usr/bin/env bash

#On master

sshpass -p "vagrant" ssh-copy-id -o StrictHostKeyChecking=no vagrant@192.168.2.72
#NODE_MASTER=$1
#ssh-keyscan -t rsa $NODE_MASTER | awk '{print $2 " " $3 " vagrant@" $1}' >> .ssh/known_hosts