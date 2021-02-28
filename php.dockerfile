FROM php:7.4-fpm-alpine

ADD ./php/www.conf /usr/local/etc/php-fpm.d/www.conf

RUN addgroup -g 1000 laravel && adduser -G laravel -g laravel -s /bin/sh -D laravel

RUN mkdir -p /usr/local/apache2/htdocs

RUN chown laravel:laravel /usr/local/apache2/htdocs
RUN chown www-data:www-data /usr/local/apache2/htdocs

WORKDIR /usr/local/apache2/htdocs

RUN apk add --update --no-cache autoconf
RUN apk add --update --no-cache g++
RUN apk add --update --no-cache libtool
RUN apk add --update --no-cache make
RUN apk --no-cache --update add curl
RUN apk --no-cache --update add libcurl
RUN apk --no-cache --update add build-base libgit2-dev
RUN apk add --no-cache zip libzip-dev
RUN apk add --no-cache libsodium-dev
RUN apk add --update --no-cache icu-dev
RUN apk add --update --no-cache libxml2-dev
RUN apk add --update --no-cache libpng-dev
RUN apk add --update --no-cache jpeg-dev
RUN apk add --update --no-cache libxslt-dev
RUN apk add --update --no-cache freetype-dev

RUN docker-php-ext-install bcmath
RUN docker-php-ext-install ctype
RUN ln -s /usr/lib/libcurl.so.4 /usr/lib/libcurl-gnutls.so.4
RUN docker-php-ext-install curl
RUN docker-php-ext-install gd
RUN docker-php-ext-configure gd --with-jpeg --with-freetype
RUN docker-php-ext-install -j$(nproc) gd

RUN docker-php-ext-install intl
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install pdo
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-configure soap
RUN docker-php-ext-install soap
RUN docker-php-ext-configure zip
RUN docker-php-ext-install zip
RUN docker-php-ext-install sockets
RUN docker-php-ext-install sodium
RUN docker-php-ext-install xsl



