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

const getSucuarsal = async (req, res) => {
  var id = req.params.id;
  if(id != null || id != '' || id != 0){
  let resultado = await SModel.GetSucursal(id);
  console.log(resultado);
  if (resultado != false && resultado != null && resultado != "ocupado") {
    res.json({
      res: "ok",
      data : resultado
    });
  } else if (resultado === false){
    res.json({
      res: "error",
    });
  }else if(resultado === "ocupada"){
    res.json({
      res: "false",
      data:"ocupada"
    });
  }else{
    res.json({
      res:"error",
    });
  }
}else{
  res.json({
    res:"error",
    data: "no data"
  });
}
};

module.exports = { getSucuarsales , getSucuarsal };
