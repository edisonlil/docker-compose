### mysql

1.将`docker-compose.yml`中的`{PWD}`替换成自己当前数据库的`root`密码

2.在根目录下创建 `/data/mysql/data` 目录

```shell script
mkdir -p /data/mysql/data
```

3.在根目录下创建 `/etc/mysql` 目录

```shell script
mkdir -p /etc/mysql
```

4.在`/etc/mysql` 目录下创建`my.cnf` 配置文件

  ```smartyconfig
# Copyright (c) 2016, Oracle and/or its affiliates. All rights reserved.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; version 2 of the License.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301 USA

!includedir /etc/mysql/conf.d/
!includedir /etc/mysql/mysql.conf.d/


  ```

5.在`/etc/mysql` 目录下创建`my.cnf.fallback` 配置文件

  ```smartyconfig
 #
 # The MySQL database server configuration file.
 #
 # You can copy this to one of:
 # - "/etc/mysql/my.cnf" to set global options,
 # - "~/.my.cnf" to set user-specific options.
 # 
 # One can use all long options that the program supports.
 # Run program with --help to get a list of available options and with
 # --print-defaults to see which it would actually understand and use.
 #
 # For explanations see
 # http://dev.mysql.com/doc/mysql/en/server-system-variables.html
 
 # This will be passed to all mysql clients
 # It has been reported that passwords should be enclosed with ticks/quotes
 # escpecially if they contain "#" chars...
 # Remember to edit /etc/mysql/debian.cnf when changing the socket location.
 
 # Here is entries for some specific programs
 # The following values assume you have at least 32M ram
 
 !includedir /etc/mysql/conf.d/

  ```

6.在`/etc/mysql` 目录下创建`mysql.cnf` 配置文件

  ```smartyconfig
 #
 # The MySQL database server configuration file.
 #
 # You can copy this to one of:
 # - "/etc/mysql/my.cnf" to set global options,
 # - "~/.my.cnf" to set user-specific options.
 # 
 # One can use all long options that the program supports.
 # Run program with --help to get a list of available options and with
 # --print-defaults to see which it would actually understand and use.
 #
 # For explanations see
 # http://dev.mysql.com/doc/mysql/en/server-system-variables.html
 
 # This will be passed to all mysql clients
 # It has been reported that passwords should be enclosed with ticks/quotes
 # escpecially if they contain "#" chars...
 # Remember to edit /etc/mysql/debian.cnf when changing the socket location.
 
 # Here is entries for some specific programs
 # The following values assume you have at least 32M ram
 
 !includedir /etc/mysql/conf.d/

  ```

7.在`/etc/mysql` 目录下创建 `conf.d` 目录

```shell script
mkdir conf.d
```

8.在`/etc/mysql` 目录下创建 `mysql.conf.d` 目录

```shell script
mkdir mysql.conf.d
```

9.在`/mysql.conf.d` 目录下创建`mysqld.cnf` 配置文件

  ```smartyconfig
opyright (c) 2014, 2016, Oracle and/or its affiliates. All rights reserved.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; version 2 of the License.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301 USA

#
# The MySQL  Server configuration file.
#
# For explanations see
# http://dev.mysql.com/doc/mysql/en/server-system-variables.html

[mysqld]
log-bin=mysql-bin
binlog-format=ROW
server-id=1
pid-file	= /var/run/mysqld/mysqld.pid
socket		= /var/run/mysqld/mysqld.sock
datadir		= /var/lib/mysql
#log-error	= /var/log/mysql/error.log
# By default we only accept connections from localhost
#bind-address	= 127.0.0.1
# Disabling symbolic-links is recommended to prevent assorted security risks
symbolic-links=0

  ```

10.执行`docker-compose`文件

```shell script
docker-compose up -d
```