#!/bin/bash

cd /tmp
#sudo yum install java-1.8.0 -y
sudo yum install java-1.8.0-openjdk-devel.x86_64 -y

# Setup JAVA_HOME Variables
sudo echo "JAVA_HOME="/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.201.b09-0.amzn2.x86_64/bin/java"" >> ~/.bashrc
sudo echo "JRE_HOME="/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.201.b09-0.amzn2.x86_64/jre/bin/java"" >> ~/.bashrc
sudo echo "PATH=$PATH:$HOME/bin:JAVA_HOME:JRE_HOME" >> ~/.bashrc

sudo source ~/.bashrc

# Installing Ansible
sudo amazon-linux-extras install epel -y
sudo yum update -y
sudo yum install ansible -y