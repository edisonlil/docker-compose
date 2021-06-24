#!/bin/bash

#必要文件夹赋予权限
chmod -R 777 ./res/manage/runtime/
chmod -R 777 ./res/manage/public/uploads/

docker-compose up -d && cd ./nginx && docker-compose up -d