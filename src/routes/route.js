//clave de seguridad hash //C9A1E9820472834883A7C8CA67EF62B66047B80DA652818819BB039830CD3E94//

const { Router } = require("express");
const router = Router();

const TipoNcfRouter = require("./TipoNcfRouter");
const FacturaRouter = require("./FacturaRoute");
const RNCRouter = require("./RncRoute");
const SucursalesRouter = require("./SucursalRoute");

router.get("/", (req, res) => {
  res.json({
    res: "ok",
    body: "No hay nada",
  });
});

router.use("/tiponcf", TipoNcfRouter);
router.use("/factura", FacturaRouter);
router.use("/rnc", RNCRouter);
router.use("/sucursales", SucursalesRouter);

module.exports = router;
