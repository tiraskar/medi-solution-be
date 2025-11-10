const con = require("../config/database"); // your MySQL connection

// Ledger Groups
const getledgerGrouplist = async () => {
  const [rows] = await con.query(
    `SELECT id AS ledger_group_id, ledger_group_name, formula 
     FROM accounting_ledgergroup 
     WHERE status = 1`
  );
  return rows;
};

const getledgerGroup = async (name) => {
  const [rows] = await con.query(
    `SELECT id 
     FROM accounting_ledgergroup 
     WHERE ledger_group_name = ? AND status = 1`,
    [name]
  );
  return rows[0];
};

// Ledger Subgroups
const getledgerSubGrouplist = async () => {
  const [rows] = await con.query(
    `SELECT id AS ledger_sub_group_id, sub_group_name 
     FROM accounting_ledgersub_group 
     WHERE status = 1`
  );
  return rows;
};

// Ledger Info
const saveLedger = async (ledgerData) => {
  console.log(ledgerData);

  const [result] = await con.query(`INSERT INTO accounting_ledgerinfo SET ?`, [
    ledgerData,
  ]);
  return result;
};

const getallledgerinfo = async () => {
  const [rows] = await con.query(
    `SELECT 
    l.id,
    l.ledgername,
    l.opening_balance,
    l.status,
    l.address,
    l.contact,
    l.opening_balance,
    l.opening_balance_date,
    b.branch_id AS "branch_id",
    b.name AS "branch_name",
    g.id AS "ledgerGroup.id",
    g.ledger_group_name AS "ledger_group_name",
    s.id AS "ledger_sub_group_id",
    s.sub_group_name AS "sub_group_name"
FROM accounting_ledgerinfo AS l
LEFT JOIN branch_info AS b ON l.branch_id = b.branch_id
LEFT JOIN accounting_ledgergroup AS g ON l.master_ledger_group_id = g.id
LEFT JOIN accounting_ledgersub_group AS s ON l.ledger_sub_group_id = s.id
`
  );
  return rows;
};

const getAllLedgerList = async () => {
  const [rows] = await con.query(
    `SELECT id, ledgername 
     FROM accounting_ledgerinfo 
     WHERE status = 1`
  );
  return rows;
};

const getLedgerById = async (ledger_id) => {
  const [rows] = await con.query(
    `SELECT * FROM accounting_ledgerinfo WHERE id = ?`,
    [ledger_id]
  );
  return rows[0];
};

const updateLedger = async (ledger_id, updateData) => {
  const [result] = await con.query(
    `UPDATE accounting_ledgerinfo SET ? WHERE id = ?`,
    [updateData, ledger_id]
  );
  return result;
};

const deleteLedger = async (ledger_id) => {
  const [result] = await con.query(
    `DELETE FROM accounting_ledgerinfo WHERE id = ?`,
    [ledger_id]
  );
  return result;
};

const searchLedgers = async (limit, offset, status, ledgerName, user_id) => {
  try {
    // Ensure limit and offset are numbers
    limit = Number(limit) || 10;
    offset = Number(offset) || 0;

    // Build WHERE clause dynamically
    const whereClauses = [];
    const params = [];

    if (status !== undefined && status !== null) {
      whereClauses.push("l.status = ?");
      params.push(status);
    }

    if (ledgerName) {
      whereClauses.push("l.ledgername LIKE ?");
      params.push(`%${ledgerName}%`);
    }

    if (user_id) {
      whereClauses.push("l.created_by = ?");
      params.push(user_id);
    }

    const whereSQL = whereClauses.length
      ? "WHERE " + whereClauses.join(" AND ")
      : "";

    // 1️⃣ Rows query
    const rowsSQL = `SELECT 
    l.id,
    l.ledgername,
    l.opening_balance,
    l.status,
    l.address,
    l.contact,
    l.opening_balance,
    l.opening_balance_date,
    b.branch_id AS "branch_id",
    b.name AS "branch_name",
    g.id AS "ledgerGroup.id",
    g.ledger_group_name AS "ledger_group_name",
    s.id AS "ledger_sub_group_id",
    s.sub_group_name AS "sub_group_name"
FROM accounting_ledgerinfo AS l
${whereSQL}
LEFT JOIN branch_info AS b ON l.branch_id = b.branch_id
LEFT JOIN accounting_ledgergroup AS g ON l.master_ledger_group_id = g.id
LEFT JOIN accounting_ledgersub_group AS s ON l.ledger_sub_group_id = s.id
`;
    const rowsParams = [...params, limit, offset];

    const [rows] = await con.execute(rowsSQL, rowsParams);

    // 2️⃣ Count query (total rows for pagination)
    const countSQL = `
      SELECT COUNT(*) AS total
      FROM accounting_ledgerinfo l
      ${whereSQL}
    `;
    const [countResult] = await con.execute(countSQL, params);
    const count = countResult[0].total || 0;

    return { rows, count };
  } catch (error) {
    console.error(error);
    throw error;
  }
};

// Ledger Mapping
const saveLedgerMapping = async (mappingData) => {
  const [result] = await con.query(
    `UPDATE accounting_ledger_mapping SET ledger_id = ? WHERE id = ?`,
    [mappingData.ledger_id, mappingData.id]
  );
  return result;
};

const getLedgerMappingPagination = async (limit, offset) => {
  const [rows] = await con.query(
    `SELECT alm.id, alm.label, alm.ledger_id, l.ledgername 
     FROM accounting_ledger_mapping alm
     LEFT JOIN accounting_ledgerinfo l ON alm.ledger_id = l.id
     ORDER BY alm.id ASC
     LIMIT ? OFFSET ?`,
    [parseInt(limit) || 10, parseInt(offset) || 0]
  );
  // console.log(rows);

  return rows;
};

// Active Ledgers
const getActiveLedger = async () => {
  const [rows] = await con.query(
    `SELECT id, ledger_name, group_name 
     FROM accounting_ledger_mapping 
     WHERE status = 1 
     ORDER BY ledger_name ASC`
  );
  return rows;
};

// Ledger by Group
const getAssociatedLedgerId = async (groupName) => {
  const [rows] = await con.query(
    `SELECT alm.ledger_id, alm.label, l.id AS ledgerInfo_id
     FROM accounting_ledger_mapping alm
     LEFT JOIN accounting_ledger_mapping l ON alm.ledger_id = l.id AND l.status = 1
     WHERE alm.label = ?`,
    [groupName]
  );
  return rows[0];
};

// Ledger for Vehicle Registration
const getLedgerForVechileRegistration = async () => {
  const [rows] = await con.query(
    `SELECT id, ledger_group_name 
     FROM accounting_ledgergroup 
     WHERE ledger_group_name = 'Account Payable'`
  );
  return rows[0];
};

// Bank Ledgers
const getBankLedger = async () => {
  const [rows] = await con.query(
    `SELECT id, ledgername 
     FROM accounting_ledgerinfo 
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
  getallledgerinfo,
};
