var https = require("https");
var fs = require("fs");
var unzipper = require("unzipper");
 
module.exports = class FileClass {
  async existFile(file) {
    fs.access(file, fs.constants.F_OK, (err) => {
      if (err) console.error("File no exist");
      else {
        console.log("File existe");
      }
    });
  }
  async deleteFile(file) {
    fs.unlink(file, (err) => {
      if (err) {
        console.log("No se borro");
        return;
      }
      console.log("se borro");
    });
  }

  async proceso(file, desc) {
    if (this.existFile(file)) {
      this.deleteFile(file);
      await this.download(
        "https://www.dgii.gov.do/app/WebApps/Consultas/RNC/DGII_RNC.zip",
        file
      ).then(function (resultado) {
        if (resultado) {
          fs.createReadStream(file).pipe(unzipper.Extract({ path: desc }));
          
        } else {
          console.log("error");
        }
      });

    } else {
      await this.download(
        "https://www.dgii.gov.do/app/WebApps/Consultas/RNC/DGII_RNC.zip",
        file
      ).then(function (resultado) {
        if (resultado) {
          fs.createReadStream(file).pipe(
            unzipper.Extract({ path: "carpeta/" })
          );
        
        } else {
          console.log("error");
        }
      });
    }
    this.deleteFile(file);
  }

  download(url, dest) {
    return new Promise((resolve, reject) => {
      const file = fs.createWriteStream(dest, { flags: "wx" });
      const request = https.get(url, (response) => {
        if (response.statusCode === 200) {
          response.pipe(file);
        } else {
          file.close();
          fs.unlink(dest, () => {}); // Delete temp file
          resolve(false);
        }
      });

      request.on("error", (err) => {
        file.close();
        fs.unlink(dest, () => {
          console.log(err);
        }); // Delete temp file
        resolve(false);
      });

      file.on("finish", () => {
        resolve(true);
      });

      file.on("error", (err) => {
        file.close();

        if (err.code === "EEXIST") {
          reject("File already exists");
        } else {
          fs.unlink(dest, () => {}); // Delete temp file
          resolve(false);
        }
      });
    });
  }
}


