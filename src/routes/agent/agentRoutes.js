const express = require("express");
const router = express.Router();
const { agentControllers } = require("../../controllers"); // make sure you export it in controllers/index.js
const auth = require("../../middlewares/auth/auth"); // optional auth middleware

// Routes

// Create new agent
router.post("/", agentControllers.createAgent);

// Get all Agents
router.get("/", agentControllers.getAllAgents);

router.get("/search", agentControllers.searchAgents);

// Get Agent by ID
router.get("/:id", agentControllers.getAgentById);

// Update Agent by ID
router.put("/:id", agentControllers.updateAgent);

// Delete Agent by ID
router.delete("/:id", agentControllers.deleteAgent);

module.exports = router;
