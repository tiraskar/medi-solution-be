const authServices = require("./auth/authServices");
const jwtServices = require("./auth/jwtServices");
const patientServices = require("./patient/patientServices");
const doctorServices = require("./doctor/doctorServices");
const agentServices = require("./agent/agentServices");
const testServices = require("./test/testServices");
const testGroupServices = require("./testGroup/testGroupServices");
const ledgerServices = require("./accounting/ledger");
const economicYearServices = require("./master/economic_year");
const billingInfoService = require("./accounting/billing_info");
const billingTitleMappingService = require("./master/billing_title_mapping");
const invoiceServices = require("./accounting/invoice");


module.exports = {
  authServices,
  jwtServices,
  patientServices,
  doctorServices,
  agentServices,
  testServices,
  testGroupServices,
  ledgerServices,
  invoiceServices,
  billingInfoService,
};
