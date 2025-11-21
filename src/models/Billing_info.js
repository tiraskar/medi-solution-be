const con = require("../config/database");
const { executeTransaction } = require("../config/executeTransaction");

const createFullBilling = async (detailsData) => {
  return executeTransaction(async (connection) => {
    // ===== 1️⃣ Insert parent billing info =====
    const billingInfoRow = {
      total_amount: detailsData.total_amount,
      discount: detailsData.discount_amount || 0,
      transaction_id: detailsData.transaction_id,
      voucher_number: detailsData.voucher_number,
      payment_method: detailsData.payment_method || "CASH",
      created_by: detailsData.created_by,
      agent_id: detailsData.agent_id || null,
      doctor_id: detailsData.doctor_id || null,
    };

    const [billingInfoResult] = await connection.query(
      `INSERT INTO billing_infos SET ?`,
      [billingInfoRow]
    );

    const billing_info_id = billingInfoResult.insertId;

    // ===== 2️⃣ Insert billing details =====
    const billingDetailsResults = [];
    for (const test of detailsData.tests_billed) {
      const row = {
        billing_info_id,
        test_id: test.test_id,
        group_id: detailsData.groups_used[0].group_id,
        date_bs: detailsData.date_bs || null,
        date_ad: detailsData.date_ad || null,
        rate: test.rate,
        discount: detailsData.discount_amount || 0,
        voucher_number: detailsData.voucher_number,
        transaction_id: detailsData.transaction_id,
        status: detailsData.status || 1,
        created_by: detailsData.created_by,
      };

      const [res] = await connection.query(
        `INSERT INTO billing_info_details SET ?`,
        [row]
      );

      billingDetailsResults.push(res);
    }

    // ===== 3️⃣ Insert accounting transaction =====
    const accData = {
      ledger_id: detailsData.ledger_id,
      debit: detailsData.debit || 0,
      credit: detailsData.credit || 0,
      table_id: billing_info_id,
      transaction_id: detailsData.transaction_id,
      voucher_number: detailsData.voucher_number,
      voucher_date_ad: detailsData.date_ad || null,
      voucher_date_bs: detailsData.date_bs || null,
      voucher_type: "Billing Voucher",
      branch_id: detailsData.branch_id || null,
      functional_year_id: detailsData.functional_year_id || null,
      created_by: detailsData.created_by,
      narration: `Billing entry for voucher ${detailsData.voucher_number}`,
      comes_from: "BILLING ENTRY",
    };

    const [accResult] = await connection.query(
      `INSERT INTO accounting_transaction_detail SET ?`,
      [accData]
    );

    // ===== 4️⃣ Return combined result =====
    return {
      billing_info_id,
      billing_details: billingDetailsResults,
      accounting_entry: accResult,
    };
  });
};

const getAllBillingInfoDetailsModel = async () => {
  try {
    const [result] = await con.query(`SELECT * FROM billing_info_details`);
    return result;
  } catch (error) {
    throw error;
  }
};

module.exports = { createFullBilling, getAllBillingInfoDetailsModel };
