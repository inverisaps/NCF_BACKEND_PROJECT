const fs = require("fs");
let MAX_SENTENCE_LENGTH = 207;
let inicio = new Date();
class RNC {
  findLine(rnc, fn) {
    var response = "";
    fs.readFile("DGII_RNC copy.TXT", "utf-8", function (err, data) {
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
}

module.exports = RNC;
