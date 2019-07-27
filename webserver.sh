#!/bin/sh
# Script for installing a basic nginx webserver configuration with TLS and 
# certbot.
# Arguments:
# 1: user@IP
# 2: domain name in the form: "example.com"

# Upload the nginx configuration file and HTML test page."
scp nginx-conf testpage.html "$1":~/

ssh -t "$1" \
'sudo ufw allow 80; sudo ufw allow 443; sudo ufw reload;'\
'sudo apt install nginx python-certbot-nginx;'\
'sudo rm /etc/nginx/sites-enabled/*;'\
'sudo mv testpage.html /var/www/html/;'\
'sed -i -e "s/xxxxx.xxx/'"$2"'/g" nginx-conf;'\
'sudo mv nginx-conf /etc/nginx/sites-available/'"$2"';'\
'sudo ln -s /etc/nginx/sites-available/'"$2"' /etc/nginx/sites-enabled/;'\
'sudo certbot --nginx;'\
'sudo systemctl reload nginx;'
