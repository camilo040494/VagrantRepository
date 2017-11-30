#!/usr/bin/env bash
echo "Building EKETAL"
git clone -b master https://github.com/unicesi/eketal.git
cd eketal/co.edu.icesi.eketal.parent-master
sudo -u root mvn clean install -DskiptTests=true
sudo touch /etc/profile.d/eketal.sh
sudo echo "export EKETAL_HOME=/home/vagrant/eketal/" >> /etc/profile.d/eketal.sh
echo "EKETAL built succesfully"