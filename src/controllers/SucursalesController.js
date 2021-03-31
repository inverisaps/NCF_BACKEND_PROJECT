const SucursalesModel = require("../models/SucursalesModel");
const SModel = new SucursalesModel();

const getSucuarsales = async (req, res) => {
  api_key.verificar(req, res, async (reqe, rese) => {
    let resultado = await SModel.GetSucursales();
    if (resultado) {
      rese.json({
        res: "ok",
        data: resultado,
      });
    } else {
      rese.json({
        res: "false",
      });
    }
  });
};

const getSucuarsal = async (req, res) => {
  api_key.verificar(req, res, async (reqe, rese) => {
    var id = reqe.params.id;
    if (id != null || id != "" || id != 0) {
      let resultado = await SModel.GetSucursal(id);
      console.log(resultado);
      if (resultado != false && resultado != null && resultado != "ocupado") {
        rese.json({
          res: "ok",
          data: resultado,
        });
      } else if (resultado === false) {
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
    } else {
      rese.json({
        res: "error",
        data: "no data",
      });
    }
  });
};

module.exports = { getSucuarsales, getSucuarsal };
