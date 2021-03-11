const express = require("express");
const router = express.Router();
const tipoNcfController = require('../controllers/TipoNcfController');

//ruta para agregar un registro de deuda

router.post('/',tipoNcfController.CreateTipoNcf);
router.get('/gettiponcf/:id',tipoNcfController.getTipoNcf);
router.post('/updateDeuda/:id',tipoNcfController.UpdateTipoNcf);
router.post('/delete',tipoNcfController.DeleteTipoNcf);

module.exports = router;
