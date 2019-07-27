#!/bin/sh
# Script for installing a basic nginx webserver configuration with TLS and 
# certbot.
# Arguments:
# 1: user@IP
# 2: domain name in the form: "example.com"

ssh -t "$1" \
'sudo ufw allow 80; sudo ufw allow 443;'\
'sudo apt install nginx python-certbot-nginx;'

