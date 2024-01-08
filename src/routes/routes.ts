import express from "express";

const controller = require("../../controller/home-controller");
const herramientas = require("../../controller/herramienta-controller");

const router = express.Router();

router.get("/", controller.home);
router.get("/herramientas", herramientas.getAll);
router.get("/crear-herramienta", controller.crear);
router.post("/crear", herramientas.crearHerramienta);
router.get("/herramienta/:id", herramientas.obtenerProductoPorId);

export default router;
