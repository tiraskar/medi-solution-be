const con = require("../config/database"); // your MySQL connection

// Find test by ID
const findById = async (test_id) => {
  const query = `SELECT * FROM test WHERE test_id = ?`;
  const result = await con.query(query, [test_id]);
  return result[0][0]; // single test object
};

// Get all active tests (status = 1)
const findAll = async () => {
  const query = `SELECT * FROM test`;
  const result = await con.query(query);
  return result[0]; // array of tests
};

// Save new test
const save = async (testData) => {
  const query = `
    INSERT INTO test 
      (test_name, parameters, low_range, top_range, rate, gender, email, mobile, address, qualification, bio, created_by, status)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
  `;
  const values = [
    testData.test_name,
    testData.parameters,
    testData.low_range,
    testData.top_range,
    testData.rate,
    testData.gender,
    testData.email,
    testData.mobile,
    testData.address,
    testData.qualification,
    testData.bio,
    testData.created_by,
    testData.status || 1, // default active
  ];
  const result = await con.query(query, values);
  return result[0]; // contains insertId
};

// Update test by ID
const update = async (test_id, updateData) => {
  const query = `
    UPDATE test
    SET test_name = ?, parameters = ?, low_range = ?, top_range = ?, rate = ?,
        gender = ?, email = ?, mobile = ?, address = ?, qualification = ?, bio = ?, created_by = ?, status = ?
    WHERE test_id = ?
  `;
  const values = [
    updateData.test_name,
    updateData.parameters,
    updateData.low_range,
    updateData.top_range,
    updateData.rate,
    updateData.gender,
    updateData.email,
    updateData.mobile,
    updateData.address,
    updateData.qualification,
    updateData.bio,
    updateData.created_by,
    updateData.status,
    test_id,
  ];
  const result = await con.query(query, values);
  return result[0]; // contains affectedRows
};

// Delete test by ID
const remove = async (test_id) => {
  const query = `DELETE FROM test WHERE test_id = ?`;
  const result = await con.query(query, [test_id]);
  return result[0]; // contains affectedRows
};

//  Optional: Get tests by range and active status
const findByRange = async (low, high) => {
  const query = `
    SELECT test_id, test_name
    FROM test
    WHERE status = 1 AND low_range >= ? AND top_range <= ?
  `;
  const result = await con.query(query, [low, high]);
  return result[0];
};

// Find tests by status
const findByStatus = async (status) => {
  const query = `SELECT test_id, test_name FROM test WHERE status = ?`;
  const result = await con.query(query, [status]);
  return result[0]; // array of tests
};

module.exports = {
  findById,
  findAll,
  save,
  update,
  remove,
  findByRange,
  findByStatus,
};
