const SucursalesModel = require("../models/SucursalesModel");
const SModel = new SucursalesModel();
const API_KEY = require("./API-KEY");
  var api_key = new API_KEY();
  
const getSucuarsales = async (req, res) => {
    let resultado = await SModel.GetSucursales();
    if (resultado) {
      res.json({
        res: "ok",
        data: resultado,
      });
    } else {
      res.json({
        res: "false",
      });
    }
};

const getSucuarsal = async (req, res) => {
  api_key.verificar(req, res, async (reqe, rese) => {
    var id = reqe.params.id;
    console.log(id);
    if (id != null || id != "" || id != 0) {
      let resultado = await SModel.GetSucursal(id);
      if (resultado != false && resultado != null && resultado != "ocupado") {
        rese.json({
          res: "ok",
          data: resultado,
        });
      } else if (resultado === false){
        rese.json({
          res: "error",
        });
      } else if (resultado === "ocupada") {
        rese.json({
          res: "false",
          data: "ocupada",
        });
      } else {
        rese.json({
          res: "error",
        });
      }
    }else {
      rese.json({
        res: "error",
        data: "no data",
      });
    }
  });
};

module.exports = { getSucuarsales, getSucuarsal };
