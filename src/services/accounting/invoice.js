// services/accounting/invoiceServices.js

// const {
//   NotFoundError,
//   ValidationError,
//   DatabaseError,
// } = require("../../utils/error");

const invoiceModel = require("../../models/Invioce"); // your raw SQL model
// const ledgerServices = require("../ledgerServices");
// const { IndexInfo } = require("../master");

const createInvoice = async (invoiceData) => {
  try {
    // Call the model layer to insert invoice
    const invoice = await invoiceModel.createInvoice(invoiceData);
    return invoice;
  } catch (error) {
    throw error;
  }
};

const getInvoices = async (filters) => {
  try {
    return await invoiceModel.getInvoices(filters);
  } catch (error) {
    throw error;
  }
};

const getInvoiceById = async (id) => {
  try {
    return await invoiceModel.getInvoiceById(id);
  } catch (error) {
    throw error;
  }
};

// Example: Update invoice
const updateInvoice = async (id, data) => {
  try {
    return await invoiceModel.updateInvoice(id, data); // write raw SQL in model
  } catch (error) {
    throw error;
  }
};

// Get invoices by vehicle
const getInvoicesByVehicle = async (vehicleId, pagination) => {
  try {
    return await invoiceModel.getInvoicesByVehicle(vehicleId, pagination);
  } catch (error) {
    throw error;
  }
};

// Renewal reminders
const getRenewalReminders = async (days, searchTerm) => {
  try {
    return await invoiceModel.getRenewalReminders(days, searchTerm);
  } catch (error) {
    throw error;
  }
};

// Dashboard statistics
const getDashboardStats = async () => {
  try {
    return await invoiceModel.getDashboardStats();
  } catch (error) {
    throw error;
  }
};

// Vehicle expiry
const getVehicleExpiryDate = async (query) => {
  try {
    return await invoiceModel.getVehicleExpiryDate(query);
  } catch (error) {
    throw error;
  }
};

// Update payment status
const updatePaymentStatus = async (id, body) => {
  try {
    return await invoiceModel.updatePaymentStatus(id, body);
  } catch (error) {
    throw error;
  }
};

// Delete invoice
const deleteInvoice = async (id) => {
  try {
    return await invoiceModel.deleteInvoice(id);
  } catch (error) {
    throw error;
  }
};

module.exports = {
  createInvoice,
  getInvoices,
  getInvoiceById,
  updateInvoice,
  getInvoicesByVehicle,
  getRenewalReminders,
  getDashboardStats,
  getVehicleExpiryDate,
  updatePaymentStatus,
  deleteInvoice,
};
