// routes/billingTitleInfo.routes.js
const express = require("express");
const { BillingInfo } = require("../../controllers");
const router = express.Router();

router.post(
  "/createacoountingtransdetail",
  BillingInfo.creteAccountingTransDetail
);

router.post("/addBillingInfoDetails", BillingInfo.addBillingInfoDetails);
router.get("/getAllBillInfoDetails", BillingInfo.getAllBillingInfoDetails);
router.post("/addBillingInfo", BillingInfo.addBillingInfo);

module.exports = router;
