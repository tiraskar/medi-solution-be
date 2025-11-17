const con = require("../config/database");
// const IndexInfo = require("../../../models/master/index_info.model");

// Constants for index codes
const RECEIPT_INDEX_CODE = process.env.RECEIPT_INDEX_CODE || "receipt_no";
// const TRANSACTION_INDEX_CODE = process.env.TRANSACTION_INDEX_CODE || "transaction_id";
const TRANSACTION_INDEX_CODE = process.env.TRANSACTION_INDEX_CODE || "SAI";

const getIndexInfo = async (functionalYearId, indexCode) => {
  try {
    const [rows] = await con.query(
      `
      SELECT
          max_id,
          index_code
      FROM
          index_info
      WHERE
          functional_year_id = ? AND index_code = ?
      LIMIT 1
      `,
      [functionalYearId, indexCode]
    );

    // Return the first record found, or null if nothing is found
    return rows[0] || null;
  } catch (error) {
    console.error(`Error fetching index info for ${indexCode}:`, error);
    throw error;
  }
};

const getReceiptNo = async (functionalYearId) => {
  return await getIndexInfo(functionalYearId, RECEIPT_INDEX_CODE);
};

const getTransactionId = async (functionalYearId) => {
  return await getIndexInfo(functionalYearId, TRANSACTION_INDEX_CODE);
};

module.exports = {
  getReceiptNo,
  getTransactionId,
};
