// app.js
// 引入koa
const Koa = require("koa");
// 创建⼀个Koa对象表示web app本身:
const app = new Koa();
// 对于任何请求，app将调⽤该异步函数处理请求：
app.use(async (ctx, next) => {
  // 随机产⽣错误
  Math.random() > 0.9 ? yayxs() : "2";
  await next();
  ctx.response.type = "text/html";
  ctx.response.body = "<h1>success</h1>";
});
if (!module.parent) {
  app.listen(3000);
  console.log("app started at port 3000...");
} else {
  module.exports = app;
}
// test.js
var http = require("http");
setInterval(async () => {
  try {
    await http.get("http://localhost:3000");
  } catch (error) {}
}, 1000);
// cluster.js
var cluster = require("cluster");
var os = require("os"); // 获取CPU 的数量
var numCPUs = os.cpus().length;
var process = require("process");
console.log("numCPUs:", numCPUs);
var workers = {};
if (cluster.isMaster) {
  // 主进程分⽀
  cluster.on("death", function(worker) {
    // 当⼀个⼯作进程结束时，重启⼯作进程 delete workers[worker.pid];
    worker = cluster.fork();
    workers[worker.pid] = worker;
  });
  // 初始开启与CPU 数量相同的⼯作进程
  for (var i = 0; i < numCPUs; i++) {
    var worker = cluster.fork();
    workers[worker.pid] = worker;
  }
} else {
  // ⼯作进程分⽀，启动服务器
  var app = require("./app");
  app.use(async (ctx, next) => {
    console.log("worker" + cluster.worker.id + ",PID:" + process.pid);
    next();
  });
  app.listen(3000);
}
// 当主进程被终⽌时，关闭所有⼯作进程
process.on("SIGTERM", function() {
  for (var pid in workers) {
    process.kill(pid);
  }
  process.exit(0);
});
