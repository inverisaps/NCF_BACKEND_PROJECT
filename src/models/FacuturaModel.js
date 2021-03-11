const db = require("../DB/db");
module.exports = class FacturaModel {
    async CreateFactura(data){
        let sql = `Call add_factura(${data.id_t_n},'${data.rnc}','${data.nombre}',${data.monto})`;
        console.log(sql);    
        let resul = await db.query(sql);
            console.log(resul);
            if(resul.affectedRows > 0){
                return true;
            }else{
                return false;
            }
        }catch(err){
            // console.log(err);
            return err;
        }    
    }    

// in id_tipo_ncf int(11),
// in rnc varchar(12),
// in nombre varchar(500),
// in monto double