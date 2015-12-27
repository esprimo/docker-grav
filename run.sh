#!/bin/sh
mkdir -p /data/logs/php-fpm
mkdir -p /data/logs/nginx

# Add user for nginx
adduser -S www-data

# Grav needs to write to the disk (it's db less)
if [ -d /data/htdocs ]; then
	chown -R www-data /data/htdocs
fi

# Run PHP as www-data
sed -i 's/user = nobody/user = www-data/' /etc/php/php-fpm.conf

# Start services
php-fpm
nginx
