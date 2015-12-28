FROM alpine:latest

MAINTAINER Johan

# Install PHP, nginx and bash (bash for debugging)
RUN apk update \
    && apk add bash \
	ca-certificates \
	nginx

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

# Remove temporary files from package manager to make the image smaller
RUN rm -rf /var/cache/apk/*

# Add our nginx conf
COPY nginx.conf /etc/nginx/

# We want to be able to listen to incoming traffic
EXPOSE 80

RUN adduser -S www-data

WORKDIR /etc/nginx
CMD ["nginx", "-g", "daemon off;"]
