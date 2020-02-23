// 初始化加载路由
const requireDirectory = require("require-directory");
const Router = require("koa-router");
class Init {
  // 入口方法
  static entrance(app) {
    Init.app = app;
    Init.initRoute();
  }
  // 路由导入初始化
  static initRoute() {
 
    requireDirectory(module, "../app/api", { visit: visitor });

    function visitor(obj){
      if (obj instanceof Router) {
        Init.app.use(obj.routes());
      }
    }
  }
}
module.exports = Init;
