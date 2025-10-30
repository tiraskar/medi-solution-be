const con = require('../config/database')


const getLocalLevelType = async () => {
    const query = `SELECT id,type_eng,type_nep FROM local_level_type WHERE status=1`
    const result = await con.query(query)
    return result[0]
}

module.exports = {
    getLocalLevelType
}