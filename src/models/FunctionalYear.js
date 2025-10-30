const con = require('../config/database')
const { executeTransaction } = require('../config/executeTransaction')
const { index_info } = require('../helpers/indexData')

const economicYearSetup = async (economicYearDetail) => {
    const {
        functional_year,
        functional_year_start_ad,
        functional_year_start_bs,
        functional_year_end_ad,
        functional_year_end_bs,
        created_by
    } = economicYearDetail

    let query, result

    await executeTransaction(async (con) => {
        //set previous economic year as inactive
        await setInactiveEconomicYear()

        //insert new economic year
        query = `
            INSERT INTO functional_year 
            (functional_year,
             functional_year_start_ad,
             functional_year_start_bs,
             functional_year_end_ad,
             functional_year_end_bs,
             created_by)
             VALUES (?,?,?,?,?,?)
         `
        result = await con.query(query, [
            functional_year,
            functional_year_start_ad,
            functional_year_start_bs,
            functional_year_end_ad,
            functional_year_end_bs,
            created_by
        ])

        let functional_year_id = result[0].insertId

        //reset index code data
        query = `INSERT INTO index_info (functional_year_id,title,index_code,max_id) VALUES ?`
        const values = index_info.map((info) => [functional_year_id, info.title, info.index_code, info.max_id]);

        result = await con.query(query, [values])

    })

    return result
}

const setInactiveEconomicYear = async () => {
    const query = `UPDATE functional_year SET status=0 WHERE status=1`
    const result = await con.query(query)
    return result
}

const getEconomicYearList = async () => {
    const query = `
    SELECT 
      functional_year_id, functional_year, functional_year_start_ad, functional_year_start_bs,
      functional_year_end_ad, functional_year_end_bs, status
    FROM functional_year ORDER BY created_at DESC
    `
    const result = await con.query(query)
    return result[0]
}

const getActiveEconomicYearInfo = async () => {
    const query = `
    SELECT functional_year_id, functional_year, functional_year_start_ad, functional_year_start_bs,
    functional_year_end_ad, functional_year_end_bs FROM functional_year WHERE status=1;
    `
    const result = await con.query(query)
    return result[0]
}

const getEconomicYearInfo = async (functional_year_id) => {
    const query = `
    SELECT functional_year_id, functional_year, functional_year_start_ad, functional_year_start_bs,
    functional_year_end_ad, functional_year_end_bs FROM functional_year WHERE functional_year_id=?;
    `
    const result = await con.query(query, [functional_year_id])
    return result[0]
}

module.exports = {
    economicYearSetup,
    getEconomicYearList,
    setInactiveEconomicYear,
    getActiveEconomicYearInfo,
    getEconomicYearInfo
}