#!/usr/bin/env bash
echo "Installing MAVEN"
curl -O curl -O https://www-eu.apache.org/dist/maven/maven-3/3.6.2/binaries/apache-maven-3.6.2-bin.tar.gz
sudo tar -xzvf apache-maven-3.6.2-bin.tar.gz -C /usr/lib
sudo touch /etc/profile.d/mvn.sh
sudo echo "export PATH=$PATH:/usr/lib/apache-maven-3.5.2/bin" >> /etc/profile.d/mvn.sh
#sudo echo "export PATH=$PATH:/usr/lib/apache-maven-3.5.2/bin" >> /home/vagrant/.bash_profile
sudo rm /home/vagrant/apache-maven-3.5.2-bin.tar.gz
#source /home/vagrant/.bash_profile
#variables del entorno
