const logger = require("../../config/winstonLoggerConfig");
const CustomErrorHandler = require("../../utils/CustomErrorHandler");
const { agentServices } = require("../../services"); // make sure to export it in services/index.js
const asyncHandler = require("../../middlewares/asyncHandler");

// Create a new Agent
const createAgent = asyncHandler(async (req, res, next) => {
  try {
    const AgentData = req.body;

    // If a photo is uploaded via Multer, attach its filename to the data
    // if (req.file) {
    //   AgentData.photo = req.file.filename; // or req.file.path for full path
    // }

    const result = await agentServices.createAgent(AgentData);

    return res.status(201).json({
      status: true,
      message: "Agent created successfully",
      data: result,
    });
  } catch (error) {
    console.error(error);
    return next(error);
  }
});

// Get all Agents
const getAllAgents = asyncHandler(async (req, res, next) => {
  try {
    const Agents = await agentServices.getAllAgents();
    return res.status(200).json({
      status: true,
      data: Agents,
    });
  } catch (error) {
    logger.error(
      `{ Api:${req.url}, Error:${error.message}, stack:${error.stack} }`
    );
    return next(error);
  }
});

// Get Agent by ID
const getAgentById = asyncHandler(async (req, res, next) => {
  try {
    const Agent_id = req.params.id;
    const Agent = await agentServices.getAgentById(Agent_id);
    if (!Agent) {
      return next(CustomErrorHandler.notFound("Agent not found"));
    }
    return res.status(200).json({
      status: true,
      data: Agent,
    });
  } catch (error) {
    logger.error(
      `{ Api:${req.url}, Error:${error.message}, stack:${error.stack} }`
    );
    return next(error);
  }
});

// Update Agent by ID
const updateAgent = asyncHandler(async (req, res, next) => {
  try {
    const Agent_id = req.params.id;
    const updateData = req.body;
    const result = await agentServices.updateAgent(Agent_id, updateData);
    return res.status(200).json({
      status: true,
      message: "Agent updated successfully",
      data: result,
    });
  } catch (error) {
    logger.error(
      `{ Api:${req.url}, Error:${error.message}, stack:${error.stack} }`
    );
    return next(error);
  }
});

// Delete Agent by ID
const deleteAgent = asyncHandler(async (req, res, next) => {
  try {
    const Agent_id = req.params.id;
    const result = await agentServices.deleteAgent(Agent_id);
    return res.status(200).json({
      status: true,
      message: "Agent deleted successfully",
      data: result,
    });
  } catch (error) {
    logger.error(
      `{ Api:${req.url}, Error:${error.message}, stack:${error.stack} }`
    );
    return next(error);
  }
});

module.exports = {
  createAgent,
  getAllAgents,
  getAgentById,
  updateAgent,
  deleteAgent,
};
