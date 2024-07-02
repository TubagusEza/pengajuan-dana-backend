import { Sequelize } from "sequelize";
import db from "../config/Database.js";

const {DataTypes} = Sequelize;

const Divisions = db.define('divisi',{
  nama_divisi:{
    type: DataTypes.STRING,
    allowNull: false,
    validate:{
      notEmpty: true,
      len: [3, 100]
    }
  }
},{
  freezeTableName: true
});

export default Divisions;