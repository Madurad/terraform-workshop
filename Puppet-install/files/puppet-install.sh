#!/bin/bash

# Setting up hostnames
sudo hostnamectl set-hostname puppetmaster.example.com


yum update -y
#sudo yum install java-1.8.0 -y
sudo yum install java-1.8.0-openjdk-devel.x86_64 -y

# Setup JAVA_HOME Variables
sudo echo "JAVA_HOME="/usr/java/jdk1.8.0_191-amd64/bin/java"" >> ~/.bashrc
sudo echo "JRE_HOME="/usr/java/jdk1.8.0_191-amd64/jre/bin/java"" >> ~/.bashrc
sudo echo "PATH=$PATH:$HOME/bin:JAVA_HOME:JRE_HOME" >> ~/.bashrc



sudo source ~/.bashrc

# Install Puppet
sudo rpm -Uvh https://yum.puppet.com/puppet6-release-el-7.noarch.rpm
sudo yum install puppetserver.noarch -y
rpm -qa | grep -i puppet