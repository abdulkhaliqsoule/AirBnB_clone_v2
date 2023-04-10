#!/usr/bin/env bash
# Script that configures Nginx server with some folders and files
apt-get -y update
apt-get -y install nginx
service nginx start
mkdir -p /data/web_static/releases/test/
mkdir -p /data/web_static/shared/
echo "ALX Africa SWE" > /data/web_static/releases/test/index.html
# Create a symbolic link
ln -sf /data/web_static/releases/test/ /data/web_static/current
# Give ownership of the /data/ folder to the ubuntu user and group
chown -R ubuntu:ubuntu /data/
# Update Nginx configuration
sed -i '38i\\tlocation /hbnb_static/ {\n\t\talias /data/web_static/current/;\n\t\tautoindex off;\n\t}\n' /etc/nginx/sites-available/default
service nginx restart
exit 0
