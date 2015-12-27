FROM alpine:latest

MAINTAINER Johan

# Install PHP, nginx and bash (no need for mysql support)
RUN apk update \
    && apk add bash nginx ca-certificates \
    php-fpm php-json php-zlib php-xml php-pdo php-phar php-openssl \
    php-gd php-iconv php-mcrypt php-ctype php-curl

# Remove temporary files from package manager to make the image smaller
RUN rm -rf /var/cache/apk/*

# Add our nginx conf
COPY nginx.conf /etc/nginx/

# We want to be able to listen to incoming traffic
EXPOSE 80

# /data will hold all our persistent data
#VOLUME /data

# Start php and nginx on start
COPY run.sh /
RUN chmod +x /run.sh
ENTRYPOINT ["/run.sh"]
