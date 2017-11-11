#!/usr/bin/env bash

wget hadoop sources
install protoc-buffer
cp jars
cp eketal file

mvn clean package -DskipTests=true
cp yarn-servernode $HADOOP
rsync