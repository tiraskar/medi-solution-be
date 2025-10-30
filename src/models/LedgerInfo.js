const con = require('../config/database')

const getLedgerForPatientAdmission = async () => {

  const query = `
      SELECT ledger_group_name, id FROM accounting_ledgergroup WHERE ledger_group_name = 'Account Payable'
    `
  const ledgerInfo = await con.query(query)

  return ledgerInfo[0]

}

const getLedgerIdForAdmittedPatient = async (patient_admission_no) => {

  const query = `
    SELECT 
      ledger_id
    FROM 
      patient_admission_info 
    WHERE 
      id = ? 
  `
  const result = await con.query(query, [patient_admission_no])

  return result[0][0].ledger_id
}

const getPartyLedgerId = async (party_id) => {
  const query = `
    SELECT
      ledger_id
    FROM
      party_info
    WHERE
      party_id = ? 
  `
  const result = await con.query(query, [party_id])
  return result[0][0].ledger_id
}

module.exports = {
  getLedgerForPatientAdmission,
  getLedgerIdForAdmittedPatient,
  getPartyLedgerId
}

