const authControllers = require("./auth/authControllers");
const patientControllers = require("./patient/patientControllers");
const doctorControllers = require("./doctor/doctorController");
const agentControllers = require("./agent/agentController");
const testControllers = require("./test/testController");
const testGroupControllers = require("./testgroup/testGroupController");
const ledgerControllers = require("./ledger/ledgerController");

module.exports = {
  authControllers,
  patientControllers,
  doctorControllers,
  agentControllers,
  testControllers,
  testGroupControllers,
  ledgerControllers,
};
