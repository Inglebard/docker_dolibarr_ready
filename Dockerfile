FROM php:7.2-apache-buster

MAINTAINER David RICQ <david@bsilimoges.fr>

ENV DOLI_READY_VERSION 9

RUN apt-get update -q && apt-get upgrade -yq \
	&& apt-get install -yq \
		libpng-dev \
		libjpeg-dev \
    libxml2-dev \
    default-mysql-client \
		unzip \
	&& rm -rf /var/lib/apt/lists/* \
	&& docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
	&& docker-php-ext-install mysqli pdo pdo_mysql gd soap zip


EXPOSE 80

WORKDIR /var/www/html
CMD ["apache2-foreground"]
