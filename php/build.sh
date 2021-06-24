#!/bin/bash
docker rmi -f php-ext:7.4-fpm
docker build -t php-ext:7.4-fpm .