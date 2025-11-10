const logger = require("../../config/winstonLoggerConfig");
const CustomErrorHandler = require("../../utils/CustomErrorHandler");
const { doctorServices } = require("../../services"); // make sure to export it in services/index.js
const asyncHandler = require("../../middlewares/asyncHandler");
const { log } = require("winston");

// Create a new doctor
const createDoctor = asyncHandler(async (req, res, next) => {
  try {
    const doctorData = req.body;

    // console.log(req.file);

    // If a photo is uploaded via Multer, attach its filename to the data
    if (req.file) {
      doctorData.photo = req.file.path; // or req.file.path for full path
    }

    const result = await doctorServices.createDoctor(doctorData);

    return res.status(201).json({
      status: true,
      message: "Doctor created successfully",
      data: result,
    });
  } catch (error) {
    console.error(error);
    logger.warn(
      `{ Api:${req.url}, Error:${error.message}, stack:${error.stack} }`
    );
    return next(error);
  }
});

// Get all doctors
const getAllDoctors = asyncHandler(async (req, res, next) => {
  try {
    const doctors = await doctorServices.getAllDoctors();
    return res.status(200).json({
      status: true,
      data: doctors,
    });
  } catch (error) {
    logger.error(
      `{ Api:${req.url}, Error:${error.message}, stack:${error.stack} }`
    );
    return next(error);
  }
});

// Get doctor by ID
const getDoctorById = asyncHandler(async (req, res, next) => {
  try {
    const doctor_id = req.params.id;
    const doctor = await doctorServices.getDoctorById(doctor_id);
    if (!doctor) {
      return next(CustomErrorHandler.notFound("Doctor not found"));
    }
    return res.status(200).json({
      status: true,
      data: doctor,
    });
  } catch (error) {
    logger.error(
      `{ Api:${req.url}, Error:${error.message}, stack:${error.stack} }`
    );
    return next(error);
  }
});

// Update doctor by ID
const updateDoctor = asyncHandler(async (req, res, next) => {
  try {
    const updateData = req.body;

    if (req.file) {
      updateData.photo = req.file.path; // or req.file.path for full path
    }

    const doctor_id = req.params.id;
    // console.log(updateData.photo);

    const result = await doctorServices.updateDoctor(doctor_id, updateData);
    return res.status(200).json({
      status: true,
      message: "Doctor updated successfully",
      data: result,
    });
  } catch (error) {
    logger.error(
      `{ Api:${req.url}, Error:${error.message}, stack:${error.stack} }`
    );
    return next(error);
  }
});

// Delete doctor by ID
const deleteDoctor = asyncHandler(async (req, res, next) => {
  try {
    const doctor_id = req.params.id;
    const result = await doctorServices.deleteDoctor(doctor_id);
    return res.status(200).json({
      status: true,
      message: "Doctor deleted successfully",
      data: result,
    });
  } catch (error) {
    logger.error(
      `{ Api:${req.url}, Error:${error.message}, stack:${error.stack} }`
    );
    return next(error);
  }
});

const searchDoctors = asyncHandler(async (req, res, next) => {
  let { keyword = "", limit, page } = req.query;

  // Validate required fields
  if (!limit || !page) {
    return next(new Error("Limit and page are required"));
  }

  // Convert to integers
  limit = parseInt(limit, 10);
  page = parseInt(page, 10);

  // Validate positive integers
  if (isNaN(limit) || limit <= 0 || isNaN(page) || page <= 0) {
    return next(new Error("Limit and page must be positive integers"));
  }

  // Optional keyword validation
  if (keyword && typeof keyword !== "string") {
    return next(new Error("Keyword must be a string"));
  }

  // Call service
  const doctors = await doctorServices.searchDoctors({ keyword, limit, page });

  res.status(200).json({
    status: true,
    data: doctors,
  });
});

module.exports = {
  createDoctor,
  getAllDoctors,
  getDoctorById,
  updateDoctor,
  deleteDoctor,
  searchDoctors,
};
