import sequelize from "../db/Connection"; // Importa tu instancia de Sequelize

async function testDatabaseConnection(): Promise<void> {
    try {
        // Realiza una operación simple, como una consulta
        const result = await sequelize.authenticate();
        console.log("Conexión exitosa a la base de datos", result);
    } catch (error) {
        console.error("Error al conectar con la base de datos:", error);
    }
}

export default testDatabaseConnection;
