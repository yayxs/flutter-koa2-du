// 个人中心v1-api
const Router = require('koa-router');

const router = new Router();

router.get(`/api/v1/user`, (ctx, next) => {
  ctx.body = {
    code: 0,
    data:{
      nickName:'yayxs',
      fav:[
        {id:1,type:"writing"}
      ]
    },
    msg:'获取用户信息成功'
  };
});
module.exports =router