const express = require("express");
const router = express.Router();
const { doctorControllers } = require("../../controllers"); // make sure you export it in controllers/index.js
const auth = require("../../middlewares/auth/auth"); // optional auth middleware
const upload = require("../../middlewares/uploads/upload");
const {
  doctorValidation,
} = require("../../middlewares/doctor/doctorValidation");

// Routes

// Create new doctor
router.post(
  "/",
  upload.single("photo"),
  doctorValidation,
  doctorControllers.createDoctor
);

// Get all doctors
router.get("/", doctorControllers.getAllDoctors);

// Search doctors by email, mobile, or name
router.get("/search", doctorControllers.searchDoctors);
router.get("/searchbetween", doctorControllers.searchBetween);

// Get doctor by ID
router.get("/:id", doctorControllers.getDoctorById);

// Update doctor by ID
router.put("/:id", upload.single("photo"), doctorControllers.updateDoctor);

// Delete doctor by ID
router.delete("/:id", doctorControllers.deleteDoctor);

module.exports = router;
