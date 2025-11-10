const { Agent } = require("../../models"); // the model we just created

// Create a new Agent
const createAgent = async (AgentData) => {
  try {
    const result = await Agent.save(AgentData);
    return result;
  } catch (error) {
    throw new Error(error);
  }
};

// Get all Agents
const getAllAgents = async () => {
  try {
    const Agents = await Agent.findAll();
    return Agents;
  } catch (error) {
    throw new Error(error);
  }
};

// Get a Agent by ID
const getAgentById = async (Agent_id) => {
  try {
    const Agents = await Agent.findById(Agent_id);
    return Agents;
  } catch (error) {
    throw new Error(error);
  }
};

// Update a Agent by ID
const updateAgent = async (Agent_id, updateData) => {
  try {
    const result = await Agent.update(Agent_id, updateData);
    return result;
  } catch (error) {
    throw new Error(error);
  }
};

// Delete a Agent by ID
const deleteAgent = async (Agent_id) => {
  try {
    const result = await Agent.remove(Agent_id);
    return result;
  } catch (error) {
    throw new Error(error);
  }
};

const searchAgents = async (data) => {
  return await Agent.searchAgents(data);
};

module.exports = {
  createAgent,
  getAllAgents,
  getAgentById,
  updateAgent,
  deleteAgent,
  searchAgents,
};
