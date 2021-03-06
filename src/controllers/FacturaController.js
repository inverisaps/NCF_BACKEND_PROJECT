const FacturaModel = require("../models/FacuturaModel");
const FModel = new FacturaModel();
const API_KEY = require("./API-KEY");
var api_key = new API_KEY();

const CreateFactura = async (req, res) => {
  api_key.verificar(req, res, async (reqe, rese) => {
    //create funcion
    const data = reqe.body;

    if (Object.keys(data).length == 7) {
      if (
        data.id_t_n !== null &&
        data.id_t_n !== undefined &&
        data.id_t_n !== ""
      ) {
        let resultado = await FModel.CreateFactura(data);
        if (resultado !== "error min") {
          rese.json({
            res: "ok",
            data: resultado[0],
          });
        }else if(resultado === "error min") {
          rese.status(400);
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
