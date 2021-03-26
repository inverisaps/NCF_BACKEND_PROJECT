const fs = require("fs");
const utf8 = require('utf8');
  function findLine(rnc,fn) {
    let MAX_SENTENCE_LENGTH = 207;
    var response = "";
    fs.readFile("./src/assets/DGII_RNC.txt", "utf-8", function (err, data) {
      let startPoint = data.search(rnc);
      let extract = data.substring(
        startPoint,
        startPoint + MAX_SENTENCE_LENGTH
      );
      let arrayOfSolution = extract.split("\n");
      response = arrayOfSolution[0];
      
      fn(response);
    });
  }
  
const BuscarRNC = async (req, res) => {
    const rnc = req.params.rnc;
    if (rnc !== null && rnc !== undefined && rnc !== "") {
     await findLine(rnc.toString(), function(resp){
         let datita = ""; 
          resp.split('|')[1].split(' ').forEach(element => {
            if(element !== ""){
                datita += element + " ";
            }          
          });
          
          res.json({
              res:"ok",
              data:datita.trim()
          })
      });
    } else {
      res.json({
        res: "no data",
      });
    }
  };

  module.exports = {BuscarRNC};