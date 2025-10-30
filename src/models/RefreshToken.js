const con = require('../config/database')

const find = async (refresh_token) => {
    const query = `
     SELECT user_id, refresh_token 
     FROM refresh_tokens 
     WHERE refresh_token=?`
    const result = await con.query(query, [refresh_token])
    return result[0]
}

const save = async (userid, token) => {
    let query = `INSERT INTO refresh_tokens (user_id, refresh_token) VALUES (?,?)`
    let result = await con.query(query, [userid, token])
    return result
}

const update = async (userid, oldRefreshToken, newRefreshToken) => {
    let query = `UPDATE refresh_tokens SET refresh_token=? WHERE user_id=? AND refresh_token=?`
    let result = await con.query(query, [newRefreshToken, userid, oldRefreshToken])
    return result
}

const revokeRefreshToken = async (refresh_token) => {
    let query = `DELETE FROM refresh_tokens WHERE refresh_token=?`
    let result = await con.query(query, refresh_token)
    return result
}

const updateRefreshToken = async (userid, oldRefreshToken, newRefreshToken) => {
    let query = `UPDATE refresh_tokens SET refresh_token=? WHERE user_id=? AND refresh_token=?`
    let result = await con.query(query, [newRefreshToken, userid, oldRefreshToken])
    return result
}

module.exports = {
    find,
    save,
    update,
    revokeRefreshToken,
    updateRefreshToken
}