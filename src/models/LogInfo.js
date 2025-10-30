const con = require('../config/database')

saveLog = async (obj) => {
    const {
        module_name,
        table_name,
        row_id,
        new_value,
        old_value,
        operation,
        remarks,
        user_id,
        transaction_date
    } = obj
    const query =
        `
       INSERT INTO log_info (module_name,table_name,row_id,new_value,old_value,operation,remarks,user_id,transaction_date) VALUES (?,?,?,?,?,?,?,?,?)
    `
    const result = await con.query(query, [
        module_name,
        table_name,
        row_id,
        JSON.stringify(new_value),
        JSON.stringify(old_value),
        operation,
        remarks,
        user_id,
        transaction_date
    ])
    return result
}

module.exports = {
    saveLog
}