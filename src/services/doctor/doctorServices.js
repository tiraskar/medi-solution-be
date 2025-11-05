const { Doctor } = require("../../models"); // the model we just created

// Create a new doctor
const createDoctor = async (doctorData) => {
  try {
    const result = await Doctor.save(doctorData);
    return result;
  } catch (error) {
    throw new Error(error);
  }
};

// Get all doctors
const getAllDoctors = async () => {
  try {
    const doctors = await Doctor.findAll();
    return doctors;
  } catch (error) {
    throw new Error(error);
  }
};

// Get a doctor by ID
const getDoctorById = async (doctor_id) => {
  try {
    const doctor = await Doctor.findById(doctor_id);
    return doctor;
  } catch (error) {
    throw new Error(error);
  }
};

// Update a doctor by ID
const updateDoctor = async (doctor_id, updateData) => {
  try {
    const result = await Doctor.update(doctor_id, updateData);
    return result;
  } catch (error) {
    throw new Error(error);
  }
};

// Delete a doctor by ID
const deleteDoctor = async (doctor_id) => {
  try {
    const result = await Doctor.remove(doctor_id);
    return result;
  } catch (error) {
    throw new Error(error);
  }
};

const searchDoctors = async (data) => {
  return await Doctor.searchDoctors(data);
};

module.exports = {
  createDoctor,
  getAllDoctors,
  getDoctorById,
  updateDoctor,
  deleteDoctor,
  searchDoctors,
};
