#!/bin/bash

# Installing AWS CLI
yum install aws-cli -y

# Downloading bootstrap script and starting it
#aws s3 cp s3://my-s3-bucket-madura/redis-install.sh /tmp && sh /tmp/redis-install.sh

mkdir -p /tmp/sample-directory
echo "Installing Redis" >> /home/ec2-user/sample.txt
