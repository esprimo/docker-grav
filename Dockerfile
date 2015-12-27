FROM alpine:latest

MAINTAINER Johan

# Install PHP, nginx and bash (bash for debugging)
RUN apk update \
    && apk add bash \
	ca-certificates \
	nginx \
	php-ctype \
	php-curl \
	php-fpm \
	php-gd \
	php-iconv \
	php-json \
	php-mcrypt \
	php-openssl \
	php-pdo \
	php-phar \
	php-xml \
	php-zlib

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
