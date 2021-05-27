### splash 动态渲染

> 官方文档介绍： https://splash.readthedocs.io/en/stable/

`Splash`是一种`javascript`渲染服务。这是一个带有`HTTP API`的轻量级Web浏览器，使用Twisted和QT5在`Python 3`中实现。（扭曲的）QT反应器用于使服务完全异步，从而允许通过QT主循环利用`Webkit`并发性。

#### `Splash`目前支持功能

1. 并行处理多个网页；
2. 获取HTML结果和/或截取屏幕截图；
3. 关闭图片或使用Adblock Plus规则来加快渲染速度；
4. 在页面上下文中执行自定义JavaScript；
5. 编写Lua浏览脚本;
6. 在Splash-Jupyter Notebook中开发Splash Lua脚本。
7. 以HAR格式获取详细的渲染信息。

#### 启动方式

1. 执行`docker-compose`文件

```
docker-compose up -d
```