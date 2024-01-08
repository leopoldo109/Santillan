import express from "express";
import routes from "./routes/routes";
import path from "path";
import testDatabaseConnection from "../test/testDataBase";

const app = express();

app.use(express.json());

const PORT = 3000;

// Archivos estáticos
app.use(express.static(path.join(__dirname, "../public")));
app.use(express.urlencoded({ extended: true }));
app.set("port", process.env.PORT || PORT);
app.set("view engine", "ejs"); // Establece EJS como el motor de plantillas

// Asignación de rutas
app.use("/", routes); // Utiliza las rutas importadas directamente en la aplicación Express

app.listen(PORT, () => {
    console.log(`Servidor en el puerto http://localhost:${PORT}`);
});

// Llama a la función para probar la conexión

testDatabaseConnection();
