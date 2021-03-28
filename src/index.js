const express = require('express');
const cors = require('cors');
const app = express();
const FileClass = require("./assets/test");
const cron = require('node-cron');
var clas = new FileClass();
//settings 
app.set("port", 8999);
//Middlewares 
app.use(express.json());
app.use(cors());
//Routes 
app.use(require('./routes/route'));
//Starting server
async function goo(file, desc) {
    await clas.proceso(file, desc);
  }
app.listen(app.get('port'), () => {
    console.log("server on port "+app.get('port'));

    cron.schedule('0 10 * * *', () => {
        goo("./src/assets/file.zip","./src/assets/");
      });
});


