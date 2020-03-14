// 个人中心v1-api
const Router = require('koa-router');

const router = new Router();

router.get(`/api/v1/user`, (ctx, next) => {
  ctx.body = {
    code: 0
  };
});
module.exports =router