const con = require("../config/database"); // your MySQL connection

// Save a new ledger
const saveLedger = async (ledgerData) => {
  const [result] = await con.query(`INSERT INTO accounting_ledgers SET ?`, [
    ledgerData,
  ]);
  return result;
};

// Get all ledgers
const findAll = async () => {
  const [rows] = await con.query(
    `SELECT * FROM accounting_ledgers WHERE status = 1`
  );
  return rows;
};

// Get ledger by ID
const findById = async (ledger_id) => {
  const [rows] = await con.query(
    `SELECT * FROM accounting_ledgers WHERE id = ?`,
    [ledger_id]
  );
  return rows[0];
};

// Update ledger by ID
const update = async (ledger_id, updateData) => {
  const [result] = await con.query(
    `UPDATE accounting_ledgers SET ? WHERE id = ?`,
    [updateData, ledger_id]
  );
  return result;
};

// Delete ledger by ID
const remove = async (ledger_id) => {
  const [result] = await con.query(
    `DELETE FROM accounting_ledgers WHERE id = ?`,
    [ledger_id]
  );
  return result;
};

// Search ledgers by name
const searchLedgers = async (keyword) => {
  const [rows] = await con.query(
    `SELECT * FROM accounting_ledgers WHERE ledgername LIKE ?`,
    [`%${keyword}%`]
  );
  return rows;
};

// Export all functions
module.exports = {
  saveLedger,
  findAll,
  findById,
  update,
  remove,
  searchLedgers,
};
