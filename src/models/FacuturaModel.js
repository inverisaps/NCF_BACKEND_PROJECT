const db = require("../DB/db");
module.exports = class FacturaModel {
  async CreateFactura(data) {
    console.log(data);
    const  fech = data.fecha.split(" ")[0];
    const  hora = data.fecha;
    try {
      let sql = `Call add_factura(${data.id_t_n},'${data.rnc}','${data.nombre}',${data.monto}, ${data.id_sucursal}, ${data.id_metodo_pago}, '${fech}', '${hora}');`;
      let resul = await db.query(sql);
 
      if (resul[1].affectedRows > 0) {
        return resul[0];
      } else {
        return false; 
      }
    } catch (err) {
      console.log(err);
      return err;
    }
  }
};
