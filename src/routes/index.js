const authRoutes = require("./auth/authRoutes");
const patientRoutes = require("./patient/patientRoutes");
const doctorRoutes = require("./doctor/doctorRoutes");
const agentRoutes = require("./agent/agentRoutes");
const testRoutes = require("./test/testRoutes");
const testGroupRoutes = require("./testgroup/testGroupRoutes");
const ledgerRoutes = require("./accounting/ledgerRoutes");
const BillingInfoRoutes = require("./master/billing_info");
const BillingTitleMappingInfoRoutes = require("./master/billing_title_mapping");
const invoiceRoutes = require("./master/invoice");

module.exports = {
  authRoutes,
  patientRoutes,
  doctorRoutes,
  agentRoutes,
  testRoutes,
  testGroupRoutes,
  ledgerRoutes,
  BillingTitleMappingInfoRoutes,
  invoiceRoutes,
  BillingInfoRoutes,
};
