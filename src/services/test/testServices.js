const { Test } = require("../../models"); // the model we just created

// Create a new Test
const createtest = async (TestData) => {
  try {
    const result = await Test.save(TestData);
    return result;
  } catch (error) {
    throw new Error(error);
  }
};

// Get all Tests
const getAlltests = async () => {
  try {
    const Tests = await Test.findAll();
    return Tests;
  } catch (error) {
    throw new Error(error);
  }
};

// Get a Test by ID
const getTestById = async (Test_id) => {
  try {
    const Tests = await Test.findById(Test_id);
    return Tests;
  } catch (error) {
    throw new Error(error);
  }
};

// Update a Test by ID
const updateTest = async (Test_id, updateData) => {
  try {
    const result = await Test.update(Test_id, updateData);
    return result;
  } catch (error) {
    throw new Error(error);
  }
};

// Delete a Test by ID
const deleteTest = async (Test_id) => {
  try {
    const result = await Test.remove(Test_id);
    return result;
  } catch (error) {
    throw new Error(error);
  }
};

const findTestsByStatus = async (Test_id) => {
  try {
    const Tests = await Test.findByStatus(Test_id);
    return Tests;
  } catch (error) {
    throw new Error(error);
  }
};

module.exports = {
  createtest,
  getAlltests,
  getTestById,
  updateTest,
  deleteTest,
  findTestsByStatus,
};
