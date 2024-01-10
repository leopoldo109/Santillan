import { Model, DataTypes } from "sequelize";
import db from "../db/Connection";
import Personal from "./personal";

// Definición del modelo Adelanto
class Adelanto extends Model {
    public id_adelanto!: number;
    public id_personal!: number;
    public monto_adelanto!: number;
    public fecha!: Date;

    // Añade otras propiedades si es necesario

    // Establece las asociaciones (relaciones) aquí si las hay
    // static associate(models: any) {
    //   Adelanto.belongsTo(models.Personal, { foreignKey: 'id_personal' });
    // }
}

// Define el modelo utilizando Sequelize
Adelanto.init(
    {
        id_adelanto: {
            type: DataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true,
        },
        id_personal: {
            type: DataTypes.INTEGER,
            references: {
                model: "Personal", // Nombre de la tabla referenciada
                key: "id_personal", // Columna referenciada en la tabla Personal
            },
            allowNull: false,
        },
        monto_adelanto: {
            type: DataTypes.DECIMAL(10, 2),
            allowNull: false,
        },
        fecha: {
            type: DataTypes.DATE,
            allowNull: false,
        },
    },
    {
        sequelize: db,
        tableName: "adelantos", // Nombre de la tabla en la base de datos
        modelName: "Adelanto", // Nombre del modelo
        timestamps: true,
        createdAt: "createdAt",
        updatedAt: "updatedAt",
    }
);

Adelanto.belongsTo(Personal, { foreignKey: "id_personal" });

export default Adelanto;
