// const {
//   NotFoundError,
//   ValidationError,
//   DatabaseError,
// } = require("../../utils/error");
const Nepali_Calendar = require("../helpers/nepaliCalendar");
// const TRANSACTION_INDEX_CODE = process.env.TRANSACTION_INDEX_CODE;
// const RECEIPT_NO = process.env.RECEIPT_INDEX_CODE;
const con = require("../config/database"); // should be a raw SQL con (e.g., mysql2/promise)
const { executeTransaction } = require("../config/executeTransaction");
const { createAccountingEntry } = require("./Accounting_Transaction_Detail");
const logger = require("../config/winstonLoggerConfig");
const { DatabaseError } = require("../utils/error");

// Ensure you have imported executeTransaction and any necessary error classes/utilities
// const { executeTransaction } = require('./path/to/transaction-utility');
// const { ValidationError } = require('./path/to/errors');

const createInvoice = async (invoiceData) => {
  return executeTransaction(async (connection) => {
    // 1️⃣ Destructure all necessary variables
    const {
      invoice_number,
      vehicle_id,
      billing_title_id,
      testgroup_id,
      payment_method,
      remarks,
      bill_date_bs,
      receipt_no,
      expiry_date_bs,
      amount,
      status,
      test_id,
      cash_ledger_id,
      sales_ledger_id,
      functional_year_id,
      bank_id,
      branch_id,
      created_by,
      transaction_id,
      vehicle_ledger_id, // used in CREDIT case
    } = invoiceData;

    // console.log(invoiceData);

    const nepaliCalendar = new Nepali_Calendar();
    const invoice_date = nepaliCalendar.BSToADConvert(bill_date_bs);

    const expire_date = nepaliCalendar.BSToADConvert(expiry_date_bs);

    // 3️⃣ Define narration text
    const narration = `Invoice for Vehicle ID: ${vehicle_id || "N/A"}`;

    // 4️⃣ Insert invoice (fixed column name & placeholders)
    const [invoiceResult] = await connection.execute(
      `INSERT INTO invoice 
        (invoice_number, testgroup_id, rate, expiry_date, payment_mode, remarks, invoice_date, invoice_date_bs, expire_date_bs, receipt_no, total_amount, status, test_id)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)`,
      [
        `INV-${Date.now()}`, // id
        testgroup_id || null,
        amount,
        expire_date,
        payment_method.toLowerCase(),
        remarks,
        invoice_date,
        bill_date_bs,
        expiry_date_bs,
        receipt_no,
        amount,
        status,
        test_id,
      ]
    );

    const invoiceId = invoiceResult.insertId;

    // // 5️⃣ Helper to create accounting entries
    const createAccountingEntry = async (
      ledger_id,
      debit,
      credit,
      narrationText
    ) => {
      await connection.execute(
        `INSERT INTO accounting_transaction_detail
          (comes_from, ledger_id, credit, debit, table_id, transaction_id, voucher_date_ad, voucher_date_bs, voucher_number, voucher_type, functional_year_id, branch_id, narration, created_by)
          VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`,
        [
          "SALES ENTRY",
          ledger_id,
          credit,
          debit,
          invoiceId,
          transaction_id.max_id,
          invoice_date,
          bill_date_bs,
          receipt_no,
          "Renew Voucher",
          functional_year_id,
          branch_id,
          narrationText,
          created_by,
        ]
      );
    };

    // 6️⃣ Insert accounting entries based on payment method
    switch (payment_method.toUpperCase()) {
      case "CASH":
        await createAccountingEntry(
          cash_ledger_id,
          amount,
          0.0,
          `Cash Paid By ${narration}`
        );
        await createAccountingEntry(
          sales_ledger_id,
          0.0,
          amount,
          `Cash Paid By ${narration}`
        );
        break;

      case "CREDIT":
        await createAccountingEntry(
          vehicle_ledger_id,
          amount,
          0.0,
          `Credit Sales ${narration}`
        );
        await createAccountingEntry(
          sales_ledger_id,
          0.0,
          amount,
          `Credit Sales ${narration}`
        );
        break;

      case "DIRECT BANK TRANSFER":
        await createAccountingEntry(
          bank_id,
          amount,
          0.0,
          `Direct Bank Transfer Sales ${narration}`
        );
        await createAccountingEntry(
          sales_ledger_id,
          0.0,
          amount,
          `Direct Bank Transfer Invoice ${narration}`
        );
        break;

      default:
        throw new ValidationError("Invalid payment method");
    }

    // 7️⃣ Update index_Info
    await connection.execute(
      "UPDATE index_Info SET max_id = ? WHERE index_code = 'transaction_id' AND functional_year_id = ?",
      [transaction_id, functional_year_id]
    );

    await connection.execute(
      "UPDATE index_Info SET max_id = max_id + 1 WHERE index_code = 'receipt_no' AND functional_year_id = ?",
      [functional_year_id]
    );

    // ✅ executeTransaction will handle commit/rollback automatically
    return { id: invoiceId, invoice_number: `INV-${Date.now()}` };
  });
};

// Fetch invoices with pagination
const getInvoices = async (filters = {}) => {
  try {
    const { page = 1, limit = 10, status, vehicle_id } = filters;
    const offset = (page - 1) * limit;

    let sql = "SELECT * FROM Invoice WHERE 1=1";
    const params = [];
    if (status !== undefined) {
      sql += " AND status = ?";
      params.push(status);
    }
    if (vehicle_id !== undefined) {
      sql += " AND vehicle_id = ?";
      params.push(vehicle_id);
    }
    sql += " ORDER BY invoice_date DESC LIMIT ? OFFSET ?";
    params.push(limit, offset);

    const [rows] = await con.query(sql, params);
    const [countRows] = await con.query(
      "SELECT COUNT(*) as count FROM Invoice WHERE 1=1"
    );
    const count = countRows[0]?.count || 0;

    return { invoices: rows, count };
  } catch (error) {
    // throw new DatabaseError("Error fetching invoices", error);
    console.log(error);
  }
};

// Fetch invoice by ID
const getInvoiceById = async (id) => {
  try {
    const [rows] = await con.execute("SELECT * FROM Invoice WHERE id = ?", [
      id,
    ]);
    if (!rows.length) throw new NotFoundError("Invoice not found");
    return rows[0];
  } catch (error) {}
};

const deleteInvoice = async (id) => {
  const [rows] = await con.query(
    "Update  invoice set status = 0 where id = ?",
    [id]
  );

  // if (!rows.length) logger.error(`{Invoice Delete Failed }`);

  return rows;
};

// Update, delete, get by vehicle, renewal reminders, dashboard stats, etc. can be rewritten similarly using raw SQL queries.

module.exports = {
  createInvoice,
  getInvoices,
  getInvoiceById,
  deleteInvoice,
  // add other functions here after converting them to SQL
};
