const express = require("express");
const router = express.Router();
const FacturaController = require('../controllers/FacturaController');
//ruta para agregar un registro de deuda
router.post('/create',FacturaController.CreateFactura);

module.exports = router;