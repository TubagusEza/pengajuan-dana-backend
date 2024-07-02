import express from "express";
import {
  getMetode,
  getMetodeById,
  createMetode,
  updateMetode,
  deleteMetode
} from "../controllers/Metode.js";

const router = express.Router();

router.get('/Metode', getMetode);
router.get('/Metode/:id', getMetodeById);
router.post('/Metode', createMetode);
router.patch('/Metode/:id', updateMetode);
router.delete('/Metode/:id', deleteMetode);

export default router;