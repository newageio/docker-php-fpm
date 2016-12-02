FROM phpdockerio/php71-fpm:latest

MAINTAINER Roman Dutchak "dutchakdev@gmail.com"

ENV PHP_VERSION 7.1

RUN apt-get update \
    && apt-get -y --no-install-recommends install  php-memcached php${NGINX_VERSION}-mysql php${NGINX_VERSION}-gd php${NGINX_VERSION}-intl php${NGINX_VERSION}-mbstring php${NGINX_VERSION}-phpdbg php-yaml \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

RUN apt-get install libcurl4-openssl-dev pkg-config libssl-dev libsslcommon2-dev php${NGINX_VERSION}-dev php-pear -y

RUN pecl install mongodb

echo "extension=mongodb.so" > /etc/php/${NGINX_VERSION}/cli/conf.d/25-mongodb.ini

RUN mkdir -p /var/run/php/

WORKDIR "/var/www/"