const express = require("express");
const router = express.Router();
const { patientControllers } = require("../../controllers"); // Make sure you export controllers as patientControllers
// const {
//   //   createPatientValidation,
//   updatePatientValidation,
// } = require("../../middlewares/patient/patientValidation"); // Optional validation middleware
const auth = require("../../middlewares/auth/auth"); // If routes are protected

//  Create new patient
router.post(
  "/",
  // auth, // optional, only if user must be logged in
  //   createPatientValidation, // optional validation middleware
  patientControllers.createPatient
);

router.get(
  "/search",
  // auth, // optional
  patientControllers.searchPatient
);
//  Get all patients
router.get(
  "/",
  // auth, // optional
  patientControllers.getAllPatients
);

//  Get single patient by ID
router.get(
  "/:id",
  // auth, // optional
  patientControllers.getPatientById
);

//  Update patient
router.put(
  "/:id",
  // auth, // optional
  //   updatePatientValidation, // optional validation middleware
  patientControllers.updatePatient
);

//  Delete patient
router.delete(
  "/:id",
  // auth, // optional
  patientControllers.deletePatient
);

module.exports = router;
