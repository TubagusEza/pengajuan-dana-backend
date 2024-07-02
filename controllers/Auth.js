import Users from "../models/UserModel.js";
import Divisions from "../models/DivisionModel.js";
import argon2 from "argon2";

export const Login = async (req, res) =>{
  const user = await Users.findOne({
    where: {
      email: req.body.email
    },
      include:[{
        model: Divisions
      }]
  });
  if(!user) return res.status(404).json({msg: "User tidak ditemukan"});
  const match = await argon2.verify(user.password, req.body.password);
  if(!match) return res.status(400).json({msg: "Password Salah!"});
  req.session.userId = user.id;
  const id = user.id;
  const name = user.name;
  const email = user.email;
  const role = user.role;
  const divisiId = user.divisiId;
  res.status(200).json(({id, name, email, role, divisiId}));
}

export const Me = async (req, res) =>{
  if(!req.session.userId){
    return res.status(401).json({msg: "Mohon login terlebih dahulu"});
  }
  const user = await Users.findOne({
    attributes:['id','name','email','role','divisiId'],
    where: {
      id: req.session.userId
    },
    include:[{
      model: Divisions
    }]
  });
  if(!user) return res.status(404).json({msg: "User tidak ditemukan"});
  res.status(200).json(user);
}

export const Logout = (req, res) =>{
  req.session.destroy((err)=>{
    if(err) return res.status(400).json({msg: "Tidak dapat logout"});
    res.status(200).json({msg: "Anda telah logout"});
  })
}