const SucursalesModel = require("../models/SucursalesModel");
const SModel = new SucursalesModel();

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

module.exports = { getSucuarsales };
