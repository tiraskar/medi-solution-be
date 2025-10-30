const con = require('./database')

const executeTransaction = async (callback) => {
    const connection = await con.getConnection()
    try {
        await connection.beginTransaction()
        await callback(connection)
        await connection.commit()
    } catch (err) {
        await connection.rollback()
        throw new Error(err)
    } finally {
        connection.release()
    }
}


module.exports = {
    executeTransaction
}