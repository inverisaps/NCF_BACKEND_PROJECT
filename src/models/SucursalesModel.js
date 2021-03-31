const db = require("../DB/db");

module.exports = class SucursalesModel {
  
  async GetSucursales() {
    try {
      let sql = `Call get_sucursales();`;
      let resul = await db.query(sql);
      if (resul) {
        return resul[0];
      } else {
        return false;
      }
    } catch (err) {
      return err;
    }
  }
  
  async GetSucursal(id) {
    try {
      let sql = `Call get_sucursal(${id});`;
      let resul = await db.query(sql);
      if (resul) return resul[0][0].NOMBRE;
    } catch (err) {
      return null;
    }
  }
};
