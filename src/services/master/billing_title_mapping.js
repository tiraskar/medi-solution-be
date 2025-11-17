// services/master/billingTitleMappingService.js
const billingMappingModel = require("../../models/billing_title_mappiing");

// Create a new billing mapping
const createBillingMapping = async (data) => {
  try {
    const result = await billingMappingModel.createBillingMapping(data);
    return result;
  } catch (error) {
    throw new Error(error);
  }
};

// Get all billing mappings with optional filters and pagination
const   getAllBillingMappings = async (filters = {}) => {
  try {
    const page = parseInt(filters.page) || 1;
    const limit = parseInt(filters.limit) || 10;
    const offset = (page - 1) * limit;

    const result = await billingMappingModel.findAllBillingMapping({
      branch_id: filters.branch_id || null,
      status: filters.status !== undefined ? filters.status : null,
      limit,
      offset,
    });
    return result;
  } catch (error) {
    throw new Error(error);
  }
};

// Get a billing mapping by ID
const getBillingMappingById = async (id) => {
  try {
    const result = await billingMappingModel.findOneBillingMapping(id);
    return result;
  } catch (error) {
    throw new Error(error);
  }
};

// Update a billing mapping by ID
const updateBillingMapping = async (id, data) => {
  try {
    const result = await billingMappingModel.updateBillingMapping(id, data);
    return result;
  } catch (error) {
    throw new Error(error);
  }
};

// Delete a billing mapping by ID (soft delete)
const deleteBillingMapping = async (id) => {
  try {
    const result = await billingMappingModel.deleteBillingMapping(id);
    return result;
  } catch (error) {
    throw new Error(error);
  }
};

// Get billing mapping by billing title ID
const getBillingMappedByBillingTitle = async (billing_title_id) => {
  try {
    const result = await billingMappingModel.getBillingMappedByBillingTitle(
      billing_title_id
    );
    return result;
  } catch (error) {
    throw new Error(error);
  }
};

module.exports = {
  createBillingMapping,
  getAllBillingMappings,
  getBillingMappingById,
  updateBillingMapping,
  deleteBillingMapping,
  getBillingMappedByBillingTitle,
};
