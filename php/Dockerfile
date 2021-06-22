FROM php:7.4-fpm
# 相关依赖必须手动安装 PS: PHP拓展插件目录： /usr/src/php/ext
RUN apt update && apt-get install -y  zlib1g-dev libzip-dev libfreetype6-dev libjpeg62-turbo-dev libmcrypt-dev libpng-dev \
&& docker-php-ext-install gd && docker-php-ext-install zip
