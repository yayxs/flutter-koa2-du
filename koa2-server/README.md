本文章暂时不包含域名解析，因为我还没备案（是懒）

## 1. 初始化 node 项目

这里采用`koa2` 框架

## 2 . 连接云服务器

![20200314160129.png](https://raw.githubusercontent.com/yayxs/Pics/master/img/20200314160129.png)

- 服务器细节
- Node 环境
- PM2

## 3. 代码同步到云服务器

- FTP
- git
- rz

## 4. 服务本地访问


返回后台的接口响应

## 5. PM2 管理进程爱心守护

- 守护进程
- 负载均衡

pm2 启动进程

```
pm2 start app.js -i max -n koa2-server
```

## 6. nginx

### 配置



