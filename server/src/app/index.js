const Koa = require("koa");

const app = new Koa();
require("./db");
module.exports = app;
