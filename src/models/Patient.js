const con = require("../config/database"); // your MySQL connection

// Find patient by ID
const findById = async (id) => {
  const query = `SELECT * FROM patients WHERE id = ?`;
  const [rows] = await con.query(query, [id]);
  return rows[0]; // single patient object
};

// Get all patients
const findAll = async (data) => {
  const { keyword = "" } = data;
  console.log(keyword);

  let query = `SELECT * FROM patients WHERE 1=1`; // initialize query
  const params = [];

  if (keyword) {
    query += ` AND (first_name LIKE ? OR disease LIKE ? OR doctor_name LIKE ?)`;
    params.push(`%${keyword}%`, `%${keyword}%`, `%${keyword}%`);
  }

  const [rows] = await con.query(query, params);
  return rows; // array of patients
};

// Save new patient
const save = async (patientData) => {
  const query = `
    INSERT INTO patients
    (first_name, last_name, age, gender, contact, disease, doctor_name, appointment_date)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?)
  `;

  const values = [
    patientData.first_name,
    patientData.last_name || null,
    patientData.age,
    patientData.gender,
    patientData.contact,
    patientData.disease || null,
    patientData.doctor_name || null,
    patientData.appointment_date || null,
  ];

  const [result] = await con.query(query, values);
  return { insertId: result.insertId }; // return inserted patient ID
};

// Update patient by ID
const update = async (id, updateData) => {
  const query = `
    UPDATE patients
    SET first_name = ?, last_name = ?, age = ?, gender = ?, contact = ?, disease = ?, doctor_name = ?, appointment_date = ?
    WHERE id = ?
  `;

  const values = [
    updateData.first_name,
    updateData.last_name || null,
    updateData.age,
    updateData.gender,
    updateData.contact,
    updateData.disease || null,
    updateData.doctor_name || null,
    updateData.appointment_date || null,
    id,
  ];

  const [result] = await con.query(query, values);
  return { affectedRows: result.affectedRows };
};

// Delete patient by ID
const remove = async (id) => {
  const [result] = await con.query(`DELETE FROM patients WHERE id = ?`, [id]);
  return { affectedRows: result.affectedRows };
};

const searchPatient = async (data) => {
  const { keyword = "" } = data;

  let query = `SELECT * FROM patients WHERE 1=1`;
  const params = [];

  if (keyword) {
    // Search across multiple fields
    query += ` AND (first_name LIKE ? OR disease LIKE ? OR doctor_name LIKE ?)`;
    params.push(`%${keyword}%`, `%${keyword}%`, `%${keyword}%`);
  }

  const [rows] = await con.query(query, params);
  return rows; // array of doctors
};

module.exports = {
  findById,
  findAll,
  save,
  update,
  remove,
  searchPatient,
};
