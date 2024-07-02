import express from "express";
import {
  getDivisions,
  getDivisionsById,
  createDivisions,
  updateDivisions,
  deleteDivisions
} from "../controllers/Divisions.js";

const router = express.Router();

router.get('/Divisions', getDivisions);
router.get('/Divisions/:id', getDivisionsById);
router.post('/Divisions', createDivisions);
router.patch('/Divisions/:id', updateDivisions);
router.delete('/Divisions/:id', deleteDivisions);

export default router;