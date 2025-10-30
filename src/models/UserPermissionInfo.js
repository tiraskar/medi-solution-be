const con = require('../config/database')

const getUserModuleDetails = async (user_id) => {
  const query =
    `
      SELECT id,permission,status,created_by FROM user_permission_info WHERE user_id=? AND status=1
    `
  const result = await con.query(query, [user_id])
  return result[0]
}

const createUserPermission = async (obj) => {
  const { user_id, permission, created_by } = obj
  const query =
    `
  INSERT INTO user_permission_info (user_id,permission,created_by)
  VALUES (?,?,?)
  `
  const result = await con.query(query, [user_id, JSON.stringify(permission), created_by])
  return result
}

const updateUserPermission = async (obj) => {
  const { user_id, permission } = obj
  const query =
    `
    UPDATE user_permission_info SET permission=? WHERE user_id=?
  `
  const result = await con.query(query, [
    JSON.stringify(permission),
    user_id
  ])
  return result
}

module.exports = {
  getUserModuleDetails,
  createUserPermission,
  updateUserPermission
}