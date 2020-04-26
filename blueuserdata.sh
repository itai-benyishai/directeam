#!/bin/bash
# User Data script for ex2 instance
amazon-linux-extras install nginx1.12 -y
mkdir -p /data/app

# Remove default configuration nginx
rm -f /etc/nginx/nginx.conf

# Copy index html files from s3
wget https://directeam-playground-website.s3.amazonaws.com/blue/blue.html -P /data/app/
wget https://directeam-playground-website.s3.amazonaws.com/blue/nginx.conf -P /etc/nginx/

# Permission for nginx on files
chown -R nginx:nginx /data

# Start and enable nginx service
systemctl enable nginx
systemctl start nginx

