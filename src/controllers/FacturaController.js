const FacturaModel = require("../models/FacuturaModel");
const FModel = new FacturaModel();

const CreateFactura = async (req, res) => {
  const data = req.body;

  if (data.id_t_n !== null && data.id_t_n !== undefined && data.id_t_n !== "") {
    let resultado = await FModel.CreateFactura(data);
    if (resultado) {
      res.json({
        res: "ok",
        data: resultado[0]
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
