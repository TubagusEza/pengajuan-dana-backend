import Users from "../models/UserModel.js";
import Divisions from "../models/DivisionModel.js";
import argon2 from "argon2";

export const getUser = async(req, res) =>{
  try {
    const response = await Users.findAll({
      attributes:['name', 'email', 'role', 'divisiId'],
      include:[{
        model: Divisions
      }]
    });
    res.status(200).json(response);
  } catch (error) {
    res.status(500).json({msg: error.message});
  }
}

export const getUserById = async(req, res) =>{
  try {
    const response = await Users.findOne({
      attributes:['name', 'email', 'role', 'divisiId'],
      where: {
        id: req.params.id
      },
      include:[{
        model: Divisions
      }]
    });
    res.status(200).json(response);
  } catch (error) {
    res.status(500).json({msg: error.message});
  }
}

export const createUser = async(req, res) =>{
  const {name, email, password, confPassword, role, divisiId} = req.body;
  if(password !== confPassword) return res.status(400).json({msg: "Password tidak cocok!"});
  const hashPassword = await argon2.hash(password);
  try {
    await Users.create({
      name: name,
      email: email,
      password: hashPassword,
      role: role,
      divisiId: divisiId
    });
    res.status(201).json({msg: "Berhasil Register"})
  } catch (error) {
    res.status(400).json({msg: error.message});
  }
}

export const updateUser = async(req, res) =>{
  const user = await Users.findOne({
    where: {
      id: req.params.id
    }
  });
  if(!user) return res.status(404).json({msg: "User tidak ditemukan"});
  const {name, email, password, confPassword, role, divisiId} = req.body;
  let hashPassword;
  if(password === "" || password === null){
    hashPassword = user.password
  }else{
    hashPassword = await argon2.hash(password);
  }
  if(password !== confPassword) return res.status(400).json({msg: "Password tidak cocok!"});
  try {
    await Users.update({
      name: name,
      email: email,
      password: hashPassword,
      role: role,
      divisiId: divisiId
    },{
      where:{
        id: user.id
      }
    });
    res.status(200).json({msg: "Berhasil Update User"})
  } catch (error) {
    res.status(400).json({msg: error.message});
  }
}

export const deleteUser = async(req, res) =>{
  const user = await Users.findOne({
    where: {
      id: req.params.id
    }
  });
  if(!user) return res.status(404).json({msg: "User tidak ditemukan"});
  try {
    await Users.destroy({
      where:{
        id: user.id
      }
    });
    res.status(200).json({msg: "Berhasil Hapus User"})
  } catch (error) {
    res.status(400).json({msg: error.message});
  }
}