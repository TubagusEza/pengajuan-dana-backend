import express from "express";
import {
  getPengajuan,
  getPengajuanById,
  createPengajuan,
  updatePengajuan,
  deletePengajuan
} from "../controllers/Pengajuan.js";
import { verifyUser } from "../middleware/AuthUser.js";

const router = express.Router();

router.get('/Pengajuan', verifyUser, getPengajuan);
router.get('/Pengajuan/:id', verifyUser, getPengajuanById);
router.post('/Pengajuan', verifyUser, createPengajuan);
router.patch('/Pengajuan/:id', verifyUser, updatePengajuan);
router.delete('/Pengajuan/:id', verifyUser, deletePengajuan);

export default router;