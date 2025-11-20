const { getCurrentDateTime } = require("../../helpers/date");
const Nepali_Calendar = require("../../helpers/nepaliCalendar");
const {
  SUCCESS_API_FETCH,
  DATA_SAVED,
  DATA_UPDATED,
} = require("../../helpers/response");
const {
  isFutureDate,
  validateAdDateAgainstFunctionalYear,
  isBackDate,
} = require("../../middlewares/dateValidation");
const { getCurrentValue } = require("../../utils/dbUtils");

const logger = require("../../config/winstonLoggerConfig");
const { ledgerServices } = require("../../services");

const getledgerGrouplist = async (req, res, next) => {
  try {
    const ledgerGroup = await ledgerServices.getLedgerGroups();
    return res.status(200).json(SUCCESS_API_FETCH(ledgerGroup));
  } catch (error) {
    logger.error(
      `{ Api:${req.url}, Error:${error.message}, stack:${error.stack} }`
    );
    return next(error);
  }
};
const getledgerinfo = async (req, res, next) => {
  try {
    const ledgerGroup = await ledgerServices.getLedgerInfos();
    return res.status(200).json(SUCCESS_API_FETCH(ledgerGroup));
  } catch (error) {
    logger.error(
      `{ Api:${req.url}, Error:${error.message}, stack:${error.stack} }`
    );
    return next(error);
  }
};

const getledgerSubGrouplist = async (req, res, next) => {
  try {
    const ledgerSubGroup = await ledgerServices.getLedgerSubGroups();
    return res.status(200).json({
      status: true,
      message: "Data found successfully!!!",
      data: ledgerSubGroup,
    });
  } catch (error) {
    logger.error(
      `{ Api:${req.url}, Error:${error.message}, stack:${error.stack} }`
    );
    return next(error);
  }
};

const saveLedger = async (req, res, next) => {
  try {
    const {
      ledgername,
      master_ledger_group_id,
      ledger_sub_group_id,
      address,
      contact,
      opening_balance_date_bs,
      opening_balance,
      transaction_type,
      status,
      functional_year_id,
      branch_id,
    } = req.body;

    let calendar = new Nepali_Calendar();

    let opening_balance_date_ad = calendar.BSToADConvert(
      opening_balance_date_bs
    );

    // let isValidDate = await validateAdDateAgainstFunctionalYear(
    //   functional_year_id,
    //   opening_balance_date_ad
    // );
    let isValidDate = true;
    if (!isValidDate) {
      return res.status(400).json({
        status: false,
        message: "The provided date do not lie within the functional year",
      });
    }

    let isFuture = isFutureDate(opening_balance_date_ad);
    if (isFuture) {
      return res.status(400).json({
        status: false,
        message: "Future date is not allowed",
      });
    }

    const jsonObject = {
      ledgername,
      master_ledger_group_id,
      ledger_sub_group_id,
      ledger_type: "Accounting",
      address,
      contact,
      opening_balance_date: opening_balance_date_bs,
      opening_balance,
      transaction_type,
      status,
      functional_year_id,
      branch_id: branch_id || 1,
      created_by: req?.user?.user_id,
    };

    // console.log(jsonObject);

    await ledgerServices.createLedger(jsonObject);

    return res.status(201).json(DATA_SAVED());
  } catch (error) {
    logger.error(
      `{ Api:${req.url}, Error:${error.message}, stack:${error.stack} }`
    );
    return next(error);
  }
};

const getallledgerinfo = async (req, res, next) => {
  try {
    const ledgerGroup = await ledgerServices.getallledgerinfo();
    return res.status(200).json(SUCCESS_API_FETCH(ledgerGroup));
  } catch (error) {
    logger.error(
      `{ Api:${req.url}, Error:${error.message}, stack:${error.stack} }`
    );
    return next(error);
  }
};

const getLedgerPagination = async (req, res, next) => {
  try {
    const ledgername = req.query.ledgerName || "";
    const status = parseInt(req.query.status);
    const page = parseInt(req.query.page) || 1;
    const limit = parseInt(req.query.limit) || 10;
    const offset = (page - 1) * limit;

    let data = await ledgerServices.searchLedgers(
      limit,
      offset,
      status,
      ledgername,
      req.user.user_id
    );

    return res.status(200).json({
      status: true,
      message: "Data found successfully!!!",
      data: data.rows,
      total: data.count,
    });
  } catch (error) {
    logger.error(
      `{ Api:${req.url}, Error:${error.message}, stack:${error.stack} }`
    );
    return next(error);
  }
};

const getAllLedgerList = async (req, res, next) => {
  try {
    const ledger = await ledgerServices.getAllLedgers();
    return res.status(200).json(SUCCESS_API_FETCH(ledger));
  } catch (error) {
    logger.error(
      `{ Api:${req.url}, Error:${error.message}, stack:${error.stack} }`
    );
    return next(error);
  }
};

const updateLedger = async (req, res, next) => {
  try {
    const {
      ledger_id,
      ledgername,
      master_ledger_group_id,
      ledger_sub_group_id,
      address,
      contact,
      opening_balance_date_bs,
      opening_balance,
      transaction_type,
      status,
      functional_year_id,
      branch_id,
      remarks,
    } = req.body;
    console.log(req.body);

    let calendar = new Nepali_Calendar();
    let opening_balance_date_ad = opening_balance_date_bs
      ? calendar.BSToADConvert(opening_balance_date_bs)
      : null;

    // let isValidDate = await validateAdDateAgainstFunctionalYear(
    //   functional_year_id,
    //   opening_balance_date_ad
    // );

    let isValidDate = true;

    if (!isValidDate) {
      return res.status(400).json({
        status: false,
        message: "The provided date do not lie within the functional year",
      });
    }

    let isFuture = isFutureDate(opening_balance_date_ad);
    if (isFuture) {
      return res.status(400).json({
        status: false,
        message: "Future date is not allowed",
      });
    }

    const old_value = await getCurrentValue(
      "accounting_ledgerinfo",
      "id",
      ledger_id
    );

    const jsonObject = {
      ledger_id,
      ledgername,
      master_ledger_group_id,
      ledger_sub_group_id,
      address,
      contact,
      opening_balance_date: opening_balance_date_bs,
      opening_balance,
      transaction_type,
      status,
      functional_year_id,
      branch_id: branch_id || 1,
    };

    const logDetails = {
      module_name: "ledger",
      table_name: "accounting_ledgerinfo",
      row_id: ledger_id,
      new_value: jsonObject,
      old_value: old_value,
      operation: status == 0 ? "delete" : "update",
      remarks: remarks,
      user_id: req.user.user_id,
      transaction_date: getCurrentDateTime(),
    };

    await ledgerServices.updateLedger(jsonObject, logDetails);

    return res.status(201).json(DATA_UPDATED());
  } catch (error) {
    logger.error(
      `{ Api:${req.url}, Error:${error.message}, stack:${error.stack} }`
    );
    return next(error);
  }
};

const saveLedgerMapping = async (req, res, next) => {
  try {
    await ledgerServices.saveLedgerMapping(req.body);
    return res
      .status(201)
      .json(DATA_UPDATED("Ledger mapping done successfully!!!"));
  } catch (error) {
    logger.error(
      `{ Api:${req.url}, Error:${error.message}, stack:${error.stack} }`
    );
    return next(error);
  }
};

const getLedgerMappingPagination = async (req, res, next) => {
  try {
    const page = parseInt(req.query.page) || 1;
    const limit = parseInt(req.query.limit) || 10;
    const offset = (page - 1) * limit;

    const data = await ledgerServices.getLedgerMappingPagination(
      page,
      limit,
      offset
    );

    return res.status(200).json({
      status: true,
      message: "Data found successfully!!!",
      data: data,
      total: data?.count,
    });
  } catch (error) {
    logger.error(
      `{ Api:${req.url}, Error:${error.message}, stack:${error.stack} }`
    );
    return next(error);
  }
};

const getActiveLedger = async (req, res, next) => {
  try {
    const ledger = await ledgerServices.getActiveLedgers();
    return res.status(200).json(SUCCESS_API_FETCH(ledger));
  } catch (error) {
    logger.error(
      `{ Api:${req.url}, Error:${error.message}, stack:${error.stack} }`
    );
    return next(error);
  }
};

const getBankLedger = async (req, res, next) => {
  try {
    const ledger = await ledgerServices.getBankLedgers();
    return res.status(200).json(SUCCESS_API_FETCH(ledger));
  } catch (error) {
    logger.error(
      `{ Api:${req.url}, Error:${error.message}, stack:${error.stack} }`
    );
    return next(error);
  }
};

module.exports = {
  getledgerGrouplist,
  getledgerSubGrouplist,
  saveLedger,
  getLedgerPagination,
  updateLedger,
  saveLedgerMapping,
  getLedgerMappingPagination,
  getActiveLedger,
  getAllLedgerList,
  getBankLedger,
  getallledgerinfo,
  getledgerinfo,
};
