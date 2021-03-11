const {Router} = require("express");
const router = Router();

const TipoNcfRouter = require('./TipoNcfRouter');
const FacturaRouter = require('./FacturaRoute'); 
const RNCRouter = require('./RncRoute'); 


router.get('/', (req,res) => {
    res.json({
        res:"ok",
        body:"No hay nada"
    });
});

router.use('/tiponcf',TipoNcfRouter);
router.use('/factura',FacturaRouter);
router.use('/rnc',RNCRouter);

module.exports = router;