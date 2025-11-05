const con = require("../config/database"); // your MySQL connection

// Find patient by ID
const findById = async (patient_id) => {
  const query = `SELECT * FROM patient_info WHERE patient_id = ?`;
  const result = await con.query(query, [patient_id]);
  return result[0][0]; // returns single patient object
};

// Get all patients
const findAll = async () => {
  const query = `SELECT * FROM patient_info`;
  const result = await con.query(query);
  return result[0]; // returns array of patients
};

// Save new patient
const save = async (patientData) => {
  const query = `
        INSERT INTO patient_info 
        (first_name, age, gender, contact, disease, doctor_name, appointment_date, created_by)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?)
    `;
  const values = [
    patientData.name,
    patientData.age,
    patientData.gender,
    patientData.contact,
    patientData.disease,
    patientData.doctor_name,
    patientData.appointment_date,
    patientData.created_by || 1,
  ];
  const result = await con.query(query, values);
  return result[0]; // result info like insertId
};

// Update patient by ID
const update = async (patient_id, updateData) => {
  const query = `
        UPDATE patient_info
        SET first_name = ?, age = ?, gender = ?, contact = ?, disease = ?, doctor_name = ?, appointment_date = ?
        WHERE patient_id = ?
    `;
  const values = [
    updateData.name,
    updateData.age,
    updateData.gender,
    updateData.contact,
    updateData.disease,
    updateData.doctor_name,
    updateData.appointment_date,
    patient_id,
  ];
  const result = await con.query(query, values);
  return result[0]; // result info like affectedRows
};

// Delete patient by ID
const remove = async (patient_id) => {
  const query = `DELETE FROM patient_info WHERE patient_id = ?`;
  const result = await con.query(query, [patient_id]);
  return result[0]; // result info like affectedRows
};

module.exports = {
  findById,
  findAll,
  save,
  update,
  remove,
};
