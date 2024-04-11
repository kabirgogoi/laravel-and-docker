FROM php:8.2-fpm as php

# Install PHP extensions
RUN docker-php-ext-install pdo pdo_mysql mbstring exif pcntl bcmath gd

# Set working directory
WORKDIR /var/www/html

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

ENTRYPOINT [ "dockerfiles/entrypoint.sh" ]

#  NodeJS
FROM node:20-alpine as node

WORKDIR /var/www/html
COPY . .

VOLUME /var/www/node_modules
