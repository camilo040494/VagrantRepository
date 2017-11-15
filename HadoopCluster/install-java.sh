#!/usr/bin/env bash
echo "Installing Java"
#sudo apt-get update -y
#wget --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u102-b14/jdk-8u102-linux-x64.rpm
curl -L -b "oraclelicense=a" http://download.oracle.com/otn-pub/java/jdk/8u102-b14/jdk-8u102-linux-x64.rpm -O
sudo yum install /home/vagrant/jdk-8u102-linux-x64.rpm ./rpm/
rm /home/vagrant/jdk-8u102-linux-x64.rpm
echo "Installation of Java complete"