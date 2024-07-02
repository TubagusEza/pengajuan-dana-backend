import Pengajuan from "../models/PengajuanModel.js";
import Users from "../models/UserModel.js";
import Metode from "../models/MetodeModel.js";
import Divisions from "../models/DivisionModel.js";
import {Op} from "sequelize";

export const getPengajuan = async(req, res) =>{
  try {
    let response;
    if(req.role === "Admin"){
      response = await Pengajuan.findAll({
        attributes:['id','nominal'],
        include:[
          {
            model: Users,
            attributes:['name','email', 'divisiId'],
            include:[{
              model: Divisions,
              attributes:['nama_divisi']
            }]
          },
          {
            model: Metode,
            attributes:['nama_metode']
          }
        ]
      });
    }else{
      response = await Pengajuan.findAll({
        attributes:['id','nominal'],
        where:{
          userId: req.userId
        },
        include:[
          {
            model: Users,
            attributes:['name','email', 'divisiId'],
            include:[{
              model: Divisions,
              attributes:['nama_divisi']
            }]
          },
          {
            model: Metode,
            attributes:['nama_metode']
          }
        ]
      });
    }
    res.status(200).json(response);
  } catch (error) {
    res.status(500).json({msg: error.message});
  }
}

export const getPengajuanById = async(req, res) =>{
  try {
    const pengajuan = await Pengajuan.findOne({
      where:{
        id: req.params.id
      }
    });
    if(!pengajuan) return res.status(404).json({msg: "Data tidak ada"});
    let response;
    if(req.role === "Admin"){
      response = await Pengajuan.findOne({
        attributes:['id','nominal'],
        where:{
          id: pengajuan.id
        },
        include:[
          {
            model: Users,
            attributes:['name','email', 'divisiId'],
            include:[{
              model: Divisions,
              attributes:['nama_divisi']
            }]
          },
          {
            model: Metode,
            attributes:['nama_metode']
          }
        ]
      });
    }else{
      response = await Pengajuan.findOne({
        attributes:['id','nominal'],
        where:{
          [Op.and]:[{id: pengajuan.id}, {userId: req.userId}]
        },
        include:[
          {
            model: Users,
            attributes:['name','email', 'divisiId'],
            include:[{
              model: Divisions,
              attributes:['nama_divisi']
            }]
          },
          {
            model: Metode,
            attributes:['nama_metode']
          }
        ]
      });
    }
    res.status(200).json(response);
  } catch (error) {
    res.status(500).json({msg: error.message});
  }
}

export const createPengajuan = async(req, res) =>{
  const {nominal, metodeId} = req.body;
  try {
    await Pengajuan.create({
      nominal: nominal,
      userId: req.userId,
      metodeId: metodeId
    });
    res.status(201).json({msg: "Pengajuan Berhasil Dibuat"})
  } catch (error) {
    res.status(500).json({msg: error.message});
  }
}

export const updatePengajuan = async(req, res) =>{
  try {
    const pengajuan = await Pengajuan.findOne({
      where:{
        id: req.params.id
      }
    });
    if(!pengajuan) return res.status(404).json({msg: "Data tidak ada"});
    const {nominal, metodeId} = req.body;
    if(req.role === "Admin"){
      await Pengajuan.update({nominal, metodeId},{
        where:{
          id: pengajuan.id
        }
      })
    }else{
      if(req.userId !== pengajuan.userId) return res.status(403).json({msg: "Akses Terlarang"});
      await Pengajuan.update({nominal, metodeId},{
        where:{
          [Op.and]:[{id: pengajuan.id}, {userId: req.userId}]
        }
      })
    }
    res.status(200).json({msg: "Pengajuan Berhasil Diubah"});
  } catch (error) {
    res.status(500).json({msg: error.message});
  }
}

export const deletePengajuan = async(req, res) =>{
  try {
    const pengajuan = await Pengajuan.findOne({
      where:{
        id: req.params.id
      }
    });
    if(!pengajuan) return res.status(404).json({msg: "Data tidak ada"});
    const {nominal, metodeId} = req.body;
    if(req.role === "Admin"){
      await Pengajuan.destroy({
        where:{
          id: pengajuan.id
        }
      })
    }else{
      if(req.userId !== pengajuan.userId) return res.status(403).json({msg: "Akses Terlarang"});
      await Pengajuan.destroy({
        where:{
          [Op.and]:[{id: pengajuan.id}, {userId: req.userId}]
        }
      })
    }
    res.status(200).json({msg: "Pengajuan Berhasil Dihapus"});
  } catch (error) {
    res.status(500).json({msg: error.message});
  }
}