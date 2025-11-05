const authRoutes = require("./auth/authRoutes");
const patientRoutes = require("./patient/patientRoutes");
const doctorRoutes = require("./doctor/doctorRoutes");
const agentRoutes = require("./agent/agentRoutes");
const testRoutes = require("./test/testRoutes");
const testGroupRoutes = require("./testgroup/testGroupRoutes");

module.exports = {
  authRoutes,
  patientRoutes,
  doctorRoutes,
  agentRoutes,
  testRoutes,
  testGroupRoutes,
};
