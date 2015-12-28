FROM alpine:latest

MAINTAINER Johan

# Install PHP, nginx and bash (bash for debugging)
RUN apk update \
    && apk add bash \
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

RUN adduser -S www-data
RUN sed -i 's#listen = 127.0.0.1:9000#listen = 9000#' /etc/php/php-fpm.conf
RUN sed -i 's/user = nobody/user = www-data/' /etc/php/php-fpm.conf

COPY run.sh /
RUN chmod +x /run.sh
ENTRYPOINT ["/run.sh"]
