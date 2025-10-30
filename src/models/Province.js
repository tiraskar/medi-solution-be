const con = require('../config/database')

const getProvince = async () => {
    const query = `SELECT id, province_eng, province_nep FROM province WHERE status=1`
    const result = await con.query(query)
    return result[0]
}

const getDefaultProvince=async()=>{
    const query=`SELECT id FROM province WHERE isDefault=1`
    const result=await con.query(query)
    return result[0]
}

module.exports = {
    getProvince,
    getDefaultProvince
}