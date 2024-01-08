import Productos from "../models/herramientas";

async function getAll(_req: Request, res: any): Promise<void> {
    let productos = await Productos.findAll();

    res.render("herramientas", { productos });
}

async function crearHerramienta(req: any, res: any): Promise<void> {
    // Obtiene los datos del body
    let data = req.body;

    //y crea el post con los datos que obtuvo del req.body
    await Productos.create({
        id_producto: data.id_producto,
        nombre: data.nombre,
        cantidad: data.cantidad,
        proveedor: data.proveedor,
        sector: data.sector,
    });

    res.render("crear-herramienta");
}

// productosController.ts

// Función para obtener un producto por su ID
export async function obtenerProductoPorId(req: any, res: any): Promise<void> {
    const { id } = req.params; // Obtiene el ID del parámetro de la ruta

    try {
        const producto = await Productos.findByPk(id); // Busca el producto por su ID

        if (!producto) {
            res.status(404).json({ error: "Producto no encontrado" });
            return;
        }

        res.render("herramienta", { producto }); // Retorna el producto encontrado como JSON
    } catch (error) {
        console.error("Error al obtener el producto:", error);
        res.status(500).json({ error: "Error interno del servidor" });
    }
}

export default obtenerProductoPorId;

module.exports = {
    getAll,
    crearHerramienta,
    obtenerProductoPorId,
};
