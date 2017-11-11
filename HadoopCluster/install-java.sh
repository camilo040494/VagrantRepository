#!/usr/bin/env bash
sudo apt-get update 
wget --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u102-b14/jdk-8u102-linux-x64.rpm
sudo yum localinstall jdk-8u102-linux-x64.rpm
rm ~/jdk-8u102-linux-x64.rpm