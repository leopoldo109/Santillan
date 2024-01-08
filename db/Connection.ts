import { Sequelize } from "sequelize-typescript";

const sequelize = new Sequelize({
    dialect: "mysql",
    database: "santillan",
    username: "root",
    password: "",
    host: "localhost",
});

export default sequelize;
