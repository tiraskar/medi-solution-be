const {
  saveAccountingTransDetail,
  createBillingInfoDetail,
  createBillingInfo,
  getAllBillingInfoDetailsModel,
} = require("../../models/Billing_info");

const creteAccountingTransDetail = async (Data) => {
  try {
    // Call the model layer to insert invoice
    const accountingDetail = await saveAccountingTransDetail(Data);
    return accountingDetail;
  } catch (error) {
    throw error;
  }
};

const createBillingInfoDetails = async (Data) => {
  try {
    // Call the model layer to insert invoice
    const billingInfoDetails = await createBillingInfoDetail(Data);
    return billingInfoDetails;
  } catch (error) {
    throw error;
  }
};

const getAllBillingInfoDetails = async () => {
  try {
    // Call the model layer to insert invoice
    const billingInfoDetails = await getAllBillingInfoDetailsModel();
    return billingInfoDetails;
  } catch (error) {
    throw error;
  }
};

const createBillingInfoService = async (data) => {
  try {
    // Call the model layer to insert billing_info
    const billingInfo = await createBillingInfo(data);
    return billingInfo;
  } catch (error) {
    throw error;
  }
};

module.exports = {
  creteAccountingTransDetail,
  createBillingInfoDetails,
  createBillingInfoService,
  getAllBillingInfoDetails,
};
