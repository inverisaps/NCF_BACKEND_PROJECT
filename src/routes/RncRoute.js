const express = require("express");
const router = express.Router();
const RncController = require('../controllers/RncController');

router.get('/get/:rnc',RncController.BuscarRNC);

module.exports = router;