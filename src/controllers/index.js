const authControllers = require("./auth/authControllers");
const patientControllers = require("./patient/patientControllers");
const doctorControllers = require("./doctor/doctorController");
const agentControllers = require("./agent/agentController");
const testControllers = require("./test/testController");
const testGroupControllers = require("./testgroup/testGroupController");

module.exports = {
  authControllers,
  patientControllers,
  doctorControllers,
  agentControllers,
  testControllers,
  testGroupControllers,
};
