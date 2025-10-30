
INSERT INTO index_info (functional_year_id, title, index_code, max_id, status) VALUES (1, 'sales', 'SAI', 0, 1);

CREATE TABLE pharmacy_sales_entry_info (
   id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
   invoice_issue_date_ad DATE NOT NULL,
   invoice_issue_date_bs VARCHAR(50) NOT NULL,
   transaction_date_ad DATE NOT NULL,
   transaction_date_bs VARCHAR(50) NOT NULL,
   age_setup_date_ad DATE DEFAULT NULL,
   age_setup_date_bs VARCHAR(50) DEFAULT NULL,
   ledger_id INT DEFAULT NULL,
   party_id INT DEFAULT NULL,
   sales_bill_no VARCHAR(50) NOT NULL,
   sales_voucher VARCHAR(50) NOT NULL,
   grand_total_amount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
   total_amount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
   total_taxable_amount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
   taxable_discount_amount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
   total_non_taxable_amount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
   non_taxable_discount_amount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
   total_discount_amount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
   vat_amount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
   vat_rate DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
   status TINYINT NOT NULL DEFAULT 1,
   remarks TEXT,
   transaction_id INT NOT NULL,
   functional_year_id INT NOT NULL,
   branch_id INT NOT NULL,
   created_by INT DEFAULT NULL,
   created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
   updated_at TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE pharmacy_sales_entry_detail (
   id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
   voucher_number VARCHAR(50) NOT NULL,
   sales_entry_info_id INT NOT NULL,
   sales_bill_no VARCHAR(50) NOT NULL,
   invoice_issue_date_ad DATE NOT NULL,
   invoice_issue_date_bs VARCHAR(50) NOT NULL,
   transaction_date_ad DATE NOT NULL,
   transaction_date_bs VARCHAR(50) NOT NULL,
   ledger_id INT DEFAULT NULL,
   product_id INT NOT NULL,
   unit_id INT NOT NULL,
   qty DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
   rate DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
   amount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
   discount_amount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
   amount_after_discount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
   is_taxable TINYINT NOT NULL,
   transaction_id INT NOT NULL,
   functional_year_id INT NOT NULL,
   branch_id INT NOT NULL,
   status TINYINT NOT NULL DEFAULT 1,
   created_by INT DEFAULT NULL,
   created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
   updated_at TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE pharmacy_sales_payment_info (
   id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
   transaction_date_ad DATE NOT NULL,
   transaction_date_bs VARCHAR(50) NOT NULL,
   vouchernumber VARCHAR(50) NOT NULL,
   comes_from VARCHAR(255) NOT NULL,
   payment_no VARCHAR(50) NOT NULL,
   payment_type VARCHAR(50) NOT NULL,
   ledger_id INT DEFAULT NULL,
   amount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
   bank_ledger_id INT DEFAULT NULL,
   cash_ledger_id INT DEFAULT NULL,
   cheque_no VARCHAR(50) DEFAULT NULL,
   withdrawn_bank_name VARCHAR(50) DEFAULT NULL,
   transaction_type VARCHAR(50) NOT NULL,
   remarks VARCHAR(255) DEFAULT NULL,
   transaction_id INT NOT NULL,
   functional_year_id INT NOT NULL,
   branch_id INT NOT NULL,
   status TINYINT NOT NULL DEFAULT 1,
   created_by INT DEFAULT NULL,
   created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
   updated_at TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
);

ALTER TABLE pharmacy_sales_entry_info ADD CONSTRAINT fk_pharmacy_sales_entry_info_ledger_id FOREIGN KEY (ledger_id) REFERENCES accounting_ledgerinfo(id);
ALTER TABLE pharmacy_sales_entry_info ADD CONSTRAINT fk_pharmacy_sales_entry_info_info_functional_year FOREIGN KEY (functional_year_id) REFERENCES functional_year(functional_year_id);
ALTER TABLE pharmacy_sales_entry_info ADD CONSTRAINT fk_pharmacy_sales_entry_info_branch FOREIGN KEY (branch_id) REFERENCES branch_info (branch_id);
ALTER TABLE pharmacy_sales_entry_info ADD CONSTRAINT fk_pharmacy_sales_entry_info_user FOREIGN KEY (created_by) REFERENCES user(user_id);

ALTER TABLE pharmacy_sales_entry_detail ADD CONSTRAINT fk_pharmacy_sales_entry_detail_ledger_id FOREIGN KEY (ledger_id) REFERENCES accounting_ledgerinfo(id);
ALTER TABLE pharmacy_sales_entry_detail ADD CONSTRAINT fk_pharmacy_sales_entry_detail_info_functional_year FOREIGN KEY (functional_year_id) REFERENCES functional_year(functional_year_id);
ALTER TABLE pharmacy_sales_entry_detail ADD CONSTRAINT fk_pharmacy_sales_entry_detail_branch FOREIGN KEY (branch_id) REFERENCES branch_info (branch_id);
ALTER TABLE pharmacy_sales_entry_detail ADD CONSTRAINT fk_pharmacy_sales_entry_detail_user FOREIGN KEY (created_by) REFERENCES user(user_id);


CREATE TABLE pdc_info (
  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  transaction_date_bs VARCHAR(45) NOT NULL,
  transaction_date_ad DATE NOT NULL,
  mature_date_bs VARCHAR(45) NOT NULL,
  mature_date_ad DATE NOT NULL,
  drawn_on_bank TEXT CHARACTER SET UTF8MB4 COLLATE UTF8MB4_UNICODE_CI NOT NULL,
  cheque_no TEXT CHARACTER SET UTF8MB4 COLLATE UTF8MB4_UNICODE_CI NOT NULL,
  cheque_amt DECIMAL(50,2) NOT NULL,
  party_ledger_id INT NOT NULL,
  cheque_status VARCHAR(45) NOT NULL,
  comes_from VARCHAR(45) NOT NULL,
  table_id INT NOT NULL,
  functional_year_id INT NOT NULL,
  transaction_id INT NOT NULL,
  status TINYINT NOT NULL DEFAULT 1,
  created_by INT NOT NULL,
  created_at DATETIME NOT NULL,
  updated_at DATETIME NOT NULL
);

ALTER TABLE pdc_info ADD CONSTRAINT fk_pdc_info_party_ledger_id FOREIGN KEY (party_ledger_id) REFERENCES party_info(party_id);
ALTER TABLE pdc_info ADD CONSTRAINT fk_pdc_info_created_by FOREIGN KEY (created_by) REFERENCES user(user_id);
INSERT INTO accounting_ledger_mapping (label , ledger_id) VALUES ('Vat Payable' , 0);

ALTER TABLE  pharmacy_sales_payment_info ADD COLUMN sales_id INT NOT NULL;

ALTER TABLE pharmacy_sales_payment_info ADD CONSTRAINT fk_pharmacy_sales_payment_info_sales_id FOREIGN KEY (sales_id) REFERENCES pharmacy_sales_entry_info(id);


ALTER TABLE pharmacy_purchase_return_info MODIFY COLUMN purchase_bill_no VARCHAR(45);

ALTER TABLE pharmacy_purchase_return_info DROP FOREIGN KEY fk_pharmacy_purchase_return_info_purchase_id;

ALTER TABLE pharmacy_purchase_return_info ADD COLUMN return_type VARCHAR(50) NOT NULL DEFAULT 'PURCHASE_RETURN';

INSERT INTO index_info (functional_year_id, title, index_code, max_id, status)
VALUES (1, 'sales return', 'SRI', 0,1);

CREATE TABLE pharmacy_sales_return_info (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ledger_id INT NOT NULL,
    party_id INT NOT NULL,
    remarks TEXT,
    return_amount DECIMAL(65 , 2 ) DEFAULT '0.00',
    sales_return_date_bs VARCHAR(50) NOT NULL,
    sales_bill_amount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
    sales_bill_discount_amount DECIMAL(65 , 2 ) DEFAULT '0.00',
    sales_bill_no VARCHAR(50) NOT NULL,
    sales_id INT NOT NULL,
    sales_return_bill_number VARCHAR(50) NOT NULL,
    sales_return_date_ad DATE NOT NULL,
    transaction_id INT NOT NULL,
    functional_year_id INT NOT NULL,
    branch_id INT NOT NULL,
    status TINYINT NOT NULL DEFAULT 1,
    created_by INT DEFAULT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL
);

ALTER TABLE pharmacy_sales_return_info ADD CONSTRAINT fk_pharmacy_sales_return_info_ledger_id FOREIGN KEY (ledger_id) REFERENCES accounting_ledgerinfo(id);
ALTER TABLE pharmacy_sales_return_info ADD CONSTRAINT fk_pharmacy_sales_return_info_info_functional_year FOREIGN KEY (functional_year_id) REFERENCES functional_year(functional_year_id);
ALTER TABLE pharmacy_sales_return_info ADD CONSTRAINT fk_pharmacy_sales_return_info_branch FOREIGN KEY (branch_id) REFERENCES branch_info (branch_id);
ALTER TABLE pharmacy_sales_return_info ADD CONSTRAINT fk_pharmacy_sales_return_info_user FOREIGN KEY (created_by) REFERENCES user(user_id);


CREATE TABLE pharmacy_sales_return_detail (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ledger_id INT NOT NULL,
    party_id INT NOT NULL,
    product_detail_id INT NOT NULL,
    product_id INT NOT NULL,
    type_name VARCHAR(50) DEFAULT NULL,
    return_amount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
    return_qty DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
    sales_return_date_bs VARCHAR(50) NOT NULL,
    sales_bill_no VARCHAR(50) NOT NULL,
    sales_id INT NOT NULL,
    sales_return_bill_number VARCHAR(50) NOT NULL,
    sales_return_date_ad DATE NOT NULL,
    sales_return_id INT NOT NULL,
    sold_amount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
    sold_qty DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
    sold_rate DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
    sold_unit_id INT NOT NULL,
    sold_unit_type VARCHAR(25) NOT NULL,
    transaction_id INT NOT NULL,
    functional_year_id INT NOT NULL,
    branch_id INT NOT NULL,
    status TINYINT NOT NULL DEFAULT 1,
    created_by INT DEFAULT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL
);

ALTER TABLE pharmacy_sales_return_info ADD total_taxable_amount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00';
ALTER TABLE pharmacy_sales_return_info ADD vat_amount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00';
ALTER TABLE pharmacy_sales_return_info ADD non_taxable_amount DECIMAL(19 , 2 ) DEFAULT NULL;
ALTER TABLE pharmacy_sales_return_info ADD vat_rate DECIMAL(19 , 2 ) DEFAULT NULL;
ALTER TABLE pharmacy_sales_return_info ADD taxable_discount_amount DECIMAL(19 , 2 ) DEFAULT NULL;
ALTER TABLE pharmacy_sales_return_info ADD non_taxable_discount_amount DECIMAL(19 , 2 ) DEFAULT NULL;

ALTER TABLE pharmacy_sales_return_detail ADD CONSTRAINT fk_pharmacy_sales_return_detail_ledger_id FOREIGN KEY (ledger_id) REFERENCES accounting_ledgerinfo(id);
ALTER TABLE pharmacy_sales_return_detail ADD CONSTRAINT fk_pharmacy_sales_return_detail_functional_year FOREIGN KEY (functional_year_id) REFERENCES functional_year(functional_year_id);
ALTER TABLE pharmacy_sales_return_detail ADD CONSTRAINT fk_pharmacy_sales_return_detail_branch FOREIGN KEY (branch_id) REFERENCES branch_info (branch_id);
ALTER TABLE pharmacy_sales_return_detail ADD CONSTRAINT fk_pharmacy_sales_return_detail_user FOREIGN KEY (created_by) REFERENCES user(user_id);

ALTER table pharmacy_sales_return_detail MODIFY column party_id INT DEFAULT null;
ALTER table pharmacy_sales_return_info MODIFY column party_id INT DEFAULT null;

ALTER TABLE pdc_info DROP foreign key fk_pdc_info_party_ledger_id;

ALTER TABLE pdc_info ADD CONSTRAINT fk_pdc_info_party_ledger_id FOREIGN KEY (party_ledger_id) REFERENCES accounting_ledgerinfo(id);

INSERT INTO version_info (version,description) 
VALUES (
    '3.0.0',
    'SALES ENTRY,
     OPENING STOCK RETURN,
     MODIFY purchase return tables,
     SALES RETURN,
     pdc_info 
    '
);