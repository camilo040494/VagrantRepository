#!/usr/bin/env bash
sudo apt-get update 
tar xzvf apache-maven-3.5.2-bin.tar.gz /location/to/install
sudo echo "export PATH=$PATH:/location/to/install/bin" >> .bash_profile
source /etc/profile.d
#variables del entorno