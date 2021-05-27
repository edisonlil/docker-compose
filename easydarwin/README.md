### EasyDarwin

> 官方文档介绍： http://www.easydarwin.org/doc/EasyDarwin.html

EasyDarwin开源流媒体服务器是EasyDarwin开源流媒体云平台的流媒体服务部分，是整个流媒体云平台的核心服务，EasyDarwin基于Apple的开源项目Darwin Streaming Server v6.0.3开发和扩展的，EasyDarwin支持标准RTSP/RTP/RTCP协议，具备RTSP直播功能，适应PC、安卓、IOS直播等各终端平台，最大程度贴近安防监控、移动互联网流媒体需求；

EasyDarwin本身提供了一个高性能的服务端框架，Linux/Windows跨平台支持，是开发流媒体服务以及其他类型服务的极佳框架工具，EasyDarwin具备一套完整的网络I/O框架以及Utility，EasyDarwin开源团队也在不断进行更优的性能优化（epoll、线程池、内存池、堆栈调用、寄存器调用等）、应用优化（RESTful接口、WEB管理后台、配套APP等），开发者很容易在EasyDarwin的基础上开发跨平台服务程序，例如Windows、Linux、Mac、Solaris等系统平台，只要一次熟悉，将会受用终身，并且部署和开发过程简单，文档和支持完备，是互联网+时代，对企业和开发者来说，最接地气的开源流媒体服务器；

### EasyDarwin 功能

##### 支持

1. 标准RTSP/RTP推送直播
2. 接入EasyDarwin流媒体云平台，分布式、多点部署；

##### 开发中...。

1. EasyDarwin Web管理后台
2. EasyDarwin商用流媒体点播与直播服务器；

----

### 视频流转RTSP流协议

1. 启动**easydarwin**流服务器

```shell
docker-compose up -d
```

2. 通过服务器**ffmpeg**转流

```shell
ffmpeg -re -i 视频流地址  -rtsp_transport tcp -vcodec h264 -f rtsp rtsp://localhost:554/{path}
```