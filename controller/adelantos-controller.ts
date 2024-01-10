import Adelanto from "../models/adelanto";

export async function obtenerAdelantosPorId(req: any, res: any): Promise<void> {
    const { id } = req.params; // Obtiene el ID del parámetro de la ruta

    try {
        const adelanto = await Adelanto.findAll({
            where: {
                id_personal: id,
            },
        });

        res.render("adelanto", { adelanto }); // Retorna el adelanto encontrado como JSON
    } catch (error) {
        console.error("Error al obtener adelanto:", error);
        res.status(500).json({ error: "Error interno del servidor" });
    }
}

export async function crearAdelantoPorId(req: any, res: any): Promise<void> {
    let data = req.body;

    await Adelanto.create({
        id_personal: data.id_personal,
        fecha: data.fecha,
        monto_adelanto: data.monto_adelanto,
    });

    res.send("Se creo con exito");
}
