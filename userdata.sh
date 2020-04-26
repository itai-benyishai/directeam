#!/bin/bash
# User Data script for ex2 instance
yum update -y
yum install nginx -y
mkdir -p /data/app

# Copy index html files from s3
wget https://directeam-playground-website.s3.amazonaws.com/blue/blue.html -P /data/app/blue.html
#wget https://directeam-playground-website.s3.amazonaws.com/red/red.html -P /data/app/red.html

# Permission for nginx on files
chown -R nginx:nginx /data

# Start and enable nginx service
systemctl enable nginx
systemctl start nginx

