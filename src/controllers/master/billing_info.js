const asyncHandler = require("../../middlewares/asyncHandler");
const { billingInfoService } = require("../../services");
const {
  createBillingInfoService,
} = require("../../services/accounting/billing_info");

const creteAccountingTransDetail = asyncHandler(async (req, res, next) => {
  try {
    const {
      comes_from,
      ledger_id,
      credit,
      debit,
      narration,
      particular,
      particular_id,
      table_id,
      transaction_id,
      voucher_date_ad,
      voucher_date_bs,
      voucher_number,
      voucher_type,
      functional_year_id,
      branch_id,
      status,
      created_by,
    } = req.body;

    // Validate Required Fields
    if (!ledger_id) {
      return res.status(400).json({ message: "ledger_id is required" });
    }

    if (!voucher_number) {
      return res.status(400).json({ message: "voucher_number is required" });
    }

    // Insert Into DB (Sequelize Example)
    const data = await billingInfoService.creteAccountingTransDetail({
      comes_from,
      ledger_id,
      credit,
      debit,
      narration,
      particular,
      particular_id,
      table_id,
      transaction_id,
      voucher_date_ad,
      voucher_date_bs,
      voucher_number,
      voucher_type,
      functional_year_id,
      branch_id,
      status,
      created_by,
    });

    return res.status(201).json({
      success: true,
      message: "Accounting transaction detail created successfully",
    });
  } catch (error) {
    next(error);
  }
});

const addBillingInfoDetails = asyncHandler(async (req, res, next) => {
  try {
    const detailsData = req.body;

    console.log(detailsData);

    // Expected body example:
    // {
    //   test_id: 101,
    //   group_ids: [1, 2, 3, 5],
    //   date_bs: '2082-08-02',
    //   date_ad: '2025-11-18',
    //   rate: 500,
    //   discount: 50,
    //   billing_info_id: 10,
    //   voucher_number: 'VN-1001',
    //   transaction_id: 2001,
    //   created_by: 5
    // }

    const result = await billingInfoService.createBillingInfoDetails(
      detailsData
    );

    res.status(201).json({
      success: true,
      message: "Billing info details inserted successfully",
    });
  } catch (error) {
    next(error);
  }
});

const getAllBillingInfoDetails = asyncHandler(async (req, res, next) => {
  try {
    const result = await billingInfoService.getAllBillingInfoDetails();

    res.status(201).json({
      success: true,
      result,
    });
  } catch (error) {
    next(error);
  }
});

const addBillingInfo = asyncHandler(async (req, res, next) => {
  try {
    const {
      total_amount,
      discount,
      transaction_id,
      voucher_number,
      payment_method,
      created_by,
      agent_id,
      doctor_id,
    } = req.body;

    // Create a clean object to send to service
    const billingData = {
      total_amount,
      discount,
      transaction_id,
      voucher_number,
      payment_method,
      created_by,
      agent_id,
      doctor_id,
    };

    const result = await createBillingInfoService(billingData);

    res.status(201).json({
      message: "Billing info created successfully",
      billing_info_id: result.insertId,
    });
  } catch (error) {
    next(error);
  }
});

module.exports = {
  creteAccountingTransDetail,
  addBillingInfoDetails,
  addBillingInfo,
  getAllBillingInfoDetails,
};
