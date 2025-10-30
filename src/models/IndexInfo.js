const con = require('../config/database')
const { RECEIPT_INDEX_CODE, TRANSACTION_INDEX_CODE, PURCHASE_RECEIPT_INDEX_CODE, PURCHASE_RETURN_RECEIPT_INDEX_CODE, SALES_RECEIPT_INDEX_CODE,SALES_RETURN_RECEIPT_INDEX_CODE ,MULDARTA_NUMBER_INDEX_CODE} = require('../helpers/constant')

const getReceiptNo = async (functional_year_id) => {
    let query = `SELECT max_id,index_code FROM index_info WHERE index_code=? and functional_year_id=?`
    let result = await con.query(query, [RECEIPT_INDEX_CODE, functional_year_id])
    return result[0]
}

const getMuldartaNo = async (functional_year_id) => {
    let query = `SELECT max_id,index_code FROM index_info WHERE index_code=? and functional_year_id=?`
    let result = await con.query(query, [MULDARTA_NUMBER_INDEX_CODE, functional_year_id])
    return result[0]
}

const getTransactionId = async (functional_year_id) => {
    let query = `SELECT max_id,index_code FROM index_info WHERE index_code=? and functional_year_id=?`
    let result = await con.query(query, [TRANSACTION_INDEX_CODE, functional_year_id])
    return result[0]
}

const getPurchaseVoucherNo = async (functional_year_id) => {
    let query = `SELECT max_id,index_code FROM index_info WHERE index_code=? and functional_year_id=?`
    let result = await con.query(query, [PURCHASE_RECEIPT_INDEX_CODE, functional_year_id])
    return result[0]
}

const getPurchaseReturnVoucherNo = async (functional_year_id) => {
    let query = `SELECT max_id,index_code FROM index_info WHERE index_code=? and functional_year_id=?`
    let result = await con.query(query, [PURCHASE_RETURN_RECEIPT_INDEX_CODE, functional_year_id])
    return result[0]
}

const getSalesVoucherNumber = async (functional_year_id) => {
    let query = `SELECT max_id,index_code FROM index_info WHERE index_code=? and functional_year_id=?`
    let result = await con.query(query, [SALES_RECEIPT_INDEX_CODE, functional_year_id])
    return result[0]
}

const getSalesReturnVoucherNumber = async (functional_year_id) => {
    let query = `SELECT max_id,index_code FROM index_info WHERE index_code=? and functional_year_id=?`
    let result = await con.query(query, [SALES_RETURN_RECEIPT_INDEX_CODE, functional_year_id])
    return result[0]
}

const getSalesBillNumber = async (functional_year_id) => {
    let query = `SELECT max_id,index_code FROM index_info WHERE index_code=? and functional_year_id=?`;
    let result = await con.query(query, ['SBN', functional_year_id]);
    return result[0];
}

module.exports = {
    getReceiptNo,
    getTransactionId,
    getPurchaseVoucherNo,
    getPurchaseReturnVoucherNo,
    getSalesVoucherNumber,
    getSalesReturnVoucherNumber,
    getSalesBillNumber,
    getMuldartaNo
}