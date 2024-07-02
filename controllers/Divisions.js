import Divisions from "../models/DivisionModel.js";

export const getDivisions = async(req, res) =>{
  try {
    const response = await Divisions.findAll();
    res.status(200).json(response);
  } catch (error) {
    res.status(500).json({msg: error.message});
  }
}

export const getDivisionsById = async(req, res) =>{
  try {
    const response = await Divisions.findOne({
      where: {
        id: req.params.id
      }
    });
    res.status(200).json(response);
  } catch (error) {
    res.status(500).json({msg: error.message});
  }

}
export const createDivisions = async(req, res) =>{
  const {nama_divisi} = req.body;
  try {
    await Divisions.create({
      nama_divisi: nama_divisi
    });
    res.status(201).json({msg: "Berhasil Tambah Divisi"})
  } catch (error) {
    res.status(400).json({msg: error.message});
  }
}

export const updateDivisions = async(req, res) =>{
  const divisi = await Divisions.findOne({
    where: {
      id: req.params.id
    }
  });
  if(!divisi) return res.status(404).json({msg: "Divisi tidak ditemukan"});
  const {nama_divisi} = req.body;
  try {
    await Metode.update({
      nama_divisi: nama_divisi
    },{
      where:{
        id: divisi.id
      }
    });
    res.status(200).json({msg: "Berhasil Update Divisi"})
  } catch (error) {
    res.status(400).json({msg: error.message});
  }
}

export const deleteDivisions = async(req, res) =>{
  const divisi = await Divisions.findOne({
    where: {
      id: req.params.id
    }
  });
  if(!divisi) return res.status(404).json({msg: "Divisi tidak ditemukan"});
  try {
    await divisi.destroy({
      where:{
        id: divisi.id
      }
    });
    res.status(200).json({msg: "Berhasil Hapus Divisi"})
  } catch (error) {
    res.status(400).json({msg: error.message});
  }
}