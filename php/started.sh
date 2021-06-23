#!/bin/bash

#必要文件夹赋予权限
chmod 777 ./res/manage/runtime/
chmod 777 ./res/manage/public/uploads/

docker-compose up -d && cd ./nginx && docker-compose up -d