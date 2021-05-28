### PHP Web程序部署

1. 在当前目录下创建`res`用于存放资源文件

```shell script
mkdir ./res
```

2. 在`./res`下创建`index.php`用于测试

```php
<?php
echo '欢迎来到对抗路';
?>
```


3. 在当前目录中的`./nginx`目录下创建`nginx.conf`配置文件

```smartyconfig
user  nginx;
worker_processes  1;

error_log  /var/log/nginx/error.log warn;
pid        /var/run/nginx.pid;

events {
    worker_connections  1024;
}

http {
    include       /etc/nginx/mime.types;
    default_type  application/octet-stream;

    log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                      '$status $body_bytes_sent "$http_referer" '
                      '"$http_user_agent" "$http_x_forwarded_for"';

    access_log  /var/log/nginx/access.log  main;

    sendfile        on;
    #tcp_nopush     on;

    keepalive_timeout  65;

    #gzip  on;

    include /etc/nginx/conf.d/*.conf;
}
```

4. 在当前目录中的`./nginx`目录下创建`conf.d`目录
```shell script
mkdir ./nginx/conf.d
```



5. 在`conf.d`目录下创建`default.conf`配置文件

```smartyconfig
server {
    listen        80;
    server_name  0.0.0.0;
    location ~ \.php(.*)$ {
        root   /res;
        fastcgi_pass   127.0.0.1:9000;
        fastcgi_index  index.php;
        fastcgi_split_path_info  ^((?U).+\.php)(/?.+)$;
        fastcgi_param  SCRIPT_FILENAME  $document_root$fastcgi_script_name;
        fastcgi_param  PATH_INFO  $fastcgi_path_info;
        fastcgi_param  PATH_TRANSLATED  $document_root$fastcgi_path_info;
        include        fastcgi_params;
    }
}
```

6. 赋予`started.sh`脚本可执行权限 (只需执行一次，后续可直接跳过该步骤)

```shell script
chmod 777 ./started.sh
```

7. 启动`php`容器以及`nginx`容器
```shell script
./started.sh
```

----

赋予`stop.sh`脚本可执行权限 (只需执行一次，后续可直接跳过该步骤)

```shell script
chmod 777 ./stop.sh
```

关闭`php`容器以及`nginx`容器
```shell script
./stop.sh
```