const dotenv = require("dotenv");
const result = dotenv.config();
if (result.error) {
  throw result.error;
}
module.exports = {
  APP_LISTEN_PORT,
  MYSQL_HOST,
  MYSQL_PORT,
  MYSQL_DATABASE,
  MYSQL_USER,
  MYSQL_PASSWORD,
} = process.env;
