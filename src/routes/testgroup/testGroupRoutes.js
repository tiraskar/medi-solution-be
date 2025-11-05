const express = require("express");
const router = express.Router();
const { testGroupControllers } = require("../../controllers"); // make sure you export it in controllers/index.js
const auth = require("../../middlewares/auth/auth"); // optional auth middleware

// Routes

// Create new test
router.post("/", testGroupControllers.createtestGroup);

// Get all tests
router.get("/", testGroupControllers.getAlltestGroups);

// Get test by ID
router.get("/:id", testGroupControllers.gettestGroupById);

// Update test by ID
router.put("/:id", testGroupControllers.updatetestGroup);

// Delete test by ID
router.delete("/:id", testGroupControllers.deletetestGroup);

//select by status
router.get("/status/:status", testGroupControllers.getTestGroupsByStatus);

module.exports = router;
