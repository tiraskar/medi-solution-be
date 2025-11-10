const db = require("../../config/db"); // MySQL connection

// Ledger Groups
const getledgerGrouplist = async () => {
  const [rows] = await db.query(
    `SELECT id AS ledger_group_id, ledger_group_name, formula 
     FROM accounting_ledger_groups 
     WHERE status = 1`
  );
  return rows;
};

const getledgerGroup = async (name) => {
  const [rows] = await db.query(
    `SELECT id 
     FROM accounting_ledger_groups 
     WHERE ledger_group_name = ? AND status = 1`,
    [name]
  );
  return rows[0];
};

// Ledger Subgroups
const getledgerSubGrouplist = async () => {
  const [rows] = await db.query(
    `SELECT id AS ledger_sub_group_id, sub_group_name 
     FROM accounting_ledger_subgroups 
     WHERE status = 1`
  );
  return rows;
};

// Ledger Info
const saveLedger = async (ledgerData) => {
  const [result] = await db.query(`INSERT INTO accounting_ledgers SET ?`, [
    ledgerData,
  ]);
  return result;
};

const getAllLedgerList = async () => {
  const [rows] = await db.query(
    `SELECT id, ledgername 
     FROM accounting_ledgers 
     WHERE status = 1`
  );
  return rows;
};

const getLedgerById = async (ledger_id) => {
  const [rows] = await db.query(
    `SELECT * FROM accounting_ledgers WHERE id = ?`,
    [ledger_id]
  );
  return rows[0];
};

const updateLedger = async (ledger_id, updateData) => {
  const [result] = await db.query(
    `UPDATE accounting_ledgers SET ? WHERE id = ?`,
    [updateData, ledger_id]
  );
  return result;
};

const deleteLedger = async (ledger_id) => {
  const [result] = await db.query(
    `DELETE FROM accounting_ledgers WHERE id = ?`,
    [ledger_id]
  );
  return result;
};

const searchLedgers = async (keyword) => {
  const [rows] = await db.query(
    `SELECT * FROM accounting_ledgers WHERE ledgername LIKE ?`,
    [`%${keyword}%`]
  );
  return rows;
};

// Ledger Mapping
const saveLedgerMapping = async (mappingData) => {
  const [result] = await db.query(
    `UPDATE accounting_ledger_mappings SET ledger_id = ? WHERE id = ?`,
    [mappingData.ledger_id, mappingData.id]
  );
  return result;
};

const getLedgerMappingPagination = async (limit, offset) => {
  const [rows] = await db.query(
    `SELECT alm.id, alm.label, alm.ledger_id, l.ledgername 
     FROM accounting_ledger_mappings alm
     LEFT JOIN accounting_ledgers l ON alm.ledger_id = l.id
     ORDER BY alm.id ASC
     LIMIT ? OFFSET ?`,
    [parseInt(limit) || 10, parseInt(offset) || 0]
  );
  return rows;
};

// Active Ledgers
const getActiveLedger = async () => {
  const [rows] = await db.query(
    `SELECT id, ledger_name, group_name 
     FROM accounting_ledger_mappings 
     WHERE status = 1 
     ORDER BY ledger_name ASC`
  );
  return rows;
};

// Ledger by Group
const getAssociatedLedgerId = async (groupName) => {
  const [rows] = await db.query(
    `SELECT alm.ledger_id, alm.label, l.id AS ledgerInfo_id
     FROM accounting_ledger_mappings alm
     LEFT JOIN accounting_ledgers l ON alm.ledger_id = l.id AND l.status = 1
     WHERE alm.label = ?`,
    [groupName]
  );
  return rows[0];
};

// Ledger for Vehicle Registration
const getLedgerForVechileRegistration = async () => {
  const [rows] = await db.query(
    `SELECT id, ledger_group_name 
     FROM accounting_ledger_groups 
     WHERE ledger_group_name = 'Account Payable'`
  );
  return rows[0];
};

// Bank Ledgers
const getBankLedger = async () => {
  const [rows] = await db.query(
    `SELECT id, ledgername 
     FROM accounting_ledgers 
     WHERE master_ledger_group_id = 3 AND status = 1`
  );
  return rows;
};

module.exports = {
  getledgerGrouplist,
  getledgerGroup,
  getledgerSubGrouplist,
  saveLedger,
  getAllLedgerList,
  getLedgerById,
  updateLedger,
  deleteLedger,
  searchLedgers,
  saveLedgerMapping,
  getLedgerMappingPagination,
  getActiveLedger,
  getAssociatedLedgerId,
  getLedgerForVechileRegistration,
  getBankLedger,
};
