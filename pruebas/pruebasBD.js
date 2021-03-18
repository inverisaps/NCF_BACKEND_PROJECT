const { Console} = require('console');
const fs = require('fs');
const readline = require('readline');

const hash = new HashTable();

async function processLineByLine() {
    const fileStream = fs.createReadStream('./DGII_RNC.TXT');
  
    const rl = readline.createInterface({
      input: fileStream,
      crlfDelay: 6
    });
    
    let i = 0;
  

    for await (const line of rl) {
     
      if(line.split('|')[0] !== " "){
        hash.insert()
      }else {
        console.log(line);
      }
    
    }

  }
  
  processLineByLine();

  console.timeEnd("end");
