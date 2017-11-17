#!/usr/bin/env bash
echo "Installing Java"
#sudo apt-get update -y
#wget -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm
#curl -v -j -k -L -H "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm > jdk-8u112-linux-x64.rpm
cp /vagrant/jdk-8u151-linux-x64.rpm /home/vagrant/
sudo chown vagrant:vagrant jdk-8u151-linux-x64.rpm
sudo yum install -y /home/vagrant/jdk-8u151-linux-x64.rpm
rm /home/vagrant/jdk-8u102-linux-x64.rpm
echo "Installation of Java complete"