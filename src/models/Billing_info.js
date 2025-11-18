const con = require("../config/database");
const saveAccountingTransDetail = async (data) => {
  try {
    const [result] = await con.query(
      `INSERT INTO accounting_transaction_detail SET ?`,
      [data]
    );
    return result;
  } catch (error) {
    throw error;
  }
};

const createBillingInfoDetail = async (detailsData) => {
  try {
    const results = [];

    // Loop through the array of tests
    for (const test of detailsData.tests_billed) {
      const data = {
        test_id: test.test_id,
        group_id: detailsData.groups_used[0].group_id, // take first group_id
        date_bs: detailsData.date_bs,
        date_ad: detailsData.date_ad,
        rate: test.rate, // rate comes from each test
        discount: detailsData.discount_amount || 0,
        billing_info_id: detailsData.billing_info_id,
        voucher_number: detailsData.voucher_number,

        transaction_id: detailsData.transaction_id,
        status: detailsData.status || 1,
        created_by: detailsData.created_by,
      };

      const [result] = await con.query(
        `INSERT INTO billing_info_details SET ?`,
        [data]
      );

      results.push(result);
    }

    return results;
  } catch (error) {
    throw error;
  }
};

const getAllBillingInfoDetailsModel = async () => {
  try {
    const [result] = await con.query(`Select *from  billing_info_details`);

    return result;
  } catch (error) {
    throw error;
  }
};

const createBillingInfo = async (data) => {
  try {
    // Insert parent row
    const [result] = await con.query(`INSERT INTO billing_infos SET ?`, [data]);
    return result; // contains insertId
  } catch (error) {
    throw error;
  }
};

module.exports = {
  saveAccountingTransDetail,
  createBillingInfoDetail,
  createBillingInfo,
  getAllBillingInfoDetailsModel,
};
