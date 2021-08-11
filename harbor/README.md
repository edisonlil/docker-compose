### harbor-log

1. 在根目录下创建`/usr/local/docker/harbor/log`目录

```
mkdir -p /usr/local/docker/harbor/log
```

2.在当前目录下创建 `./common/config/log` 目录

```
mkdir -p ./common/config/log
```

3.将 `config`目录下的 `logrotate.conf  rsyslog_docker.conf` 文件移至 `./common/config/log` 目录下


### registry

1. 在根目录下创建`/usr/local/docker/harbor/data/registry`目录

```
mkdir -p /usr/local/docker/harbor/data/registry
```

2.在当前目录下创建 `./common/config/registry` 目录

```
mkdir -p ./common/config/registry
```

3.在根目录下创建 `/usr/local/docker/harbor/data/secret/registry`目录

```
mkdir -p /usr/local/docker/harbor/data/secret/registry
```

4.将 `config`目录下的 `root.crt` 文件移至 `/usr/local/docker/harbor/data/secret/registry` 目录下



### registryctl

1.将 `config`目录下的 `config.yml` 文件移至 `./common/config/registryctl/` 目录下



### harbor-db

1. 在根目录下创建`/usr/local/docker/harbor/data/database`目录

2.在当前目录下创建 `./common/config/db` 

3.将 `config`目录下的 `env` 文件移至 `./common/config/db` 目录下



### harbor-core

1..在当前目录下创建 `./common/config/core` 

```
mkdir -p ./common/config/core
```

2.将 `core`目录下的 `env` 文件移至 `./common/config/core` 目录下


3.在根目录下创建 `/usr/local/docker/harbor/data/ca_download`目录
```
mkdir -p /usr/local/docker/harbor/data/ca_download
```

4.在根目录下创建 `/usr/local/docker/harbor/data/psc`目录
```
mkdir -p /usr/local/docker/harbor/data/psc
```

5.在根目录下创建 `/usr/local/docker/harbor/data/secret/core`目录
```
mkdir -p /usr/local/docker/harbor/data/secret/core
```

6.将 `core`目录下的 `private_key.pem` 文件移至 `/usr/local/docker/harbor/data/secret/core` 目录下
 
7.在根目录下创建 `/usr/local/docker/harbor/data/secret/keys`目录
 ```
 mkdir -p /usr/local/docker/harbor/data/secret/keys
 ```
8.将 `core`目录下的 `secretkey` 文件移至 `/usr/local/docker/harbor/data/secret/keys` 目录下
  
  
  
  ### harbor-jobservice
  
1.在根目录下创建 `/usr/local/docker/harbor/data/job_logs`目录
  ```
  mkdir -p /usr/local/docker/harbor/data/job_logs
  ```

2.在当前目录下创建 `./common/config/jobservice`目录
  ```
  mkdir -p ./common/config/jobservice
  ```

3.将 `jobservice`目录下的 `env` 文件移至 `./common/config/jobservice` 目录下
 
4.将 `jobservice`目录下的 `config.yml` 文件移至 `./common/config/jobservice` 目录下
 
 ### redis
 
1.在根目录下创建 `/usr/local/docker/harbor/data/redis`目录

```
mkdir -p /usr/local/docker/harbor/data/redis
```

 ### nginx
 
1.在当前目录下创建 `./common/config/nginx`目录

```
mkdir -p ./common/config/nginx
```

2.将 `nginx`目录下的 `nginx.conf` 文件移至 `./common/config/nginx` 目录下



3.执行`docker-compose`文件

```
docker-compose up -d
```  