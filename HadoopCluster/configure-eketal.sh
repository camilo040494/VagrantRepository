#!/usr/bin/env bash

git clone -b master https://github.com/unicesi/eketal.git
cd eketal/co.edu.icesi.eketal.parent-master
mvn clean install -DskiptTests=true
cp $EKETAL_HOME/co.edu.icesi.eketal.lib/target/*jar $HADOOP_COMMON_HOME/share/hadoop/yarn/lib;