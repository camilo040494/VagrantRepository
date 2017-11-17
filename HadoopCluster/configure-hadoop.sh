#!/usr/bin/env bash

curl hadoop sources

####install protoc-buffer:
#apt-get update
#apt-get upgrade
#apt-get install -y gcc g++
yum install gcc-c++
curl -O https://github.com/google/protobuf/releases/download/v2.5.0/protobuf-2.5.0.tar.gz
tar -xzvf protobuf-2.5.0.tar.gz
cd protobuf-2.5.0
sudo ./configure
sudo make
sudo make check
sudo make install


cp jars
cp eketal file

mvn clean package -DskipTests=true
cp yarn-servernode $HADOOP
rsync
