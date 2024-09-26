#!/bin/bash

echo "server {
	listen 443 ssl;
	listen [::]:443 ssl;

	ssl_certificate $CERTS_;
	ssl_certificate_key /etc/ssl/private/nginx-selfsigned.key;

	ssl_protocols TLSv1.3;

	root /var/www/html;

	index index.php index.html index.htm index.nginx-debian.html;

	server_name www.$DOMAIN_NAME $DOMAIN_NAME;" > /etc/nginx/sites-available/default

echo '
	location / {
		try_files $uri $uri/ =404;
	}

	location ~ \.php$ {
		include snippets/fastcgi-php.conf;
		fastcgi_pass wp-php:9000;
	}
}' >> /etc/nginx/sites-available/default

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/ssl/private/nginx-selfsigned.key \
	-out $CERTS_ \
	-subj "/C=ES/L=MA/O=42/OU=student/CN=$DOMAIN_NAME"

nginx -g "daemon off;"
