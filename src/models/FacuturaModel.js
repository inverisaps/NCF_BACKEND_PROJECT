const db = require("../DB/db");
module.exports = class FacturaModel {
  async CreateFactura(data) {
    try {
      let sql = `Call add_factura(${data.id_t_n},'${data.rnc}','${data.nombre}',${data.monto}, ${data.id_sucursal});`;
      let resul = await db.query(sql);
      if (resul[1].affectedRows == 0) {
        return resul[0];
      } else {
        return false; 
      }
    } catch (err) {
      return err;
    }
  }
};

// in id_tipo_ncf int(11),
// in rnc varchar(12),
// in nombre varchar(500),
// in monto double
