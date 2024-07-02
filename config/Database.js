import {Sequelize} from "sequelize";

const db = new Sequelize('pengajuan_db', 'root', '', {
  host: "localhost",
  dialect: "mysql"
});

export default db;