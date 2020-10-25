#!/bin/bash

cd /tmp
mkdir sample-directory
#sudo yum install java-1.8.0 -y
sudo yum install java-1.8.0-openjdk-devel.x86_64 -y

# Setup JAVA_HOME Variables
sudo echo "JAVA_HOME="/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.201.b09-0.amzn2.x86_64/bin/java"" >> ~/.bashrc
sudo echo "JRE_HOME="/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.201.b09-0.amzn2.x86_64/jre/bin/java"" >> ~/.bashrc
sudo echo "PATH=$PATH:$HOME/bin:JAVA_HOME:JRE_HOME" >> ~/.bashrc

sudo source ~/.bashrc

# Installing RabbitMQ v3.6.1
#systemctl start rabbitmq-server.service
#systemctl enable rabbitmq-server.service
#rabbitmq-plugins enable rabbitmq_management
#rabbitmqctl add_user admin mqadminpassword
#rabbitmqctl set_user_tags admin administrator
#rabbitmqctl set_permissions -p / mqadmin ".*" ".*" ".*"


# Setup cron job
echo "*/5 * * * * sync; echo 3 > /proc/sys/vm/drop_caches  >/dev/null 2>&1" >> /var/spool/cron/root
