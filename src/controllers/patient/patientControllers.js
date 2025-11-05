const logger = require("../../config/winstonLoggerConfig");
const CustomErrorHandler = require("../../utils/CustomErrorHandler");
const { patientServices } = require("../../services"); // we'll create patientServices for DB operations

// CREATE patient
const createPatient = async (req, res, next) => {
  try {
    const {
      name,
      age,
      gender,
      contact,
      disease,
      doctor_name,
      appointment_date,
    } = req.body;

    if (!name || !age || !gender || !contact) {
      return next(
        CustomErrorHandler.validationError("Required fields missing")
      );
    }

    const patient = await patientServices.createPatient(req.body);

    logger.info(`Patient created: ${name}, ID: ${patient.patient_id}`);

    return res.status(201).json({
      status: true,
      message: "Patient registered successfully",
      patient,
    });
  } catch (error) {
    logger.error(
      `{ Api:${req.url}, Error:${error.message}, stack:${error.stack} }`
    );
    return next(error);
  }
};

// GET all patients
const getAllPatients = async (req, res, next) => {
  try {
    const patients = await patientServices.getAllPatients();
    return res.status(200).json(patients);
  } catch (error) {
    logger.error(
      `{ Api:${req.url}, Error:${error.message}, stack:${error.stack} }`
    );
    return next(error);
  }
};

// GET patient by ID
const getPatientById = async (req, res, next) => {
  try {
    const patient = await patientServices.getPatientById(req.params.id);
    if (!patient) return next(CustomErrorHandler.notFound("Patient not found"));

    return res.status(200).json(patient);
  } catch (error) {
    logger.error(
      `{ Api:${req.url}, Error:${error.message}, stack:${error.stack} }`
    );
    return next(error);
  }
};

// UPDATE patient
const updatePatient = async (req, res, next) => {
  try {
    const patient = await patientServices.getPatientById(req.params.id);
    if (!patient) return next(CustomErrorHandler.notFound("Patient not found"));

    await patientServices.updatePatient(req.params.id, req.body);

    logger.info(`Patient updated: ID ${req.params.id}`);

    return res.status(200).json({
      status: true,
      message: "Patient updated successfully",
    });
  } catch (error) {
    logger.error(
      `{ Api:${req.url}, Error:${error.message}, stack:${error.stack} }`
    );
    return next(error);
  }
};

// DELETE patient
const deletePatient = async (req, res, next) => {
  try {
    const patient = await patientServices.getPatientById(req.params.id);
    if (!patient) return next(CustomErrorHandler.notFound("Patient not found"));

    await patientServices.deletePatient(req.params.id);

    logger.info(`Patient deleted: ID ${req.params.id}`);

    return res.status(200).json({
      status: true,
      message: "Patient deleted successfully",
    });
  } catch (error) {
    logger.error(
      `{ Api:${req.url}, Error:${error.message}, stack:${error.stack} }`
    );
    return next(error);
  }
};

module.exports = {
  createPatient,
  getAllPatients,
  getPatientById,
  updatePatient,
  deletePatient,
};
