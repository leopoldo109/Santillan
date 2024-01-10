import express from "express";

const controller = require("../../controller/home-controller");
const herramientas = require("../../controller/herramienta-controller");
const personal = require("../../controller/personal-controller");
const adelanto = require("../../controller/adelantos-controller");

const router = express.Router();

router.get("/", controller.home);
router.get("/herramientas", herramientas.getAll);
router.get("/crear-herramienta", controller.crear);
router.get("/empleados", personal.getAllEmpleados);

router.post("/filtrar", herramientas.getFiltro);
router.post("/crear", herramientas.crearHerramienta);
router.post("/editar/:id", herramientas.actualizarProductoPorId);
router.post("/crear-adelanto", adelanto.crearAdelantoPorId);

router.get("/herramienta/:id", herramientas.obtenerProductoPorId);
router.get("/delete/:id", herramientas.deleteProductoPorId);
router.get("/crea-adelanto/:id", controller.anotarAdelanto);
router.get("/adelanto/:id", adelanto.obtenerAdelantosPorId);

export default router;
