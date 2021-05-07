const db = require("../DB/db");
module.exports = class FacturaModel {
  async selectMin(id) {
    const sql = `select (HASTA - DESDE) as valor from tipo_ncf where ID_NFC = ${id}`;
    try {
      let resul = await db.query(sql);
      if (resul[0].valor > 0) {
        return true;
      } else {
        return false;
      }
    } catch (err) {
      console.log(err);
    }
  }

  async CreateFactura(data) {
    const fech = data.fecha.split(" ")[0];
    const hora = data.fecha;
    try {
      let sql = `Call add_factura(${data.id_t_n},'${data.rnc}','${data.nombre}',${data.monto}, ${data.id_sucursal}, ${data.id_metodo_pago}, '${fech}', '${hora}');`;
     let auth = await this.selectMin(data.id_t_n);
     if(auth){
      let resul = await db.query(sql);
      if (resul[1].affectedRows > 0) {
        return resul[0];
      } else {
        return false;
      }
    }else{
      return "error min";
    }
    }catch(err) {
      console.log(err);
      return err;
    }
  }

};
