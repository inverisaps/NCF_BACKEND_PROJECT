const { Console } = require('console');
const fs = require('fs');
const readline = require('readline');
// Load the MySQL pool connection
const pool = require('./db');

async function processLineByLine() {
    const fileStream = fs.createReadStream('DGII_RNC.TXT');
  
    const rl = readline.createInterface({
      input: fileStream,
      crlfDelay: Infinity
    });
    
    let i = 0;

    for await (const line of rl) {
     
      if(line.split('|')[0] !== ""){
        pool.query(`call add_rnc_data(${line.split('|')[0]},'${line.split('|')[1]}')`, (error, result) => {
          if (error) {
            
          }
        });
        
      }else {
 
      }
      
    
    }

  }
  
  processLineByLine();
let inicio = new Date();
pool.query(`select * from rnc_data where RNC = 130780498`, (error, result) => {
  if (error) {
    console.log(error)
  }
  console.log(result);
  let fin = new Date();
  console.log(fin - inicio);
});

