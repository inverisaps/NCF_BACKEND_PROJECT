const NODE_ENV = process.env.NODE_ENV || "development";
require("dotenv").config({
  path: `.env.${NODE_ENV}`,
});

module.exports = class API_KEY {
  api_key = process.env.API_KEY;
  verificar(req, res, fun) {
    var key_request = req.header("API-KEY");

    if (this.api_key == key_request) {
      fun(req, res);
    } else {
      res.status(401).send("Unauthorized");
    }
  }
};
