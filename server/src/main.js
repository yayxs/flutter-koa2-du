const app = require("./app");
const config = require("./settings");

app.listen(config.APP_LISTEN_PORT, () => {
  console.log(`服务器启动于 http://localhost:${config.APP_LISTEN_PORT}`);
});
