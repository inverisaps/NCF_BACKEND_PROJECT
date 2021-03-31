const NODE_ENV = process.env.NODE_ENV || 'development';
require("dotenv").config({
  path: `.env.${NODE_ENV}`
});

module.exports = {
    database: {
        connectionLimit: 20,
        host: process.env.HOST,
        user: process.env.USER_DB,
        password: process.env.PASS_DB,
        database: process.env.DB_NAME
    }
};