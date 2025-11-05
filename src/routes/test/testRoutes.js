const express = require("express");
const router = express.Router();
const { testControllers } = require("../../controllers"); // make sure you export it in controllers/index.js
const auth = require("../../middlewares/auth/auth"); // optional auth middleware

// Routes

// Create new test
router.post("/", testControllers.createtest);

// Get all tests
router.get("/", testControllers.getAlltests);

// Get test by ID
router.get("/:id", testControllers.gettestById);

// Update test by ID
router.put("/:id", testControllers.updatetest);

// Delete test by ID
router.delete("/:id", testControllers.deletetest);

//select by status
router.get("/status/:status", testControllers.getTestsByStatus);

module.exports = router;
