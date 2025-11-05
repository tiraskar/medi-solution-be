const con = require("../config/database"); // your MySQL connection

// Find test group by ID
const findById = async (group_id) => {
  const query = `SELECT * FROM test_group WHERE group_id = ?`;
  const result = await con.query(query, [group_id]);
  if (!result[0][0]) return null;

  // Parse test_ids JSON
  const group = result[0];
  return group;
};

// Get all active test groups
const findAll = async () => {
  const query = `SELECT * FROM test_group WHERE status = 1`;
  const result = await con.query(query);

  return result[0];
};

// Save new test group
const save = async (groupData) => {
  const query = `
    INSERT INTO test_group (group_name, test_ids, created_by, status)
    VALUES (?, ?, ?, ?)
  `;
  const values = [
    groupData.group_name,
    JSON.stringify(groupData.test_ids), // convert array to JSON
    groupData.created_by,
    groupData.status || 1,
  ];

  const result = await con.query(query, values);
  return result[0]; // contains insertId
};

// Update test group by ID
const update = async (group_id, updateData) => {
  const query = `
    UPDATE test_group
    SET group_name = ?, test_ids = ?, created_by = ?, status = ?
    WHERE group_id = ?
  `;
  const values = [
    updateData.group_name,
    JSON.stringify(updateData.test_ids),
    updateData.created_by,
    updateData.status,
    group_id,
  ];

  const result = await con.query(query, values);
  return result[0]; // affectedRows
};

// Delete test group by ID
const remove = async (group_id) => {
  const query = `DELETE FROM test_group WHERE group_id = ?`;
  const result = await con.query(query, [group_id]);
  return result[0]; // affectedRows
};

// Find test groups by status
const findByStatus = async (status) => {
  const query = `SELECT * FROM test_group WHERE status = ?`;
  const result = await con.query(query, [status]);

  // Parse test_ids for each group
  return result[0].map((group) => ({
    ...group,
    test_ids: JSON.parse(group.test_ids),
  }));
};

module.exports = {
  findById,
  findAll,
  save,
  update,
  remove,
  findByStatus,
};
