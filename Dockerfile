FROM phpdockerio/php71-fpm:latest

MAINTAINER Roman Dutchak "dutchakdev@gmail.com"

ENV PHP_VERSION 7.1

RUN apt-get update \
    && apt-get -y --no-install-recommends install  php-memcached php${PHP_VERSION}-mysql php${PHP_VERSION}-gd php${PHP_VERSION}-intl php${PHP_VERSION}-mbstring php${PHP_VERSION}-phpdbg php-yaml \
    && apt-get install libcurl4-openssl-dev pkg-config libssl-dev libsslcommon2-dev php${PHP_VERSION}-dev php-pear -y

RUN pecl install mongodb

RUN apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

RUN echo "extension=mongodb.so" > /etc/php/${PHP_VERSION}/cli/conf.d/25-mongodb.ini

RUN mkdir -p /var/run/php/

WORKDIR "/var/www/"