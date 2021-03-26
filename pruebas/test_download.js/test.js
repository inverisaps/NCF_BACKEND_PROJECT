var https = require("https");
var fs = require("fs");
var unzipper = require("unzipper"); 


// borrar archivo aqui
// fs.unlink("assets/file.zip", (err) => {
//     if (err) {
//       console.log(err)
//       return
//     }
//    console.log("se borro");
//    })

// function download(url, dest) {
//   return new Promise((resolve, reject) => {
//     const file = fs.createWriteStream(dest, { flags: "wx" });

//     const request = https.get(url, (response) => {
//       if (response.statusCode === 200) {
//         response.pipe(file);
//       } else {
//         file.close();
//         fs.unlink(dest, () => {}); // Delete temp file
//         resolve(false);
//       }
//     });

//     request.on("error", (err) => {
//       file.close();
//       fs.unlink(dest, () => {}); // Delete temp file
//       resolve(false);
//     });

//     file.on("finish", () => {
//       resolve(true);
//     });

//     file.on("error", (err) => {
//       file.close();

//       if (err.code === "EEXIST") {
//         reject("File already exists");
//       } else {
//         fs.unlink(dest, () => {}); // Delete temp file
//         resolve(false);
//       }
//     });
//   });
// }

// download(
//   "https://www.dgii.gov.do/app/WebApps/Consultas/RNC/DGII_RNC.zip",
//   "assets/file.zip"
// ).then(function (resultado) {
//   if (resultado) {
   

//   }
// });

  function a(){

fs.createReadStream('assets/file.zip')
.pipe(unzipper.Extract({ path: 'carpeta/' }));
}

a();