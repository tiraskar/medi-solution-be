const logger = require("../../config/winstonLoggerConfig");
const CustomErrorHandler = require("../../utils/CustomErrorHandler");
const { patientServices } = require("../../services"); // MySQL patients service
const asyncHandler = require("../../middlewares/asyncHandler");

// CREATE patient
const createPatient = asyncHandler(async (req, res, next) => {
  const { first_name, age, gender, contact } = req.body;

  if (!first_name || !age || !gender || !contact) {
    return next(CustomErrorHandler.validationError("Required fields missing"));
  }

  const patient = await patientServices.createPatient(req.body);

  logger.info(`Patient created: ${first_name}, ID: ${patient.insertId}`);

  return res.status(201).json({
    status: true,
    message: "Patient registered successfully",
    patient: { id: patient.insertId, ...req.body },
  });
});

// GET all patients
const getAllPatients = asyncHandler(async (req, res, next) => {
  const { keyword = "" } = req.query;
  // console.log(keyword);

  const patients = await patientServices.getAllPatients({ keyword });
  return res.status(200).json(patients);
});

// GET patient by ID
const getPatientById = asyncHandler(async (req, res, next) => {
  const patient = await patientServices.getPatientById(req.params.id);
  if (!patient) return next(CustomErrorHandler.notFound("Patient not found"));

  return res.status(200).json(patient);
});

// UPDATE patient
const updatePatient = asyncHandler(async (req, res, next) => {
  const patient = await patientServices.getPatientById(req.params.id);
  if (!patient) return next(CustomErrorHandler.notFound("Patient not found"));

  const result = await patientServices.updatePatient(req.params.id, req.body);

  logger.info(`Patient updated: ID ${req.params.id}`);

  return res.status(200).json({
    status: true,
    message: "Patient updated successfully",
    affectedRows: result.affectedRows,
  });
});

// DELETE patient
const deletePatient = asyncHandler(async (req, res, next) => {
  const patient = await patientServices.getPatientById(req.params.id);
  if (!patient) return next(CustomErrorHandler.notFound("Patient not found"));

  const result = await patientServices.deletePatient(req.params.id);

  logger.info(`Patient deleted: ID ${req.params.id}`);

  return res.status(200).json({
    status: true,
    message: "Patient deleted successfully",
    affectedRows: result.affectedRows,
  });
});

const searchPatient = asyncHandler(async (req, res, next) => {
  let { keyword = "" } = req.query;
  // console.log("Hello", keyword);

  // Validate required fields
  // if (!limit || !page) {
  //   return next(new Error("Limit and page are required"));
  // }

  // // Convert to integers
  // limit = parseInt(limit, 10);
  // page = parseInt(page, 10);

  // // Validate positive integers
  // if (isNaN(limit) || limit <= 0 || isNaN(page) || page <= 0) {
  //   return next(new Error("Limit and page must be positive integers"));
  // }

  // Optional keyword validation
  if (keyword && typeof keyword !== "string") {
    return next(new Error("Keyword must be a string"));
  }

  // Call service
  const patient = await patientServices.searchPatient({ keyword });

  res.status(200).json({
    status: true,
    data: patient,
  });
});

module.exports = {
  createPatient,
  getAllPatients,
  getPatientById,
  updatePatient,
  deletePatient,
  searchPatient,
};
