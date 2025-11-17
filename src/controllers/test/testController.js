const logger = require("../../config/winstonLoggerConfig");
const CustomErrorHandler = require("../../utils/CustomErrorHandler");
const { testServices } = require("../../services"); // make sure to export it in services/index.js
const asyncHandler = require("../../middlewares/asyncHandler");

// Create a new test
const createtest = asyncHandler(async (req, res, next) => {
  try {
    const testData = req.body;

    // If a photo is uploaded via Multer, attach its filename to the data
    // if (req.file) {
    //   testData.photo = req.file.filename; // or req.file.path for full path
    // }

    const result = await testServices.createtest(testData);

    return res.status(201).json({
      status: true,
      message: "test created successfully",
      data: result,
    });
  } catch (error) {
    console.error(error);
    return next(error);
  }
});

// Get all tests
const getAlltests = asyncHandler(async (req, res, next) => {
  try {
    const page = req.query.page ? parseInt(req.query.page, 10) : undefined;
    const limit = req.query.limit ? parseInt(req.query.limit, 10) : undefined;
    const keyword = req.query.keyword
      ? req.query.keyword.toString().trim()
      : undefined;

    const options = {
      page,
      limit,
      keyword,
    };

    const tests = await testServices.getAlltests(options);

    return res.status(200).json({
      status: true,
      data: tests?.result,
      total: tests?.total,
    });
  } catch (error) {
    logger.error(
      `{ Api:${req.url}, Error:${error.message}, stack:${error.stack} }`
    );
    return next(error);
  }
});

// Get test by ID
const gettestById = asyncHandler(async (req, res, next) => {
  try {
    const test_id = req.params.id;
    const test = await testServices.getTestById(test_id);
    if (!test) {
      return next(CustomErrorHandler.notFound("test not found"));
    }
    return res.status(200).json({
      status: true,
      data: test,
    });
  } catch (error) {
    logger.error(
      `{ Api:${req.url}, Error:${error.message}, stack:${error.stack} }`
    );
    return next(error);
  }
});

// Update test by ID
const updatetest = asyncHandler(async (req, res, next) => {
  try {
    const test_id = req.params.id;
    const updateData = req.body;
    const result = await testServices.updateTest(test_id, updateData);
    return res.status(200).json({
      status: true,
      message: "test updated successfully",
      data: result,
    });
  } catch (error) {
    logger.error(
      `{ Api:${req.url}, Error:${error.message}, stack:${error.stack} }`
    );
    return next(error);
  }
});

// Delete test by ID
const deletetest = asyncHandler(async (req, res, next) => {
  try {
    const test_id = req.params.id;
    const result = await testServices.deleteTest(test_id);
    return res.status(200).json({
      status: true,
      message: "test deleted successfully",
      data: result,
    });
  } catch (error) {
    logger.error(
      `{ Api:${req.url}, Error:${error.message}, stack:${error.stack} }`
    );
    return next(error);
  }
});

const getTestsByStatus = async (req, res) => {
  try {
    const status = parseInt(req.params.status);
    const tests = await testServices.findTestsByStatus(status);

    if (tests.length === 0) {
      return res
        .status(404)
        .json({ message: "No tests found for this status" });
    }

    res.json(tests);
  } catch (error) {
    console.error("Error fetching tests by status:", error);
    res.status(500).json({ message: "Server error" });
  }
};

module.exports = {
  createtest,
  getAlltests,
  gettestById,
  updatetest,
  deletetest,
  getTestsByStatus,
};
