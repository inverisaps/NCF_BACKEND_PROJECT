const TipoModel = require("../models/TipoNcfModel");
const TModel = new TipoModel();

const CreateTipoNcf = async (req, res) => {
  const data = req.body;
  if (data !== null && data !== undefined && data !== "") {
    let resultado = await TModel.CreateTipoNc(data);
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

const getTipoNcf = async (req, res) => {
  let id = req.params.id;
  if (id > 0) {
    let resul = await TModel.GetTipoNcf(id);
    if (resul[0] != null) {
      res.json({
        res: "ok",
        data: resul,
      });
    } else if (resul == null) {
      res.json({
        res: "ok",
        data: 0,
      });
    } else {
      res.json({
        res: "error",
        data: "error",
      });
    }
  } else {
  }
};

const UpdateTipoNcf = async (req, res) => {
  var data = req.body;
  if (data !== null && data !== undefined && data !== "") {
    const respuesta = await TModel.UpdateDeuda(data);
    if (respuesta) {
      res.json({
        res: "ok",
        data: "excelente",
      });
    } else {
      res.json({
        res: "error",
        data: "",
      });
    }
  } else {
    res.json({
      res: "no data",
    });
  }
};

const DeleteTipoNcf = async (req, res) => {
  var data = req.body;
  if (data !== null && data !== undefined && data !== "") {
    const respuesta = await TModel.DeleteTipoNcf(data.id);
    if (respuesta) {
      res.json({
        res: "ok",
        data: "excelente",
      });
    } else {
      res.json({
        res: "error",
        data: "",
      });
    }
  } else {
    res.json({
      res: "no data",
    });
  }
};
module.exports = { CreateTipoNcf, getTipoNcf, UpdateTipoNcf, DeleteTipoNcf };
