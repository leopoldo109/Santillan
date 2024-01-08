import { Model, DataTypes } from "sequelize";
import db from "../db/Connection";

class Personal extends Model {
    public id_personal!: number;
    public nombre!: string;
    public cargo!: string;
    public readonly createdAt!: Date; // Campo createdAt
    public readonly updatedAt!: Date; // Campo updatedAt
}

Personal.init(
    {
        id_personal: {
            type: DataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true,
        },
        nombre: {
            type: DataTypes.STRING,
            allowNull: false,
        },
        cargo: {
            type: DataTypes.INTEGER,
            allowNull: false,
        },
        createdAt: {
            type: DataTypes.DATE,
            allowNull: false,
            defaultValue: DataTypes.NOW,
        },
        updatedAt: {
            type: DataTypes.DATE,
            allowNull: false,
            defaultValue: DataTypes.NOW,
        },
    },
    {
        sequelize: db, // Utiliza la instancia de Sequelize configurada en db
        modelName: "personal", // Define el nombre del modelo como 'productos'
        timestamps: true, // Habilita el uso de timestamps (createdAt y updatedAt)
        createdAt: "createdAt", // Define el nombre del campo createdAt
        updatedAt: "updatedAt", // Define el nombre del campo updatedAt
    }
);

export default Personal;
