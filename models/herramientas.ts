// types.ts

import { Model, DataTypes } from "sequelize";
import db from "../db/Connection";

class Productos extends Model {
    public id_producto!: number;
    public nombre!: string;
    public cantidad!: number;
    public estado!: string;
    public sector!: string;
    public marca!: string;
    public readonly createdAt!: Date; // Campo createdAt
    public readonly updatedAt!: Date; // Campo updatedAt
    // Define las relaciones u otros métodos si es necesario
}

Productos.init(
    {
        id_producto: {
            type: DataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true,
        },
        nombre: {
            type: DataTypes.STRING,
            allowNull: false,
        },
        cantidad: {
            type: DataTypes.INTEGER,
            allowNull: false,
        },
        estado: {
            type: DataTypes.STRING,
            allowNull: false,
        },
        sector: {
            type: DataTypes.ENUM("A", "B", "C", "D"), // Define el tipo ENUM para el campo sector
            allowNull: false,
        },
        marca: {
            type: DataTypes.STRING,
            allowNull: true,
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
        modelName: "productos", // Define el nombre del modelo como 'productos'
        timestamps: true, // Habilita el uso de timestamps (createdAt y updatedAt)
        createdAt: "createdAt", // Define el nombre del campo createdAt
        updatedAt: "updatedAt", // Define el nombre del campo updatedAt
    }
);

export default Productos;
