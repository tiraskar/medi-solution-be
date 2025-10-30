const con = require('../config/database')

const getCaste = async () => {
    const query = `SELECT caste_eng, caste_nep FROM caste_info WHERE status=1`
    const result = await con.query(query)
    return result[0]
}

module.exports = {
    getCaste
}