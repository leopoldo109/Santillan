import Personal from "../models/personal";

export async function getAllEmpleados(_req: Request, res: any): Promise<void> {
    try {
        let personal = await Personal.findAll();

        res.render("empleados", { personal });
    } catch (error) {
        console.error("Error al obtener empleados:", error);
        res.status(500).json({ error: "Error interno del servidor" });
    }
}
