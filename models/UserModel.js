import { Sequelize } from "sequelize";
import db from "../config/Database.js";
import Divisions from "./DivisionModel.js";

const {DataTypes} = Sequelize;

const Users = db.define('users',{
  name:{
    type: DataTypes.STRING,
    allowNull: false,
    validate:{
      notEmpty: true,
      len: [3, 100]
    }
  },
  email:{
    type: DataTypes.STRING,
    allowNull: false,
    validate:{
      notEmpty: true,
      isEmail: true
    }
  },
  password:{
    type: DataTypes.STRING,
    allowNull: false,
    validate:{
      notEmpty: true
    }
  },
  role:{
    type: DataTypes.STRING,
    allowNull: false,
    validate:{
      notEmpty: true,
      len: [3, 100]
    }
  },
  divisiId:{
    type: DataTypes.INTEGER,
    allowNull: false,
    validate:{
      notEmpty: true
    }
  }
},{
  freezeTableName: true
});


Divisions.hasMany(Users);
Users.belongsTo(Divisions, {foreignKey: 'divisiId'});


export default Users;