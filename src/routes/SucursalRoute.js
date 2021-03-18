const express = require("express");
const router = express.Router();
const SController = require('../controllers/SucursalesController');

router.get('/',SController.getSucuarsales);

module.exports = router;