const logger = require("../../config/winstonLoggerConfig");
const CustomErrorHandler = require("../../utils/CustomErrorHandler");
const { testGroupServices } = require("../../services"); // make sure to export it in services/index.js
const asyncHandler = require("../../middlewares/asyncHandler");

// Create a new testGroup
const createtestGroup = asyncHandler(async (req, res, next) => {
  try {
    const testGroupData = req.body;

    // If a photo is uploaded via Multer, attach its filename to the data
    // if (req.file) {
    //   testGroupData.photo = req.file.filename; // or req.file.path for full path
    // }

    const result = await testGroupServices.createtestGroup(testGroupData);

    return res.status(201).json({
      status: true,
      message: "testGroup created successfully",
      data: result,
    });
  } catch (error) {
    console.error(error);
    return next(error);
  }
});

// Get all testGroups
const getAlltestGroups = asyncHandler(async (req, res, next) => {
  try {
    const testGroups = await testGroupServices.getAlltestGroups();
    return res.status(200).json({
      status: true,
      data: testGroups,
    });
  } catch (error) {
    logger.error(
      `{ Api:${req.url}, Error:${error.message}, stack:${error.stack} }`
    );
    return next(error);
  }
});

// Get testGroup by ID
const gettestGroupById = asyncHandler(async (req, res, next) => {
  try {
    const testGroup_id = req.params.id;
    const testGroup = await testGroupServices.getTestGroupById(testGroup_id);
    if (!testGroup) {
      return next(CustomErrorHandler.notFound("testGroup not found"));
    }
    return res.status(200).json({
      status: true,
      data: testGroup,
    });
  } catch (error) {
    logger.error(
      `{ Api:${req.url}, Error:${error.message}, stack:${error.stack} }`
    );
    return next(error);
  }
});

// Update testGroup by ID
const updatetestGroup = asyncHandler(async (req, res, next) => {
  try {
    const testGroup_id = req.params.id;
    const updateData = req.body;
    const result = await testGroupServices.updateTestGroup(
      testGroup_id,
      updateData
    );
    return res.status(200).json({
      status: true,
      message: "testGroup updated successfully",
      data: result,
    });
  } catch (error) {
    logger.error(
      `{ Api:${req.url}, Error:${error.message}, stack:${error.stack} }`
    );
    return next(error);
  }
});

// Delete testGroup by ID
const deletetestGroup = asyncHandler(async (req, res, next) => {
  try {
    const testGroup_id = req.params.id;
    const result = await testGroupServices.deleteTestGroup(testGroup_id);
    return res.status(200).json({
      status: true,
      message: "testGroup deleted successfully",
      data: result,
    });
  } catch (error) {
    logger.error(
      `{ Api:${req.url}, Error:${error.message}, stack:${error.stack} }`
    );
    return next(error);
  }
});

const getTestGroupsByStatus = async (req, res) => {
  try {
    const status = parseInt(req.params.status);
    const testGroups = await testGroupServices.findTestGroupsByStatus(status);

    if (testGroups.length === 0) {
      return res
        .status(404)
        .json({ message: "No testGroups found for this status" });
    }

    res.json(testGroups);
  } catch (error) {
    console.error("Error fetching testGroups by status:", error);
    res.status(500).json({ message: "Server error" });
  }
};

module.exports = {
  createtestGroup,
  getAlltestGroups,
  gettestGroupById,
  updatetestGroup,
  deletetestGroup,
  getTestGroupsByStatus,
};
