FROM openjdk:11

MAINTAINER author:edison
MAINTAINER mali:edisonlil@163.com
MAINTAINER description:This is a simple web socket demo.

#将jar复制到OPT目录.
COPY ./websocket.jar /opt

#指定执行 dockerfile 指令的目录.
WORKDIR /opt

EXPOSE 8080

#执行命令.
CMD java -jar websocket.jar

LABEL version="1.0" description="This is a simple web socket demo." by="young edison"
