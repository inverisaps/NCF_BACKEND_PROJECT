const express = require('express');
const cors = require('cors');
const app = express();
//settings 
app.set("port", 8999);
//Middlewares 
app.use(express.json());
app.use(cors());
//Routes 
app.use(require('./routes/route'));
//Starting server
app.listen(app.get('port'), () => {
    console.log("server on port "+app.get('port'));
});
