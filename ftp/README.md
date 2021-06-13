### FTP 文件服务器

该`Docker Compose`文件共描述了两个中间件,`fauria/vsftpd`和`nginx`，`vsftpd`作为文件服务器，提供文件上传的功能。
`nginx`作为代理服务器提供`http`的方式访问和下载我们上传到`vsftpd`中的文件。

#### Ftp部分

1.创建`admin`用户作为ftp文件服务器用户

```
adduser admin
```

2.并密码初始为`edc3000.`

```
passwd admin
```

3.将`docker-compose.yml`中的`{Your Host}`替换成自己当前服务器的本机IP

4.在当前目录下创建`./conf/vsftpd`目录
```
mkdir -p ./conf/vsftpd
```

5.在`./conf/vsftpd`目录下创建`ftpusers`文件

```
# Users that are not allowed to login via ftp
root
bin
daemon
adm
lp
sync
shutdown
halt
mail
news
uucp
operator
games
nobody
```


6.在`./conf/vsftpd`目录下创建`user_list`文件

```
# vsftpd userlist
# If userlist_deny=NO, only allow users in this file
# If userlist_deny=YES (default), never allow users in this file, and
# do not even prompt for a password.
# Note that the default vsftpd pam config also checks /etc/vsftpd/ftpusers
# for users that are denied.
root
bin
daemon
adm
lp
sync
shutdown
halt
mail
news
uucp
operator
games
nobody
```

#### Nginx部分

----

7.在当前目录下创建`./conf/nginx`目录

``` 
mkdir -p ./conf/nginx
```

8.在`./conf/nginx`目录下创建`nginx.conf`配置文件

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

9.在`./conf/nginx`目录下创建`conf.d`目录

```
mkdir conf.d
```

10.在`conf.d`目录下创建`default.conf`配置文件

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

11.执行`docker-compose`文件
   
```
docker-compose up -d
```