import Productos from "../models/herramientas";

export async function getAll(_req: Request, res: any): Promise<void> {
    let productos = await Productos.findAll();

    res.render("herramientas", { productos });
}

export async function crearHerramienta(req: any, res: any): Promise<void> {
    // Obtiene los datos del body
    let data = req.body;

    //y crea el post con los datos que obtuvo del req.body
    await Productos.create({
        id_producto: data.id_producto,
        nombre: capitalizarPrimeraLetra(data.nombre),
        cantidad: data.cantidad,
        estado: capitalizarPrimeraLetra(data.estado),
        sector: data.sector,
        marca: capitalizarPrimeraLetra(data.marca),
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

//Funcion delete

export async function deleteProductoPorId(req: any, res: any): Promise<void> {
    const { id } = req.params;

    try {
        await Productos.destroy({
            where: {
                id_producto: id,
            },
        });
        res.render("home");
    } catch (error) {
        console.error("Error al borrar el producto: ", error);
        res.status(500).json({ error: "Error interno del servidor" });
    }
}

//Funcion filtrar

export async function getFiltro(req: any, res: any): Promise<void> {
    let data = req.body;

    const condiciones = {
        estado:
            data.estado !== null &&
            data.estado !== undefined &&
            data.estado !== ""
                ? capitalizarPrimeraLetra(data.estado)
                : null,
        sector:
            data.estado !== null && data.estado !== undefined && data.sector
                ? capitalizarPrimeraLetra(data.sector)
                : null,
    };

    let productos = await Productos.findAll({
        where: {
            ...Object.fromEntries(
                Object.entries(condiciones).filter(
                    ([_, value]) => value !== null
                )
            ),
        },
    });

    res.render("herramientas", { productos });
}

//Funcion editar

export async function actualizarProductoPorId(
    req: any,
    res: any
): Promise<void> {
    const { id } = req.params;

    try {
        const datos = req.body;

        await Productos.update(
            {
                nombre: capitalizarPrimeraLetra(datos.nombre),
                cantidad: datos.cantidad,
                estado: capitalizarPrimeraLetra(datos.estado),
                marca: capitalizarPrimeraLetra(datos.marca),
                sector: datos.sector,
            },
            {
                where: { id_producto: id },
            }
        );
        res.render("home");
    } catch (error) {
        console.log(id);
        console.error("Error al editar el producto: ", error);
        res.status(500).json({ error: "Error interno del servidor" });
    }
}

function capitalizarPrimeraLetra(str: string) {
    return str.charAt(0).toUpperCase() + str.slice(1);
}

export default obtenerProductoPorId;
