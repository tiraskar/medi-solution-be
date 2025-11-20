const express = require("express");
const router = express.Router();

const auth = require("../../middlewares/auth/auth"); // optional auth middleware
const { ledgerControllers } = require("../../controllers");
// const {
//   saveLedgerValidation,
//   getLedgerPaginationValidation,
//   updateLedgerValidation,
//   saveLedgerMappingValidation,
//   getLedgerMappingPaginationValidation,
// } = require("../../middlewares/validation/accounting/ledger.validation");
// const { preauthorize } = require("../../utils/preAuthorize");

router.route("/getledgergrouplist").get(ledgerControllers.getledgerGrouplist);
router.route("/getledgerinfo").get(ledgerControllers.getledgerinfo);

router
  .route("/getledgersubgrouplist")
  .get(ledgerControllers.getledgerSubGrouplist);

router.route("/saveledger").post(
  // auth,
  // prerize("create_ledger"),
  //   saveLedgerValidation,
  ledgerControllers.saveLedger
);

router.route("/getallledgerinfo").get(ledgerControllers.getallledgerinfo);

router.route("/getledgerpagination").get(
  auth,
  // prerize("view_ledger"),
  //   getLedgerPaginationValidation,
  ledgerControllers.getLedgerPagination
);

router.route("/getallledgerlist").get(
  // prerize("view_ledger"),
  ledgerControllers.getAllLedgerList
);

router.route("/updateledger").put(
  auth,
  // prerize("update_ledger"),
  //   updateLedgerValidation,
  ledgerControllers.updateLedger
);

router.route("/saveledgermapping").put(
  // prerize("update_ledger_mapping"),
  //   saveLedgerMappingValidation,
  ledgerControllers.saveLedgerMapping
);

router.route("/getledgermappingpagination").get(
  // prerize("view_ledger_mapping"),
  //   getLedgerMappingPaginationValidation,
  ledgerControllers.getLedgerMappingPagination
);
router.route("/getactiveledger").get(ledgerControllers.getActiveLedger);
router.route("/getbankledger").get(ledgerControllers.getBankLedger);

module.exports = router;
