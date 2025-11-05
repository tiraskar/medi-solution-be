const { Patient } = require("../../models"); // the model we just created

// Create a new patient
const createPatient = async (patientData) => {
  try {
    const result = await Patient.save(patientData);
    return result;
  } catch (error) {
    throw new Error(error);
  }
};

// Get all patients
const getAllPatients = async () => {
  try {
    const patients = await Patient.findAll();
    return patients;
  } catch (error) {
    throw new Error(error);
  }
};

// Get a patient by ID
const getPatientById = async (patient_id) => {
  try {
    const patient = await Patient.findById(patient_id);
    return patient;
  } catch (error) {
    throw new Error(error);
  }
};

// Update a patient by ID
const updatePatient = async (patient_id, updateData) => {
  try {
    const result = await Patient.update(patient_id, updateData);
    return result;
  } catch (error) {
    throw new Error(error);
  }
};

// Delete a patient by ID
const deletePatient = async (patient_id) => {
  try {
    const result = await Patient.remove(patient_id);
    return result;
  } catch (error) {
    throw new Error(error);
  }
};

module.exports = {
  createPatient,
  getAllPatients,
  getPatientById,
  updatePatient,
  deletePatient,
};
