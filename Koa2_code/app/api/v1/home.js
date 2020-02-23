// 个人中心v1-api
const Router = require("koa-router");

const router = new Router();

router.get(`/v1/home/list`, (ctx, next) => {
  console.log(`/v1/home/list执行`);
  ctx.body = {
    code: 0
  };
});
module.exports =router