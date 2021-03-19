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

      if (resul[0][0].USO == 0) {
        let rpta = await this.update_state_sucursal(id, 1);
        if (rpta == true) {
          return resul[0][0].NOMBRE;
        } else if (rpta == false) {
          return false;
        } else {
          return null;
        }
      } else {
        return "ocupada";
      }
    } catch (err) {
      return null;
    }
  }

  async update_state_sucursal(id, state) {
    console.log(id + " " + state);
    try {
      let sql = `update sucursal set USO = ${state} where ID_SUCURSAL = ${id}`;
      let resul = await db.query(sql);

      if (resul.affectedRows > 0) {
        return true;
      } else {
        return false;
      }
    } catch (err) {
      console.log(err);
      return null;
    }
  }
};
