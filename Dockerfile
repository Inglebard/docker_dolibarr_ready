FROM php:7.4-apache-buster

MAINTAINER David RICQ <david@bsilimoges.fr>

ENV DOLI_READY_VERSION 13


ENV WWW_USER_ID 33
ENV WWW_GROUP_ID 33

ENV PHP_INI_DATE_TIMEZONE 'Europe/Paris'

RUN apt-get update -q && apt-get upgrade -yq \
	&& apt-get install -yq \
	libpng-dev \
	libjpeg-dev \
    libxml2-dev \
    default-mysql-client \
	unzip \
	libicu-dev \
	g++ \
	&& rm -rf /var/lib/apt/lists/* \
	&& docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
	&& docker-php-ext-configure intl \
	&& docker-php-ext-install mysqli pdo pdo_mysql gd soap zip intl


EXPOSE 80

COPY docker-run.sh /usr/local/bin/

WORKDIR /var/www/html

ENTRYPOINT ["/usr/local/bin/docker-run.sh"]
