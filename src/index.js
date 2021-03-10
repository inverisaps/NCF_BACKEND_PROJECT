const fs = require('fs');
let MAX_SENTENCE_LENGTH = 207;

function findLine(rnc) {
    var response = "";

    fs.readFile('DGII_RNC.TXT', 'utf-8', function(err, data){    
        let startPoint = data.search(rnc);
        let extract = data.substring(startPoint, startPoint+MAX_SENTENCE_LENGTH);
        let arrayOfSolution = extract.split("\n");
        
        response = arrayOfSolution[0]; 
        console.log(response.split('|')[1]);
    }); 

    return response;
}

findLine("101020164");

