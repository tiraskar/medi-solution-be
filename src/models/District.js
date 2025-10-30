const con = require('../config/database')


const getDistrict = async (province_id) => {
    const query = `SELECT id,district_eng,district_nep FROM district WHERE status=1 AND province_id=?`
    const result = await con.query(query, [province_id])
    return result[0]
}

const getDefaultDistrict = async (province_id) => {
    const query = `SELECT id FROM district WHERE isDefault=1 and province_id=?`
    const result = await con.query(query, [province_id])
    return result[0]
}

module.exports = {
    getDistrict,
    getDefaultDistrict
}