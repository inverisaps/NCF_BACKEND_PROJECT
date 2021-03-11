const FacturaModel = require("../models/FacuturaModel");
const FModel = new FacturaModel();

const CreateFactura = async (req, res) => {
  const data = req.body;
  if (data !== null && data !== undefined && data !== "") {
    let resultado = await FModel.CreateFactura(data);
    if (resultado) {
      res.json({
        res: "ok",
      });
    } else {
      res.json({
        res: "false",
      });
    }
  } else {
    res.json({
      res: "no data",
    });
  }
};

module.exports = { CreateFactura };