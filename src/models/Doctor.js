const con = require("../config/database"); // your MySQL connection

// Find doctor by ID
const findById = async (doctor_id) => {
  const query = `SELECT * FROM doctor WHERE doctor_id = ?`;
  const result = await con.query(query, [doctor_id]);
  return result[0][0]; // single doctor object
};

// Get all doctors
const findAll = async () => {
  const query = `SELECT * FROM doctor`;
  const result = await con.query(query);
  return result[0]; // array of doctors
};

// Save new doctor
const save = async (doctorData) => {
  const query = `
    INSERT INTO doctor 
    (name, photo, gender, dob, email, mobile, address, marital_status, department, qualification, reg_no, bio)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
  `;
  const values = [
    doctorData.name,
    doctorData.photo,
    doctorData.gender,
    doctorData.dob,
    doctorData.email,
    doctorData.mobile,
    doctorData.address,
    doctorData.marital_status,
    doctorData.department,
    doctorData.qualification,
    doctorData.reg_no,
    doctorData.bio,
  ];
  const result = await con.query(query, values);
  return result[0]; // insert info like insertId
};

// Update doctor by ID
const update = async (doctor_id, updateData) => {
  const query = `
    UPDATE doctor
    SET name = ?, photo = ?, gender = ?, dob = ?, email = ?, mobile = ?, address = ?, marital_status = ?, department = ?, qualification = ?, reg_no = ?, bio = ?
    WHERE doctor_id = ?
  `;
  const values = [
    updateData.name,
    updateData.photo,
    updateData.gender,
    updateData.dob,
    updateData.email,
    updateData.mobile,
    updateData.address,
    updateData.marital_status,
    updateData.department,
    updateData.qualification,
    updateData.reg_no,
    updateData.bio,
    doctor_id,
  ];
  const result = await con.query(query, values);
  return result[0]; // affectedRows
};

// Delete doctor by ID
const remove = async (doctor_id) => {
  const query = `DELETE FROM doctor WHERE doctor_id = ?`;
  const result = await con.query(query, [doctor_id]);
  return result[0]; // affectedRows
};

const searchDoctors = async (data) => {
  const { keyword = "", limit = 10, page = 1 } = data;

  let query = `SELECT * FROM doctor WHERE 1=1`;
  const params = [];

  if (keyword) {
    // Search across multiple fields
    query += ` AND (name LIKE ? OR email LIKE ? OR mobile LIKE ?)`;
    params.push(`%${keyword}%`, `%${keyword}%`, `%${keyword}%`);
  }

  // Pagination
  const offset = (page - 1) * limit;
  query += ` LIMIT ? OFFSET ?`;
  params.push(parseInt(limit), parseInt(offset));

  const [rows] = await con.query(query, params);
  return rows; // array of doctors
};

module.exports = {
  findById,
  findAll,
  save,
  update,
  remove,
  searchDoctors,
};
