const fs = require("fs");
const axios = require("axios");
const API_KEY = require("./API-KEY");
var api_key = new API_KEY();
function findLine(rnc, fn) {
  const data = `
  <soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
  <GetContribuyentes xmlns="http://dgii.gov.do/">
  <value>${rnc}</value>
  <patronBusqueda>0</patronBusqueda>
  <inicioFilas>0</inicioFilas>
  <filaFilas>0</filaFilas>
  <IMEI>?</IMEI>
  </GetContribuyentes>
  </soap:Body>
  </soap:Envelope>
  `;
  var config = {
    headers: {
      "Content-Type": "text/xml; charset=utf-8",
      "Content-Length": data.length,
    },
  };
  axios
    .post("http://dgii.gov.do/wsMovilDGII/WSMovilDGII.asmx", data, config)
    .then((res) => {
      const resp = JSON.parse(
        res.data
          .toString()
          .split("<GetContribuyentesResult>")[1]
          .split("</GetContribuyentesResult>")[0]
      );
      if (resp !== 0) {
        fn(resp.RGE_NOMBRE);
      } else {
        fn(false);
      }
    })
    .catch((err) => console.log(err));
}

const BuscarRNC = async (req, res) => {
  api_key.verificar(req, res, async (reqe, rese) => {
    const rnc = reqe.params.rnc;
    if (rnc !== null && rnc !== undefined && rnc !== "") {
      findLine(rnc.toString(), function (resp) {
        if (resp) {
          rese.json({
            res: "ok",
            data: resp,
          });
        } else {
          rese.json({
            res: "ok",
            data: "none",
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
