const con = require("../config/database"); // your MySQL connection

// Find agent by ID
const findById = async (agent_id) => {
  const query = `SELECT * FROM agent WHERE agent_id = ?`;
  const result = await con.query(query, [agent_id]);
  return result[0][0]; // single agent object
};

// Get all agents
const findAll = async () => {
  const query = `SELECT * FROM agent`;
  const result = await con.query(query);
  return result[0]; // array of agents
};

// Save new agent
const save = async (agentData) => {
  const query = `
    INSERT INTO agent 
      (agent_name, parameters, low_range, top_range, rate, gender, email, mobile, address, qualification, bio, created_by)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
  `;
  const values = [
    agentData.agent_name,
    agentData.parameters,
    agentData.low_range,
    agentData.top_range,
    agentData.rate,
    agentData.gender,
    agentData.email,
    agentData.mobile,
    agentData.address,
    agentData.qualification,
    agentData.bio,
    agentData.created_by,
  ];
  const result = await con.query(query, values);
  return result[0]; // contains insertId
};

// Update agent by ID
const update = async (agent_id, updateData) => {
  const query = `
    UPDATE agent
    SET agent_name = ?, parameters = ?, low_range = ?, top_range = ?, rate = ?,
        gender = ?, email = ?, mobile = ?, address = ?, qualification = ?, bio = ?, created_by = ?
    WHERE agent_id = ?
  `;
  const values = [
    updateData.agent_name,
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
    agent_id,
  ];
  const result = await con.query(query, values);
  return result[0]; // contains affectedRows
};

// Delete agent by ID
const remove = async (agent_id) => {
  const query = `DELETE FROM agent WHERE agent_id = ?`;
  const result = await con.query(query, [agent_id]);
  return result[0]; // contains affectedRows
};

module.exports = {
  findById,
  findAll,
  save,
  update,
  remove,
};
