#!/usr/bin/bash

#starts nginx 
service nginx start
#uses stream editor to convert welcome to nginx to My name
sed -i "s/Welcome to nginx/Welcome to Nathan's Page/" /var/www/html/*.html
#uses stream editor to convert nginx to pronounced
sed -i "s/nginx/nginx (pronouced as EngineX)/g" /var/www/html/*.html
#restarts nginx
service nginx restart

