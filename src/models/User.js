const con = require("../config/database");
const { executeTransaction } = require("../config/executeTransaction");

const findByUsername = async (username) => {
  const query = `
    SELECT user_id, username, password, name, user_type
    FROM user 
    WHERE username=? AND status=1
    `;
  const result = await con.query(query, [username]);
  return result[0];
};

const getUserList = async () => {
  const query = `SELECT user_id,username,user_type FROM user WHERE status=1`;
  const result = await con.query(query);
  return result[0];
};

const createUser = async (userDetails) => {
  let query, result;
  const {
    name,
    address,
    contact,
    username,
    password,
    status,
    branch,
    created_by,
  } = userDetails;

  await executeTransaction(async (con) => {
    query = `
          INSERT INTO user (name,address,contact,username,password,status,created_by)
          VALUES (?,?,?,?,?,?,?)
         `;
    result = await con.query(query, [
      name,
      address,
      contact,
      username,
      password,
      status,
      created_by,
    ]);
    query = `SET @user_id = LAST_INSERT_ID();`;
    await con.query(query);

    if (branch.length > 0) {
      for (let i = 0; i < branch.length; i++) {
        query = `
            INSERT INTO user_branch_info (user_id,branch_id,created_by)
            VALUES (@user_id,?,?)
            `;
        result = await con.query(query, [branch[i], created_by]);
      }
    }
  });
  return result;
};

const getUserPagination = async (
  limit,
  offset,
  status,
  name,
  viewAll,
  user_id
) => {
  let query, result, totalCount;

  if (viewAll) {
    if (name == "" || name == null) {
      query = `SELECT SQL_CALC_FOUND_ROWS 
                      u.user_id,
                      u.name,
                      u.address,
                      u.contact,
                      u.username,
                      u.status ,
                      u.user_type,
                      JSON_ARRAYAGG(p.branch_id) AS branch_id,
                      JSON_ARRAYAGG(bi.name) AS branch_name
                      FROM user as u
                      LEFT JOIN user_branch_info as p
                      ON u.user_id=p.user_id and p.status =1
                        LEFT JOIN branch_info as bi ON bi.branch_id = p.branch_id and bi.status=1
                      WHERE
                        u.status = ?
                    GROUP BY u.user_id , u.name , u.address , u.contact , u.username , u.status , u.user_type
                    ORDER BY u.user_id DESC
                    LIMIT ? OFFSET ?`;
      result = await con.query(query, [status, limit, offset]);
      totalCount = await con.query("SELECT FOUND_ROWS() as total");
    } else {
      query = `SELECT SQL_CALC_FOUND_ROWS 
                     u.user_id,
                      u.name,
                      u.address,
                      u.contact,
                      u.username,
                      u.status ,
                      u.user_type,
                      JSON_ARRAYAGG(p.branch_id) AS branch_id,
                      JSON_ARRAYAGG(bi.name) AS branch_name
                      FROM user as u
                      LEFT JOIN user_branch_info as p
                      ON u.user_id=p.user_id and p.status =1
                        LEFT JOIN branch_info as bi ON bi.branch_id = p.branch_id and bi.status=1
                   WHERE
                        u.status = ? and u.name like ?
                    GROUP BY u.user_id , u.name , u.address , u.contact , u.username , u.status , u.user_type
                    ORDER BY u.user_id DESC
                    LIMIT ? OFFSET ?`;
      result = await con.query(query, [status, name + "%", limit, offset]);
      totalCount = await con.query("SELECT FOUND_ROWS() as total");
    }
    let obj = { data: result[0], total: totalCount[0] };

    return obj;
  } else {
    if (name == "" || name == null) {
      query = `SELECT SQL_CALC_FOUND_ROWS 
                      u.user_id,
                      u.name,
                      u.address,
                      u.contact,
                      u.username,
                      u.status ,
                      u.user_type,
                      JSON_ARRAYAGG(p.branch_id) AS branch_id,
                      JSON_ARRAYAGG(bi.name) AS branch_name
                      FROM user as u
                      LEFT JOIN user_branch_info as p
                      ON u.user_id=p.user_id and p.status =1
                        LEFT JOIN branch_info as bi ON bi.branch_id = p.branch_id and bi.status=1
                      WHERE u.created_by=? AND u.status=? 
                      GROUP BY u.user_id , u.name , u.address , u.contact , u.username , u.status , u.user_type
                    ORDER BY u.user_id DESC
                    LIMIT ? OFFSET ?`;
      result = await con.query(query, [user_id, status, limit, offset]);
      totalCount = await con.query("SELECT FOUND_ROWS() as total");
    } else {
      query = `SELECT SQL_CALC_FOUND_ROWS 
                     u.user_id,
                      u.name,
                      u.address,
                      u.contact,
                      u.username,
                      u.status ,
                      u.user_type,
                      JSON_ARRAYAGG(p.branch_id) AS branch_id,
                      JSON_ARRAYAGG(bi.name) AS branch_name
                      FROM user as u
                      LEFT JOIN user_branch_info as p
                      ON u.user_id=p.user_id and p.status=1
                        LEFT JOIN branch_info as bi ON bi.branch_id = p.branch_id and bi.status=1
                   WHERE u.created_by=? AND u.status=? AND u.name LIKE ? GROUP BY u.user_id , u.name , u.address , u.contact , u.username , u.status , u.user_type
                    ORDER BY u.user_id DESC
                    LIMIT ? OFFSET ?`;
      result = await con.query(query, [
        user_id,
        status,
        name + "%",
        limit,
        offset,
      ]);
      totalCount = await con.query("SELECT FOUND_ROWS() as total");
    }
    let obj = { data: result[0], total: totalCount[0] };

    return obj;
  }
};

const updateUser = async (userObj, userLogDetails, user_type) => {
  let query, result, new_value, id;
  let {
    user_id,
    name,
    address,
    contact,
    username,
    password,
    status,
    branch_id,
    branch,
    created_by,
  } = userObj;

  await executeTransaction(async (con) => {
    //update user info
    if (password == null) {
      query = `
               UPDATE user SET name=?,address=?,contact=?,username=?,status=? WHERE user_id=?
             `;
      result = await con.query(query, [
        name,
        address,
        contact,
        username,
        status,
        user_id,
      ]);
    } else {
      query = `
          UPDATE user SET name=?,address=?,contact=?,username=?,password=?,status=? WHERE user_id=?
        `;
      result = await con.query(query, [
        name,
        address,
        contact,
        username,
        password,
        status,
        user_id,
      ]);
    }

    //make userbranch info status to 0

    query = `UPDATE user_branch_info SET status=0 WHERE user_id=?`;
    result = await con.query(query, [user_id]);

    const branchCheckQuery = `SELECT branch_id FROM user_branch_info WHERE user_id=?`;

    const checkIdExists = await con.query(branchCheckQuery, [user_id]);

    if (branch.length > 0) {
      for (let i = 0; i < branch.length; i++) {
        const branchExist = checkIdExists.some(
          (idObj) => idObj.branch_id === branch[i]
        );

        if (branchExist) {
          query = `UPDATE user_branch_info SET status = ?, branch_id = ? WHERE user_id = ? AND branch_id = ?`;
          result = await con.query(query, [
            status,
            branch[i],
            user_id,
            branch[i],
          ]);
        } else {
          query = `INSERT INTO user_branch_info (user_id, branch_id, created_by, status) VALUES (?, ?, ?, ?)`;
          result = await con.query(query, [
            user_id,
            branch[i],
            created_by,
            status,
          ]);
        }
      }
    }

    query = `
             SELECT * FROM user WHERE user_id=?
            `;
    new_value = await con.query(query, [user_id]);

    //save user log
    query = `
       INSERT INTO log_info (module_name,table_name,row_id,new_value,old_value,operation,remarks,user_id,transaction_date) VALUES (?,?,?,?,?,?,?,?,?)
    `;
    result = await con.query(query, [
      userLogDetails.module_name,
      userLogDetails.table_name,
      userLogDetails.row_id,
      JSON.stringify(new_value[0][0]),
      JSON.stringify(userLogDetails.old_value),
      userLogDetails.operation,
      userLogDetails.remarks,
      userLogDetails.user_id,
      userLogDetails.transaction_date,
    ]);
  });

  return result;
};

const getUserType = async (user_id) => {
  const query = `SELECT user_type from user WHERE user_id=?`;
  const result = await con.query(query, [user_id]);
  return result[0];
};

const findByUserId = async (id) => {
  const query = `
    SELECT user_id, username, name,password,address,contact,  user_type, created_by
    FROM user 
    WHERE user_id =? AND status=1
    `;
  const result = await con.query(query, [id]);
  return result[0];
};

const changePassword = async (user_id, password) => {
  const sql = `
    UPDATE user
    SET password = ?
    WHERE user_id = ?
  `;

  const [result] = await con.query(sql, [password, user_id]);
  return result;
};

module.exports = {
  findByUsername,
  getUserList,
  createUser,
  getUserPagination,
  updateUser,
  getUserType,
  findByUserId,
  changePassword,
};
