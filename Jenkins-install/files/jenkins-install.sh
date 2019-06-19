#!/bin/bash

cd /tmp
mkdir sample-directory
#sudo yum install java-1.8.0 -y
sudo yum install java-1.8.0-openjdk-devel.x86_64 -y

# Installing Jenkins Latest version
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
yum install jenkins -y 
sudo service jenkins start

# Installing Git Client
sudo yum install git -y

# Installing Docker
sudo yum update -y
sudo amazon-linux-extras install docker -y
sudo service docker start
sudo chkconfig docker on

#cd /opt/
#wget localhost:8080/jnlpJars/jenkins-cli.jar