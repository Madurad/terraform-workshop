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

# Installing RabbitMQ v3.8.3
wget https://github.com/rabbitmq/rabbitmq-server/releases/download/v3.8.3/rabbitmq-server-3.8.3-1.el6.noarch.rpm