#!/usr/bin/env bash

####install protoc-buffer:
#apt-get update
#apt-get upgrade
#apt-get install -y gcc g++
echo "Installing C and C++ compilers"
sudo yum update -y
sudo yum install -y gcc gcc-c++

#yum install -y wget
#wget 

PROTO_BF=$(ls /vagrant/protobuf-2.5.0.tar.gz | head -n +1)
if [ -z $PROTO_BF ]; then
 echo "No protol buffer file found, proceding to download it"
 echo "Downloading Protocolbuffer"
 curl -L -O https://github.com/google/protobuf/releases/download/v2.5.0/protobuf-2.5.0.tar.gz
else
 echo "ProtocolBuffer found, proceding to built it"
 cp $PROTO_BF /home/vagrant
fi

sudo tar -xzvf protobuf-2.5.0.tar.gz
cd protobuf-2.5.0
echo "Building Protocolbuffer"
sudo ./configure
sudo make
sudo make check
sudo make install
echo "Built of Protocolbuffer successfully ended"

#cp jars
#cp eketal file y pom

HADOOP_SRC=$(ls /vagrant/hadoop-rel*.tar.gz | head -n +1)
if [ -z $HADOOP_SRC ]; then
 echo "Binaries not found, proceding to download them"
 cd /home/vagrant
 echo "Downloading Hadoop"
 curl -L -O https://github.com/apache/hadoop/archive/rel/release-2.7.3.tar.gz
else
 echo "Sources of Hadoop found, proceding to built them"
 cp $HADOOP_SRC /home/vagrant/release-2.7.3.tar.gz
fi

sudo tar -xzvf release-2.7.3.tar.gz
cd hadoop-rel-release-2.7.3

#If retorna algo, unalias,sino siga igual
which cp | grep "cp -i"

sudo unalias cp #This removes the alias of cp that root users have (the alias is cp -i), so everytime a cp is used, it will ask when overring, with this command, that alias will not longer exist
# $which cp
#  alias cp='cp -i'
#          /usr/bin/cp


echo "Copying required files into sources of hadoop"
#sudo cp directory/to/pom.xml hadoop-yarn-project/hadoop-yarn/hadoop-yarn-server/hadoop-yarn-server-nodemanager/
#sudo cp directory/to/NodeManager.eketal hadoop-yarn-project/hadoop-yarn/hadoop-yarn-server/hadoop-yarn-server-nodemanager/src/main/java/org/apache/hadoop/yarn/server/nodemanager/

echo "Building required jars from sources"
#sudo mvn clean package -DskipTests=true

echo "Built of sources successfully ended"
