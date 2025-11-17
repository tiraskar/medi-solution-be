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

const searchByTableAndDateRange = async (data) => {
  // Destructure with defaults for all optional parameters
  const {
    tableName = "doctor",
    startDate = null,
    endDate = null,
    limit = 10,
    page = 1,
  } = data;

  // 1. Initialize query with the chosen table name
  // The 'WHERE 1=1' allows for easy conditional appending of clauses
  let query = `
    SELECT 
      * FROM 
      ${tableName} 
    WHERE 
      1=1
  `;
  const params = [];

  // NOTE: Assuming the date column is named 'created_at' in the table
  const dateColumn = "created_at";

  // 2. Filter by Date Range (Optional)
  if (startDate && endDate) {
    query += ` AND ${dateColumn} BETWEEN ? AND ?`;
    params.push(startDate, endDate);
  } else if (startDate) {
    // If only start date is provided (records after this date)
    query += ` AND ${dateColumn} >= ?`;
    params.push(startDate);
  } else if (endDate) {
    // If only end date is provided (records up to this date)
    query += ` AND ${dateColumn} <= ?`;
    params.push(endDate);
  }

  // 3. Ordering (Recommended)
  query += ` ORDER BY ${dateColumn} DESC`;

  // 4. Pagination
  const offset = (page - 1) * limit;
  query += ` LIMIT ? OFFSET ?`;

  // Ensure limit and offset are integers
  params.push(parseInt(limit), parseInt(offset));

  const [rows] = await con.query(query, params);
  return rows;
};

module.exports = {
  findById,
  findAll,
  save,
  update,
  remove,
  searchDoctors,
  searchByTableAndDateRange,
};
