import { Sequelize } from "sequelize";
import db from "../config/Database.js";
import Users from "./UserModel.js";
import Metode from "./MetodeModel.js";

const {DataTypes} = Sequelize;

const Pengajuan = db.define('pengajuan',{
  nominal:{
    type: DataTypes.STRING,
    allowNull: false,
    validate:{
      notEmpty: true,
      len: [3, 100]
    }
  },
  userId:{
    type: DataTypes.INTEGER,
    allowNull: false,
    validate:{
      notEmpty: true
    }
  },
  metodeId:{
    type: DataTypes.INTEGER,
    allowNull: false,
    validate:{
      notEmpty: true
    }
  }
},{
  freezeTableName: true
});

Users.hasMany(Pengajuan);
Pengajuan.belongsTo(Users, {foreignKey: 'userId'});

Metode.hasMany(Pengajuan);
Pengajuan.belongsTo(Metode, {foreignKey: 'metodeId'});

export default Pengajuan;