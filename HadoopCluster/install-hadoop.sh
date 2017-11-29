#!/usr/bin/env bash
echo "Installing Hadoop"

HADOOP_BIN=$(ls /vagrant/hadoop-2.7.3.tar.gz | head -n +1)
if [ -z $HADOOP_BIN ]; then
 echo "Downloading binaries"
 curl -O -L https://archive.apache.org/dist/hadoop/core/hadoop-2.7.3/hadoop-2.7.3.tar.gz
 echo "Download ended"
else
 echo "Binaries found, proceding to installing it"
 cp $HADOOP_BIN /home/vagrant/
fi

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


for i in `cat /etc/hosts | tail -n +4  | awk '{print $2}'`; do sudo echo -e $1 >> $HADOOP_COMMON_HOME/etc/hadoop/slaves
done

#cd /home/vagrant/hadoop-rel-release-2.7.3
#cp hadoop-yarn-project/hadoop-yarn/hadoop-yarn-server/hadoop-yarn-server-nodemanager/target/*.jar $HADOOP_COMMON_HOME/share

exec 3>&1 1>~/logs
for i in `cat ${HADOOP_COMMON_HOME}/etc/hadoop/slaves`; do echo $i; rsync -avxP --exclude=logs $HADOOP_COMMON_HOME/ $i:/usr/lib/hadoop/;
done
exec 1>&3 3>&-;

