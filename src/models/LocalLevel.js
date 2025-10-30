const con = require('../config/database')


const getLocalLevel = async (district_id) => {
    const query = `
    SELECT 
       l.id,
       concat(l.local_level_name_eng,' ',lt.type_eng) AS local_level_eng,
       concat(l.local_level_name_nep,' ',lt.type_nep) AS local_level_nep,
       l.total_wards
    FROM 
    local_level AS l
    LEFT JOIN local_level_type AS lt
    ON l.local_level_type_id=lt.id
    WHERE l.district_id=?;
    `
    const result = await con.query(query, [district_id])
    return result[0]
}

module.exports = {
    getLocalLevel
}