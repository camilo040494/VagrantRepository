#!/usr/bin/env bash

#On slaves
ssh-keyscan $NODE_MASTER | sort -u | grep ssh-rsa | awk '{ $2 " " $3 " vagrant@" $1}' >> .ssh/authorized_keys