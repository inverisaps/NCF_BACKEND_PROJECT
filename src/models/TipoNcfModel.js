const db = require("../DB/db");
module.exports = class TipoNcfModel {
    async CreateTipoNc(data){
        let sql = `Call create_tipo_ncf('${data.nombre}','${data.tipo}',${data.fecha_vence},${data.desde},${data.hasta},'${cta}')`;
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

        async GetTipoNcf(id){
            const sql = `select * from tipo_ncf where ID_NFC = ${id}`;
            try{
                let resul = await db.query(sql);
                
                return resul;


            }catch(error){
                return error;
            }
        }

        async UpdateTipoNcf(data){
            let sql = `Call update_tipo_ncf(${data.id},'${data.nombre}','${data.tipo}',${data.fecha_vence},${data.desde},${data.hasta},'${cta}')`;   
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

            async DeleteTipoNcf(data){
                let sql = `Call delete_tipo_ncf(${data.id}')`;
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