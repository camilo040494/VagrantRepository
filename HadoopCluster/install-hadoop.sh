#!/usr/bin/env bash
echo "Installing Hadoop"

echo "Downloading binaries"

curl -O -L https://archive.apache.org/dist/hadoop/core/hadoop-2.7.3/hadoop-2.7.3.tar.gz
echo "Download ended"

sudo tar -xzvf hadoop-2.7.3.tar.gz -C /usr/lib
sudo touch /etc/profile.d/hadoop.sh
sudo cat >/etc/profile.d/hadoop.sh <<EOL
export HADOOP_COMMON_HOME=/usr/lib/hadoop-2.7.3
export HADOOP_MAPRED_HOME=$HADOOP_COMMON_HOME
export HADOOP_HDFS_HOME=$HADOOP_COMMON_HOME
export YARN_HOME=$HADOOP_COMMON_HOME
export PATH=$PATH:$HADOOP_COMMON_HOME/bin
export PATH=$PATH:$HADOOP_COMMON_HOME/sbin
export HADOOP_PREFIX=$HADOOP_COMMON_HOME
EOL

sudo source /etc/profile.d/eketal.sh
sudo source /etc/profile.d/hadoop.sh

#Cuando tail -n es igual a 4 incluye el master, cuando es 5 no lo incluye al master
cat /etc/hosts | tail -n +4  | awk '{print $2}' >> $HADOOP_COMMON_HOME/etc/hadoop/slaves
#for i in `cat /etc/hosts | tail -n +4  | awk '{print $2}'`; do sudo echo -e $1 >> $HADOOP_COMMON_HOME/etc/hadoop/slaves
#done

cd /home/vagrant/hadoop-rel-release-2.7.3
cp hadoop-yarn-project/hadoop-yarn/hadoop-yarn-server/hadoop-yarn-server-nodemanager/target/*.jar $HADOOP_COMMON_HOME/share/hadoop/yarn
cd .m2/repository/repository/
cp dk/brics/automaton/automaton/1.11-8/*.jar $HADOOP_COMMON_HOME/share/hadoop/yarn/lib
cp org/aspectj/aspectjrt/1.8.9/*.jar $HADOOP_COMMON_HOME/share/hadoop/yarn/lib
cp org/jgroups/jgroups/3.6.14.Final/*.jar $HADOOP_COMMON_HOME/share/hadoop/yarn/lib
cp $EKETAL_HOME/co.edu.icesi.eketal.lib/target/*jar $HADOOP_COMMON_HOME/share/hadoop/yarn/lib

#################
#Falta los demas archivos del $HADOOP_COMMON_HOME/etc/hadoop/
#################

exec 3>&1 1>~/logs
for i in `cat ${HADOOP_COMMON_HOME}/etc/hadoop/slaves | head -n -1`; do echo $i; rsync -avxP --exclude=logs $HADOOP_COMMON_HOME/ $i:/usr/lib/hadoop/;
done
exec 1>&3 3>&-;

