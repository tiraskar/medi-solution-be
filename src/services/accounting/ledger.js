const { ledgerService } = require("../../models");

// Create a new Ledger
const createLedger = async (ledgerData) => {
  try {
    const result = await ledgerService.saveLedger(ledgerData);
    return result;
  } catch (error) {
    throw new Error(error);
  }
};

const getallledgerinfo = async () => {
  try {
    const ledgers = await ledgerService.getallledgerinfo();
    return ledgers;
  } catch (error) {
    throw new Error(error);
  }
};

// Get all Ledgers
const getAllLedgers = async () => {
  try {
    const ledgers = await ledgerService.getAllLedgerList();
    return ledgers;
  } catch (error) {
    throw new Error(error);
  }
};

// Get Ledger by ID
const getLedgerById = async (ledger_id) => {
  try {
    const ledger = await ledgerService.getLedgerById(ledger_id);
    return ledger;
  } catch (error) {
    throw new Error(error);
  }
};

// Update Ledger by ID
const updateLedger = async (jsonObject, updateData) => {
  const { ledger_id, ...rest } = jsonObject;
  try {
    const result = await ledgerService.updateLedger(ledger_id, rest);
    return result;
  } catch (error) {
    throw new Error(error);
  }
};

// Delete Ledger by ID
const deleteLedger = async (ledger_id) => {
  try {
    const result = await ledgerService.deleteLedger(ledger_id);
    return result;
  } catch (error) {
    throw new Error(error);
  }
};

// Search Ledgers
const searchLedgers = async (keyword) => {
  try {
    const ledgers = await ledgerService.searchLedgers(keyword);
    return ledgers;
  } catch (error) {
    throw new Error(error);
  }
};

// Get Ledger Groups
const getLedgerGroups = async () => {
  try {
    const groups = await ledgerService.getledgerGrouplist();
    return groups;
  } catch (error) {
    throw new Error(error);
  }
};

// Get Ledger Group by Name
const getLedgerGroupByName = async (name) => {
  try {
    const group = await ledgerService.getledgerGroup(name);
    return group;
  } catch (error) {
    throw new Error(error);
  }
};

// Get Ledger SubGroups
const getLedgerSubGroups = async () => {
  try {
    const subgroups = await ledgerService.getledgerSubGrouplist();
    return subgroups;
  } catch (error) {
    throw new Error(error);
  }
};

// Save Ledger Mapping
const saveLedgerMapping = async (mappingData) => {
  try {
    const result = await ledgerService.saveLedgerMapping(mappingData);
    return result;
  } catch (error) {
    throw new Error(error);
  }
};

// Get Ledger Mapping Pagination
const getLedgerMappingPagination = async (limit, offset) => {
  try {
    const rows = await ledgerService.getLedgerMappingPagination(limit, offset);
    return rows;
  } catch (error) {
    throw new Error(error);
  }
};

// Get Active Ledgers
const getActiveLedgers = async () => {
  try {
    const ledgers = await ledgerService.getActiveLedger();
    return ledgers;
  } catch (error) {
    throw new Error(error);
  }
};

// Get Ledger by Group Name
const getLedgerByGroupName = async (groupName) => {
  try {
    const ledger = await ledgerService.getAssociatedLedgerId(groupName);
    return ledger;
  } catch (error) {
    throw new Error(error);
  }
};

// Get Ledger for Vehicle Registration
const getLedgerForVehicleRegistration = async () => {
  try {
    const ledger = await ledgerService.getLedgerForVechileRegistration();
    return ledger;
  } catch (error) {
    throw new Error(error);
  }
};

// Get Bank Ledgers
const getBankLedgers = async () => {
  try {
    const ledgers = await ledgerService.getBankLedger();
    return ledgers;
  } catch (error) {
    throw new Error(error);
  }
};

module.exports = {
  createLedger,
  getAllLedgers,
  getLedgerById,
  updateLedger,
  deleteLedger,
  searchLedgers,
  getLedgerGroups,
  getLedgerGroupByName,
  getLedgerSubGroups,
  saveLedgerMapping,
  getLedgerMappingPagination,
  getActiveLedgers,
  getLedgerByGroupName,
  getLedgerForVehicleRegistration,
  getBankLedgers,
  getallledgerinfo,
};
