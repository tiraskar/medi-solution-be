const createAccountingEntry = async (
  ledger_id,
  debit,
  credit,
  narrationText
) => {
  await connection.execute(
    `INSERT INTO accounting_transaction_detail
      (comes_from, ledger_id, credit, debit, table_id, transaction_id, voucher_date_ad, voucher_date_bs, voucher_number, voucher_type, functional_year_id, branch_id, narration, created_by)
      VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`,
    [
      "SALES ENTRY",
      ledger_id,
      credit,
      debit,
      tableId,
      transaction_id,
      invoice_date ?? null,
      bill_date_bs,
      receipt_no,
      "Renew Voucher",
      functional_year_id,
      branch_id ?? null,
      narrationText ?? null,
      created_by,
    ]
  );
};

module.exports = { createAccountingEntry };
