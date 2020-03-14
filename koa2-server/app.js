const Koa = require("koa");
const app = new Koa();
const Init = require('./core/init')
Init.entrance(app)
app.listen(3000);
