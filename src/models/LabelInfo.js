const con = require('../config/database')

const getLabelInfo = async () => {
    const query = `
      SELECT id as label_id, label_name FROM label_info WHERE status=1
    `
    const result = await con.query(query)
    return result[0]
}

module.exports = {
    getLabelInfo
}