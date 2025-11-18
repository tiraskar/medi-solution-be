const authControllers = require("./auth/authControllers");
const patientControllers = require("./patient/patientControllers");
const doctorControllers = require("./doctor/doctorController");
const agentControllers = require("./agent/agentController");
const testControllers = require("./test/testController");
const testGroupControllers = require("./testgroup/testGroupController");
const ledgerControllers = require("./ledger/ledgerController");
const BillingInfo = require("./master/billing_info");
const BillingTitleMappingInfo = require("./master/billing_title_mapping");
const invoiceControllers = require("./master/invoice");

module.exports = {
  authControllers,
  patientControllers,
  doctorControllers,
  agentControllers,
  testControllers,
  testGroupControllers,
  ledgerControllers,
  BillingInfo,
  BillingTitleMappingInfo,
  invoiceControllers,
};
