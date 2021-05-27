### FTP文件服务器

该`Docker Compose`文件共描述了两个中间件,`fauria/vsftpd`和`nginx`，`vsftpd`作为文件服务器，提供文件上传的功能。
`nginx`作为代理服务器提供`http`的方式访问和下载我们上传到`vsftpd`中的文件。

#### Ftp部分

1. 创建`admin`用户作为ftp文件服务器用户

```shell script
adduser admin
```

2.并密码初始为`edc3000.`

```shell script
passwd admin
```

3. 将`docker-compose.yml`中的`{Your Host}`替换成自己当前服务器的本机IP


4. 在当前目录下创建`./conf/nginx`目录

```shell script
mkdir ./conf | mkdir ./conf/nginx
```

5. 在`./conf/nginx`目录下创建`nginx.conf`配置文件

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

6. 在`./conf/nginx`目录下创建`conf.d`目录

```shell script
mkdir conf.d
```

7. 在`conf.d`目录下创建`default.conf`配置文件

```smartyconfig
server{
        
listen 80;
server_name localhost;
charset utf-8;

location / {
     root /opt/admin;
     add_header Cache-Control no-cache;
     add_header Access-Control-Allow-Origin *;
}

}
```

8. 执行`docker-compose`文件
   
```shell script
docker-compose up -d
```