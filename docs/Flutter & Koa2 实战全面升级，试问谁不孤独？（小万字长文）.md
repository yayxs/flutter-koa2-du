>源代码仓库地址：[https://github.com/yayxs/flutter-koa2-du](https://github.com/yayxs/flutter-koa2-du)
>
>首次发布时间：**2020年03月17日**
>
>最近更新时间：**2020年12月05日**

## 后端服务选型

**后端的服务选型** ，最初有几种方案

- node 原生开撸
- Express Node 的一个框架（早期的）
- Koa2 指的是`2`
- eggjs 这个企业级框架，拥有约定俗成的规范
- Nestjs 这个同步接口文档十分方便，但是是`typescript` 的语法

所以这个就先用大名鼎鼎的`Koa2` 先来说说我对 koa2 的理解，我们能够更好的自定义化开发，其中包括`错误捕获` 等等

- 洋葱模型
- 中间件
- 异步编程 
- 可定制化，根据习惯随意开发，拓展性强

### 项目目录

```
|-- package.json
|-- src
|   |-- app
|   |   |-- db.js
|   |   `-- index.js
|   |-- controller
|   |   `-- user.controller.js
|   |-- main.js
|   |-- middleware
|   |-- router
|   |   `-- user.router.js
|   |-- service
|   |   `-- user.service.js
|   |-- settings.js
|   `-- utils
|       `-- index.js
`-- yarn.lock
```

### 开发依赖

在前端的项目中，`package.json` 一般这个就是管理包文件的，那在我们的`flutter` 项目中使用`pubspec.yaml` 文件是一样的，差不多

```sh
"dependencies": {
    "dotenv": "^8.2.0",
    "koa": "^2.13.0",
    "koa-router": "^10.0.0",
    "mysql2": "^2.2.5",
    "require-directory": "^2.1.1"
  },
  "devDependencies": {
    "nodemon": "^2.0.6"
  }
```

当然了这只是项目的初始化，后续更新会在此基础上，所以还是强烈建议看一下的。也可以收藏，没事的时候翻出来看看.。

### 入口文件

```js
// main.js
const app = require("./app");
const config = require("./settings");

app.listen(config.APP_LISTEN_PORT, () => {
  console.log(`服务器启动于 http://localhost:${config.APP_LISTEN_PORT}`);
});

```

在这里我们新建了一个 主要就是初始化应用，然后监听服务端口

### 启动后台服务

```sh
 "devDependencies": {
    "nodemon": "^2.0.6" 
  }
```

```json
 "scripts": {
    "start": "nodemon ./src/main"
  },
```

顺便先说一下，这个项目咱们用`MySql` ,这就需要熟悉一些简单的`sql` 命令

## 阿里云基本环境准备

### 购买服务器

`koa`的项目是基于`node` 能力，所以我们的云服务需要包含 `node` 这里我们下载安装一下`node` 。

一提到`服务器相关的知识`不要慌，我们一步步来实现`公网IP` 部署`node 服务`

#### 目标

> 目标一：掌握 pm2 部署 node JS 服务 进行守护，进程
>
> 目标二：掌握基本的 nginx 反向代理
>
> 目标三：暂时拜别本地服务

#### 效果

当我们在任何一台有网的电脑上地址栏输入 接口地址,便会成功的返回我们所写接口返回的数据，类似于下图的效果：
![20200315132602.png](https://raw.githubusercontent.com/yayxs/Pics/master/img/20200315132602.png)

#### 云服务器准备

为什么说第一步要准备云服务器，因为哪怕你用`原生html` 或者说什什么的`ssr渲染框架` 或者说`jQ`

等等吧，写了一个页面，需要都能访问到。供我们选择的有`阿里云` `腾讯云` `华为云`  **3月份的时候我还是使用的腾讯云** `12月份已经换成了阿里云` ,但效果是一样的

![ ](https://s1.ax1x.com/2020/03/15/81OIpD.gif)

可能国外的访问会受阻，所以还是国内的`BATH` 等等这几家的，都差不多真的不骗你

问：什么是云服务器?什么是域名解析？什么是部署？怎么反向代理？

答：云服务器可以想象为远程的电脑，至于反向代理稍后再说

是包年的 ~~http://62.234.111.140/~~   已经转换为阿里云了 `101.201.148.180`

#### 连接远程服务器

![20200315123339.png](https://raw.githubusercontent.com/yayxs/Pics/master/img/20200315123339.png)

输入用户名密码连接就行了
![20200315123519.png](https://raw.githubusercontent.com/yayxs/Pics/master/img/20200315123519.png)
这样就可以了，我发现真的是**废话好多啊** 具体的细节，如果大家有什么疑问，可以再评论区留言，能力所及，会回复的。首先上来的时候要安装几个东西

```sh
npm i -g node  // 全局安装最新版的node环境
npm i -g pm2 // 全局安装线程管理
 // 等等等等
```

![20200315124004.png](https://raw.githubusercontent.com/yayxs/Pics/master/img/20200315124004.png)

一切的环境准备好之后，就需要同步一下咱们的服务端代码到`云服务器` 这一点同样十分的重要，不然就没得进行了。

#### 依赖三方服务器

总得有个同步的服务器，我们选择`github` 服务器，这样在云服务也好，还是咱们的本地电脑，代码最起码丢不了

我是放在了`home` 文件夹下
![20200315124901.png](https://raw.githubusercontent.com/yayxs/Pics/master/img/20200315124901.png)

那就装依赖呗，老套路

```
cd /home/flutter-koa2-du/koa2-server
npm i
```

趁着也安装一下`nodemon` 吧 答应我安装下好吗[npm-nodemon](https://www.npmjs.com/package/nodemon)

虽然说我们也是在本地开发然后同步到云服务器，云服务器的代码一般不会怎么变动，
![20200315125346.png](https://raw.githubusercontent.com/yayxs/Pics/master/img/20200315125346.png)

**启动项目**
![20200315125503.png](https://raw.githubusercontent.com/yayxs/Pics/master/img/20200315125503.png)

不要慌，解决问题

- 问题原因：主要是在同一环境 3000 这个端口已经被占用
- 解决问题：那就关闭 3000 进程

这个时候我们就要引入`PM2` 纯纯的大写的高调的`pm2`

#### Pm2 应用

首先来看下`pm2` 干些什么

- 内建负载均衡（使⽤ Node cluster 集群模块、⼦进程，可以参考朴灵的《深⼊浅出 node.js》⼀书 第九章）
- 线程守护，keep alive
- 0 秒停机重载，维护升级的时候不需要停机.
- 现在 Linux (stable) & MacOSx (stable) & Windows (stable).
- 多平台⽀持
- 停⽌不稳定的进程（避免⽆限循环）
- 控制台检测 https://id.keymetrics.io/api/oauth/login#/register
- 提供 HTTP API

可能现在这样说，也没设好理解的，是有一个这样的场景，云服务器的环境可不像我们本地的电脑，即开发环境（dev），一旦上线，会有各种复杂的问题出现，导致程序崩掉。不能够为我们提供`服务`

##### 配置

```sh
npm install -g pm2
pm2 start app.js --watch -i 2
// watch 监听⽂件变化
// -i 启动多少个实例
pm2 stop all
pm2 list
pm2 start app.js -i max # 根据机器CPU核数，开启对应数⽬的进程
```

这只是简单的配置，详细的玩法可以自行右转`google` 也可以下翻参阅文章关于`pm2` 的分享，当然了还是要滑上来的

##### pm2 list

![20200315130743.png](https://raw.githubusercontent.com/yayxs/Pics/master/img/20200315130743.png)

我们可以通过`pm2 list` 查看进程启动情况，显然我们的项目已经在云服务器的`3000`端口启动了,那么这个时候我们把进程`stop all` 停掉

##### pm2 stop all

![20200315131034.png](https://raw.githubusercontent.com/yayxs/Pics/master/img/20200315131034.png)

我们通过命令先听到 3000 端口

#### pm2 优雅启动 node 进程服务

```sh
pm2 start app.js -i max -n node-koa-pm2
```

详细的含义自行`google` , ok 到这里应该就没什么问题了

#### curl 自行访问测试

```sh
curl http://127.0.0.1:3000/api/v1/user
```

![20200315132303.png](https://raw.githubusercontent.com/yayxs/Pics/master/img/20200315132303.png)

#### Nginx 反向代理

是这样的，我们考虑一下，接口访问的时候怎么才优雅，也不知道端口是 3000 啊，所以需要`一个代理服务器`

- 正向代理 ：像我们的科学上网就是正向代理便是(某管)
  ![20200315133216.png](https://raw.githubusercontent.com/yayxs/Pics/master/img/20200315133216.png)
- 反向代理：像这种就是反向代理，具体右转`google`

##### 安装

直接在云服务器通过`yum` 就可以了我觉得

```sh
yum install nginx
-----
apt update
apt install nginx
```

然后怎么办呢，触及到我的知识盲区了,还是不要慌，遇到问题解决问题。**敢于试错吧**

![20200315133555.png](https://raw.githubusercontent.com/yayxs/Pics/master/img/20200315133555.png)

##### nginx -v

查看当前云服务安装的`nginx` 版本

##### nginx -t

查看配置,这很重要，因为它会定位到`nginx的主要配置所在的位置` ，不同的安装方式所在的位置是不同的以下是笔者的

```sh
nginx: the configuration file /www/server/nginx/conf/nginx.conf syntax is ok
nginx: configuration file /www/server/nginx/conf/nginx.conf test is successful

```

##### cat nginx.conf

查看`nginx` 主要的配置文件，

```sh\

…………………………
server
    {
        listen 888;
        server_name phpmyadmin;
        index index.html index.htm index.php;
        root  /www/server/phpmyadmin;

        #error_page   404   /404.html;
        include enable-php.conf;

        location ~ .*\.(gif|jpg|jpeg|png|bmp|swf)$
        {
            expires      30d;
        }

        location ~ .*\.(js|css)?$
        {
            expires      12h;
        }

        location ~ /\.
        {
            deny all;
        }

        access_log  /www/wwwlogs/access.log;
    }
include /www/server/panel/vhost/nginx/*.conf;
}

```

主要的要看重这句话**include /www/server/panel/vhost/nginx/\*.conf;**

意思是说会引入后缀名`.conf` 的文件作为配置的一部分，所以当我们新增配置的时候，文件名要是`.conf` 这样 nginx 会导入并作为配置
![20200315185013.png](https://raw.githubusercontent.com/yayxs/Pics/master/img/20200315185013.png)

这时候我们只需要新建一个`**.conf` 的文件就可,添加如下的配置

```sh
server {

        listen 80;
        server_name  localhost;
        location /api {
            proxy_pass http://127.0.0.1:3000;
		}
}

```

我们新增的`nginx` 配置并没有包括

- 静态路由的配置
- 等等

##### 重启 nginx

```sh
nginx -s reload
```

没什么错误的话，应该就可以了， 这个时候验证一下自己的成果

```json
{
  "code": 0,
  "data": {
    "nickName": "yayxs",
    "fav": [
      {
        "id": 1,
        "type": "writing"
      }
    ]
  },
  "msg": "获取用户信息成功"
}
```

一个简单的`get` 请求旧简单的部署到`服务器上` 了



## 小结

当没有了产品和原型，从0开始设计实现一个app是一件比较有意思的事情。这个产品先从`面向自己`开始。

这篇文章主要是介绍了如何初始化一个后端的云服务，以及建立连接，其中需要注意的是

- 构思一个简单的跨端 app ，从接口服务来写页面
- 如何从 0 开始搭建一个简单的 node 后台服务
- 了解`nginx` 的一些简单的配置结合`pm2` 部署

- 感觉 `interesting`的话，点赞评论加`标星`吧

