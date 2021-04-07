const fs = require("fs");
const API_KEY = require("./API-KEY");
var api_key = new API_KEY();
function findLine(rnc, fn) {
  let MAX_SENTENCE_LENGTH = 207;
  var response = "";
  fs.readFile("./src/assets/TMP/DGII_RNC.TXT", "utf-8", function (err, data) {
    let startPoint = data.search(rnc);
    if (startPoint === -1) {
      fn(false);
    } else {
      let extract = data.substring(
        startPoint,
        startPoint + MAX_SENTENCE_LENGTH
      );
      let arrayOfSolution = extract.split("\n");
      response = arrayOfSolution[0];
      fn(response);
    }
  });
}

const BuscarRNC = async (req, res) => {
  api_key.verificar(req, res, async (reqe, rese) => {
    const rnc = reqe.params.rnc;
    if (rnc !== null && rnc !== undefined && rnc !== "") {
      await findLine(rnc.toString(), function (resp) {
        let datita = "";
        if (resp === false) {
          datita = "none";
          rese.json({
            res: "ok",
            data: datita.trim(),
          });
        } else {
          resp
            .split("|")[1]
            .split(" ")
            .forEach((element) => {
              if (element !== "") {
                datita += element + " ";
              }
            });
          rese.json({
            res: "ok",
            data: datita.trim(),
          });
        }
      });
    } else {
      rese.json({
        res: "no data",
      });
    }
  });
};

module.exports = { BuscarRNC };
