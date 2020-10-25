#!/bin/bash

yum update -y
#sudo yum install java-1.8.0 -y
sudo yum install java-1.8.0-openjdk-devel.x86_64 -y

# Setup JAVA_HOME Variables
#sudo echo "JAVA_HOME="/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.201.b09-0.amzn2.x86_64/bin/java"" >> ~/.bashrc
#sudo echo "JRE_HOME="/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.201.b09-0.amzn2.x86_64/jre/bin/java"" >> ~/.bashrc
#sudo echo "PATH=$PATH:$HOME/bin:JAVA_HOME:JRE_HOME" >> ~/.bashrc

#sudo source ~/.bashrc

# Install Docker
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce docker-ce-cli containerd.io
sudo systemctl start docker

#sudo rpm -iUvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
#sudo yum update -y
#sudo yum -y install docker-io
#sudo service docker start
#sudo chkconfig docker on

