const con = require('../config/database')
const { executeTransaction } = require('../config/executeTransaction');


const validateGroupCode = async (data_to_save) => {

    const { lab_group_code } = data_to_save;
    let query, result;
    await executeTransaction(async (con) => {
        query = `SELECT COUNT(*) AS count FROM lab_group_info WHERE lab_group_code=?`
        result = await con.query(query, [lab_group_code])

    });
    return result[0][0];

};

const saveLabTestGroup = async (data_to_save) => {

    const {
        group_name,
        lab_group_code,
        created_by,
        created_at,
        status,
        updated_at
    } = data_to_save
    let result, query;

    await executeTransaction(async (con) => {
        query = `
        INSERT INTO lab_group_info
        (
            group_name,
            lab_group_code,
            status,
            created_by,
            created_at,
            updated_at
        )
        VALUES(?,?,?,?,?,?);
        `
        result = await con.query(query, [group_name, lab_group_code, status, created_by, created_at, updated_at])

    });
    return 1;
};

const getLabTestGroup =async()=>{    
    const query = `select id,group_name from lab_group_info where status = 1`
    const result = await con.query(query)
    return result[0]
}

const getLabTestGroupPagination = async (paginationParams) => {
    let query, result, totalCount;
    const {
        page,
        limit,
        offset,
        status,
        group_name,
    } = paginationParams

    await executeTransaction(async (con) => {
        if (group_name == null || group_name == "") {
            query = 'SET @group_name=NULL'
            await con.query(query)
        } else {
            query = 'SET @group_name=?'
            await con.query(query, [group_name])
        }
        query = `
         SELECT SQL_CALC_FOUND_ROWS 
         id,
         lab_group_code,
         group_name,
         status,
         created_by
         FROM lab_group_info
         WHERE 
        status = ? 
         AND (
         @group_name IS NULL OR group_name like ?
         )
         ORDER BY id DESC LIMIT ? OFFSET ?;
         `
        result = await con.query(query, [status, group_name + "%", limit, offset])
        totalCount = await con.query('SELECT FOUND_ROWS() as total')
    })

    return { data: result[0], total: totalCount[0][0].total }
};

const getLabTestMappingPagination = async (paginationParams) => {
    let query, result, totalCount;
    const {
        page,
        limit,
        offset,
        status,
        group_name,
    } = paginationParams;

    if (group_name == null || group_name == '') {
        query = `
        SELECT SQL_CALC_FOUND_ROWS
            li.id as mapping_id,
            li.lab_test_id ,
            li.lab_group_id, 
            bi.billing_title,            
            lg.group_name,
            li.status
        FROM
            lab_test_info AS li
        INNER JOIN
            billing_title_info AS bi ON li.lab_test_id = bi.billing_title_id AND bi.status = 1
        INNER JOIN
            lab_group_info As lg ON lg.id = li.lab_group_id AND lg.status =1 
        WHERE 
            li.status = ? ORDER BY li.id DESC LIMIT ? OFFSET ?;`;

        result = await con.query(query, [status, limit, offset]);
        totalCount = await con.query('SELECT FOUND_ROWS() as total')
    } else {
        query = `
        SELECT SQL_CALC_FOUND_ROWS
            li.lab_group_id, bi.billing_title,lg.lab_group_code,lg.group_name,li.status
        FROM
            lab_test_info AS li
        INNER JOIN
            billing_title_info AS bi ON li.lab_test_id = bi.billing_title_id AND bi.status = 1
        INNER JOIN
            lab_group_info As lg ON lg.id = li.lab_group_id AND lg.status =1 
        WHERE 
            li.status = ? AND lg.group_name Like ?  ORDER BY li.id DESC LIMIT ? OFFSET ?;
        `;
        result = await con.query(query, [status, `${group_name}%`, limit, offset]);
        totalCount = await con.query('SELECT FOUND_ROWS() as total');
    }

    let obj = {
        data: result[0],
        total: totalCount[0][0].total
    }
    return obj
}

const updateLabTestMapping =async(data_to_update,logDetails)=>{
    
    let query,result;
    let success =false;
    const {lab_group_id,lab_test_id,remarks,status,updated_at,id} =data_to_update;
    await executeTransaction(async(con)=>{
        
        query = `UPDATE lab_test_info 
        SET
            lab_group_id =?,
            lab_test_id=?,
            status =?,
            remarks =?,
            updated_at =?       
        WHERE id = ?;
        `;
        
        result = con.query(query,[lab_group_id,lab_test_id,status,remarks,updated_at,id])
    
        query =`
        INSERT INTO accounting_log_info 
        (module_name,new_value,old_value,operation_performed,table_name,remarks,user_id,transaction_date) 
        VALUES (?,?,?,?,?,?,?,?);
        `
        result = await con.query(query, [
            logDetails.module_name,
            JSON.stringify(logDetails.new_value),
            JSON.stringify(logDetails.old_value),
            logDetails.operation,
            logDetails.table_name,
            logDetails.remarks,
            logDetails.user_id,
            logDetails.transaction_date
        ]);
        success = true

    })
    return success
}

const updateLabTestGroup = async (data_to_update, logDetails) => {
    const {
        id,
        group_name,
        lab_group_code,
        remarks,
        status,
        updated_at
    } = data_to_update

    let query, result
    let success = false;

   await executeTransaction(async (con) => {
        query = `
            UPDATE lab_group_info 
            SET 
                lab_group_code = ?,
                group_name = ?,
                status = ?,
                updated_at = ?,
                remarks = ?
            WHERE id = ?;
            `
        result = await con.query(query, [lab_group_code, group_name, status, updated_at,remarks, id])

        //save log in accounting_log_info
        query =
            `
        INSERT INTO accounting_log_info 
        (module_name,new_value,old_value,operation_performed,table_name,remarks,user_id,transaction_date) 
        VALUES (?,?,?,?,?,?,?,?)
        `
        result = await con.query(query, [
            logDetails.module_name,
            JSON.stringify(logDetails.new_value),
            JSON.stringify(logDetails.old_value),
            logDetails.operation,
            logDetails.table_name,
            logDetails.remarks,
            logDetails.user_id,
            logDetails.transaction_date
        ]);
        success = true
    });

    return success;
}

const saveLabTestMapping = async (saveData) => {

    const {
        lab_group_id,
        lab_test_id,
        status,
        user_id,
        created_at
    } = saveData;
    let result, query;

    query = `
        INSERT INTO lab_test_info
            (lab_group_id, lab_test_id, status, created_by, created_at, updated_at)
        VALUES
            (?, ?, ?, ?, ?, ?)
    `;
    result = await con.query(query,
        [
            lab_group_id,
            lab_test_id,
            status,
            user_id,
            created_at,
            created_at
        ]);
    if (result[0].affectedRows > 0) return true;
    return false;
}



module.exports = {
    saveLabTestGroup,
    validateGroupCode,
    getLabTestGroupPagination,
    updateLabTestGroup,
    saveLabTestMapping,
    getLabTestMappingPagination,
    getLabTestGroup,
    updateLabTestMapping
    
}
