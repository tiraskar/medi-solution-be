const authServices = require("./auth/authServices");
const jwtServices = require("./auth/jwtServices");
const patientServices = require("./patient/patientServices");
const doctorServices = require("./doctor/doctorServices");
const agentServices = require("./agent/agentServices");
const testServices = require("./test/testServices");
const testGroupServices = require("./testGroup/testGroupServices");

module.exports = {
  authServices,
  jwtServices,
  patientServices,
  doctorServices,
  agentServices,
  testServices,
  testGroupServices,
};
