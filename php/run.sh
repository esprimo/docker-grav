#!/bin/sh

# www-data need write access here
chown www-data -R /data/htdocs/backup
chown www-data -R /data/htdocs/user/data
chown www-data -R /data/htdocs/assets
chown www-data -R /data/htdocs/images
chown www-data -R /data/htdocs/logs
chown www-data -R /data/htdocs/cache

php-fpm --nodaemonize
