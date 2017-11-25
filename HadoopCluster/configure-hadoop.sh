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

echo "Downloading Protocolbuffer"
curl -L -O https://github.com/google/protobuf/releases/download/v2.5.0/protobuf-2.5.0.tar.gz
sudo tar -xzvf protobuf-2.5.0.tar.gz
cd protobuf-2.5.0
echo "Building Protocolbuffer"
sudo ./configure
sudo make
sudo make check
sudo make install
echo "Built of Protocolbuffer successfully end"

#cp jars
#cp eketal file y pom

echo "Downloading Hadoop"
curl -L -O https://github.com/apache/hadoop/archive/rel/release-2.7.3.tar.gz
sudo tar -xzvf release-2.7.3.tar.gz
cd hadoop-rel-release-2.7.3
sudo unalias cp #This removes the alias of cp that root users have (the alias is cp -i), so everytime a cp is used, it will ask when overring, with this command, that alias will not longer exist
# $which cp
#  alias cp='cp -i'
#          /usr/bin/cp

#sudo cp directory/to/pom.xml hadoop-yarn-project/hadoop-yarn/hadoop-yarn-server/hadoop-yarn-server-nodemanager/
#sudo cp directory/to/NodeManager.eketal hadoop-yarn-project/hadoop-yarn/hadoop-yarn-server/hadoop-yarn-server-nodemanager/src/main/java/org/apache/hadoop/yarn/server/nodemanager/

#mvn clean package -DskipTests=true
#cp yarn-servernode $HADOOP
#rsync
