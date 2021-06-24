FROM php:7.4-fpm
# 相关依赖必须手动安装 PS: PHP拓展插件目录： /usr/src/php/ext
RUN apt update && apt-get install -y  zlib1g-dev libzip-dev libfreetype6-dev libjpeg62-turbo-dev libmcrypt-dev libpng-dev libjpeg-dev libpng-dev freetype*

RUN docker-php-source extract && docker-php-ext-install gd && docker-php-ext-install zip && docker-php-ext-install mysqli && docker-php-ext-install pdo_mysql

RUN docker-php-ext-configure gd  --with-freetype=/usr/include/freetype2/freetype/ --with-jpeg=/usr/include/

RUN cd /usr/src/php/ext/gd/ && ./configure --with-freetype=/usr/include/freetype2/freetype  --with-jpeg=/usr/include --with-php-config=/usr/local/bin/php-config && make && make install
