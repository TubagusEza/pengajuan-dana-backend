import Metode from "../models/MetodeModel.js";

export const getMetode = async(req, res) =>{
  try {
    const response = await Metode.findAll();
    res.status(200).json(response);
  } catch (error) {
    res.status(500).json({msg: error.message});
  }
}

export const getMetodeById = async(req, res) =>{
  try {
    const response = await Metode.findOne({
      where: {
        id: req.params.id
      }
    });
    res.status(200).json(response);
  } catch (error) {
    res.status(500).json({msg: error.message});
  }
}

export const createMetode = async(req, res) =>{
  const {nama_metode} = req.body;
  try {
    await Metode.create({
      nama_metode: nama_metode
    });
    res.status(201).json({msg: "Berhasil Tambah Metode"})
  } catch (error) {
    res.status(400).json({msg: error.message});
  }
}

export const updateMetode = async(req, res) =>{
  const metode = await Metode.findOne({
    where: {
      id: req.params.id
    }
  });
  if(!metode) return res.status(404).json({msg: "Metode tidak ditemukan"});
  const {nama_metode} = req.body;
  try {
    await Metode.update({
      nama_metode: nama_metode
    },{
      where:{
        id: metode.id
      }
    });
    res.status(200).json({msg: "Berhasil Update Metode"})
  } catch (error) {
    res.status(400).json({msg: error.message});
  }
}

export const deleteMetode = async(req, res) =>{
  const metode = await Metode.findOne({
    where: {
      id: req.params.id
    }
  });
  if(!metode) return res.status(404).json({msg: "Metode tidak ditemukan"});
  try {
    await Metode.destroy({
      where:{
        id: metode.id
      }
    });
    res.status(200).json({msg: "Berhasil Hapus Metode"})
  } catch (error) {
    res.status(400).json({msg: error.message});
  }
}