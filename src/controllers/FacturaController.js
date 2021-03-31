const FacturaModel = require("../models/FacuturaModel");
const FModel = new FacturaModel();

const CreateFactura = async (req, res) => {
  api_key.verificar(req, res, async (reqe, rese) => {
    //create funcion
    const data = reqe.body;
    if (Object.keys(data).length == 6) {
      if (
        data.id_t_n !== null &&
        data.id_t_n !== undefined &&
        data.id_t_n !== ""
      ) {
        let resultado = await FModel.CreateFactura(data);
        if (resultado) {
          rese.json({
            res: "ok",
            data: resultado[0],
          });
        } else {
          rese.json({
            res: "false",
          });
        }
      } else {
        rese.json({
          res: "no data",
        });
      }
    } else {
      rese.json({
        res: "no data",
      });
    }
  });
};
module.exports = { CreateFactura };
