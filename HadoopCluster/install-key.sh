#!/usr/bin/env bash

#On slaves
NODE_MASTER=$1
ssh-keyscan -t rsa $NODE_MASTER | awk '{print $2 " " $3 " vagrant@" $1}' >> .ssh/authorized_keys