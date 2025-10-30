-- ALTER TABLE pharmacy_purchase_return_info
-- ADD COLUMN taxable_discount_amount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
-- ADD COLUMN non_taxable_discount_amount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00';


-- INSERT INTO version_info (version,description) 
-- VALUES (
--     '2.2.1',
--     'add taxable_discount_amount and non_taxable_discount_amount in purchase_return_info'
-- );

-- ALTER TABLE pharmacy_purchase_info
-- ADD COLUMN taxable_discount_amount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
-- ADD COLUMN non_taxable_discount_amount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00';


-- INSERT INTO version_info (version,description) 
-- VALUES (
--     '2.2.2',
--     'add taxable_discount_amount and non_taxable_discount_amount in pharmacy_purchase_info'
-- );

-- ALTER TABLE pharmacy_stock_info add mrp DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00';

-- INSERT INTO version_info (version,description) 
-- VALUES (
--     '2.2.3',
--     'added mrp in pharmacy_stock_info'
-- );


-- INSERT INTO index_info (functional_year_id, title, index_code, max_id, status) VALUES (1, 'sales', 'SAI', 0, 1);

-- INSERT INTO index_info (functional_year_id, title, index_code, max_id, status)
-- VALUES (1, 'sales return', 'SRI', 0,1);

-- INSERT INTO index_info (functional_year_id, title, index_code, max_id)
-- 			VALUES(1,'sales_bill_number', 'SBN', 0);

-- CREATE TABLE pharmacy_sales_entry_info (
--   id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
--   invoice_issue_date_ad DATE NOT NULL,
--   invoice_issue_date_bs VARCHAR(50) NOT NULL,
--   transaction_date_ad DATE NOT NULL,
--   transaction_date_bs VARCHAR(50) NOT NULL,
--   age_setup_date_ad DATE DEFAULT NULL,
--   age_setup_date_bs VARCHAR(50) DEFAULT NULL,
--   ledger_id INT DEFAULT NULL,
--   party_id INT DEFAULT NULL,
--   sales_bill_no VARCHAR(50) NOT NULL,
--   sales_voucher VARCHAR(50) NOT NULL,
--   grand_total_amount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
--   total_amount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
--   total_taxable_amount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
--   taxable_discount_amount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
--   total_non_taxable_amount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
--   non_taxable_discount_amount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
--   total_discount_amount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
--   vat_amount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
--   vat_rate DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
--   department_id INT DEFAULT NULL,
--   phone_number VARCHAR(15) DEFAULT NULL,
--   patient_id INT DEFAULT NULL,
--   status TINYINT NOT NULL DEFAULT 1,
--   remarks TEXT,
--   transaction_id INT NOT NULL,
--   functional_year_id INT NOT NULL,
--   branch_id INT NOT NULL,
--   created_by INT DEFAULT NULL,
--   created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
--   updated_at TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
-- );

-- CREATE TABLE pharmacy_sales_entry_detail (
--   id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
--   voucher_number VARCHAR(50) NOT NULL,
--   sales_entry_info_id INT NOT NULL,
--   sales_bill_no VARCHAR(50) NOT NULL,
--   invoice_issue_date_ad DATE NOT NULL,
--   invoice_issue_date_bs VARCHAR(50) NOT NULL,
--   transaction_date_ad DATE NOT NULL,
--   transaction_date_bs VARCHAR(50) NOT NULL,
--   ledger_id INT DEFAULT NULL,
--   product_id INT NOT NULL,
--   unit_id INT NOT NULL,
--   qty DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
--   rate DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
--   amount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
--   discount_amount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
--   amount_after_discount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
--   is_taxable TINYINT NOT NULL,
--   transaction_id INT NOT NULL,
--   functional_year_id INT NOT NULL,
--   branch_id INT NOT NULL,
--   status TINYINT NOT NULL DEFAULT 1,
--   created_by INT DEFAULT NULL,
--   created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
--   updated_at TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
-- );

-- CREATE TABLE pharmacy_sales_payment_info (
--   id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
--   transaction_date_ad DATE NOT NULL,
--   transaction_date_bs VARCHAR(50) NOT NULL,
--   vouchernumber VARCHAR(50) NOT NULL,
--   comes_from VARCHAR(255) NOT NULL,
--   payment_no VARCHAR(50) NOT NULL,
--   payment_type VARCHAR(50) NOT NULL,
--   ledger_id INT DEFAULT NULL,
--   sales_id INT NOT NULL,
--   amount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
--   bank_ledger_id INT DEFAULT NULL,
--   cash_ledger_id INT DEFAULT NULL,
--   cheque_no VARCHAR(50) DEFAULT NULL,
--   withdrawn_bank_name VARCHAR(50) DEFAULT NULL,
--   transaction_type VARCHAR(50) NOT NULL,
--   remarks VARCHAR(255) DEFAULT NULL,
--   transaction_id INT NOT NULL,
--   functional_year_id INT NOT NULL,
--   branch_id INT NOT NULL,
--   status TINYINT NOT NULL DEFAULT 1,
--   created_by INT DEFAULT NULL,
--   created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
--   updated_at TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
-- );


-- CREATE TABLE pdc_info (
--   id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
--   transaction_date_bs VARCHAR(45) NOT NULL,
--   transaction_date_ad DATE NOT NULL,
--   mature_date_bs VARCHAR(45) NOT NULL,
--   mature_date_ad DATE NOT NULL,
--   drawn_on_bank TEXT CHARACTER SET UTF8MB4 COLLATE UTF8MB4_UNICODE_CI NOT NULL,
--   cheque_no TEXT CHARACTER SET UTF8MB4 COLLATE UTF8MB4_UNICODE_CI NOT NULL,
--   cheque_amt DECIMAL(50,2) NOT NULL,
--   party_ledger_id INT NOT NULL,
--   cheque_status VARCHAR(45) NOT NULL,
--   comes_from VARCHAR(45) NOT NULL,
--   table_id INT NOT NULL,
--   functional_year_id INT NOT NULL,
--   transaction_id INT NOT NULL,
--   status TINYINT NOT NULL DEFAULT 1,
--   created_by INT NOT NULL,
--   created_at DATETIME NOT NULL,
--   updated_at DATETIME NOT NULL
-- );

-- CREATE TABLE pharmacy_sales_return_info (
--   id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
--   ledger_id INT NOT NULL,
--   party_id INT DEFAULT null,
--   remarks TEXT,
--   return_amount DECIMAL(65 , 2 ) DEFAULT '0.00',
--   sales_return_date_bs VARCHAR(50) NOT NULL,
--   sales_bill_amount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
--   sales_bill_discount_amount DECIMAL(65 , 2 ) DEFAULT '0.00',
--   sales_bill_no VARCHAR(50) NOT NULL,
--   sales_id INT NOT NULL,
--   sales_return_bill_number VARCHAR(50) NOT NULL,
--   sales_return_date_ad DATE NOT NULL,
--   total_taxable_amount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
--   vat_amount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
--   non_taxable_amount DECIMAL(19 , 2 ) DEFAULT "0.00",
--   vat_rate DECIMAL(19 , 2 ) DEFAULT NULL,
--   taxable_discount_amount DECIMAL(19 , 2 ) DEFAULT "0.00",
--   non_taxable_discount_amount DECIMAL(19 , 2 ) DEFAULT "0.00",
--   transaction_id INT NOT NULL,
--   functional_year_id INT NOT NULL,
--   branch_id INT NOT NULL,
--   status TINYINT NOT NULL DEFAULT 1,
--   created_by INT DEFAULT NULL,
--   created_at DATETIME NOT NULL,
--   updated_at DATETIME NOT NULL
-- );


-- CREATE TABLE pharmacy_sales_return_detail (
--   id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
--   ledger_id INT NOT NULL,
--   party_id INT DEFAULT NULL,
--   product_detail_id INT NOT NULL,
--   product_id INT NOT NULL,
--   type_name VARCHAR(50) DEFAULT NULL,
--   return_amount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
--   return_qty DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
--   sales_return_date_bs VARCHAR(50) NOT NULL,
--   sales_bill_no VARCHAR(50) NOT NULL,
--   sales_id INT NOT NULL,
--   sales_return_bill_number VARCHAR(50) NOT NULL,
--   sales_return_date_ad DATE NOT NULL,
--   sales_return_id INT NOT NULL,
--   sold_amount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
--   sold_qty DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
--   sold_rate DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
--   sold_unit_id INT NOT NULL,
--   sold_unit_type VARCHAR(25) NOT NULL,
--   transaction_id INT NOT NULL,
--   functional_year_id INT NOT NULL,
--   branch_id INT NOT NULL,
--   status TINYINT NOT NULL DEFAULT 1,
--   created_by INT DEFAULT NULL,
--   created_at DATETIME NOT NULL,
--   updated_at DATETIME NOT NULL
-- );


-- CREATE TABLE disease_group_info(
--   id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
--   disease_group_code INT NOT NULL,
--   disease_group_name TEXT CHARACTER SET UTF8MB4 COLLATE UTF8MB4_UNICODE_CI NOT NULL,
--   status TINYINT NOT NULL DEFAULT 1,
--   remarks TEXT DEFAULT NULL,
--   created_by INT NOT NULL,
--   created_at DATETIME NOT NULL,
--   updated_at DATETIME NOT NULL
-- );

-- CREATE TABLE disease_info(
--   id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
--   disease_code INT NOT NULL,
--   disease_name TEXT CHARACTER SET UTF8MB4 COLLATE UTF8MB4_UNICODE_CI NOT NULL,
--   disease_group_id INT NOT NULL,
--   status TINYINT NOT NULL DEFAULT 1,
--   remarks TEXT DEFAULT NULL,
--   created_by INT NOT NULL,
--   created_at DATETIME NOT NULL,
--   updated_at DATETIME NOT NULL
-- );



-- CREATE TABLE lab_group_info (
--   id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
--   lab_group_code INT NOT NULL,
--   group_name TEXT CHARACTER SET UTF8MB4 COLLATE UTF8MB4_UNICODE_CI NOT NULL,
--   status TINYINT NOT NULL DEFAULT 1,
--   remarks TEXT DEFAULT NULL,
--   created_by INT NOT NULL,
--   created_at DATETIME NOT NULL,
--   updated_at DATETIME NOT NULL
-- );


-- CREATE TABLE lab_test_info (
--   id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
--   lab_group_id INT NOT NULL,
--   lab_test_id INT NOT NULL,
--   status TINYINT NOT NULL DEFAULT 1,
--   remarks TEXT DEFAULT NULL,
--   created_by INT NOT NULL,
--   created_at DATETIME NOT NULL,
--   updated_at DATETIME NOT NULL
-- );


-- CREATE TABLE pharmacy_purchase_payment_info (
--   id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
--   comes_from VARCHAR(50) NOT NULL,
--   ledger_id INT NOT NULL,
--   payment_date_ad DATE NOT NULL,
--   payment_date_bs VARCHAR(50) NOT NULL,
--   payment_no VARCHAR(50) NOT NULL,
--   payment_type VARCHAR(50) NOT NULL,
--   remarks TEXT,
--   total_amount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
--   transaction_id INT NOT NULL,
--   functional_year_id INT NOT NULL,
--   branch_id INT NOT NULL,
--   status TINYINT NOT NULL DEFAULT 1,
--   created_by INT DEFAULT NULL,
--   created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
--   updated_at TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
-- );


-- CREATE TABLE pharmacy_purchase_payment_info_detail (
--   id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
--   amount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
--   cheque_no VARCHAR(65) DEFAULT NULL,
--   ledger_id INT NOT NULL,
--   payment_no VARCHAR(50) NOT NULL,
--   table_id INT NOT NULL,
--   transaction_id INT NOT NULL,
--   transaction_type VARCHAR(45) NOT NULL,
--   functional_year_id INT NOT NULL,
--   branch_id INT NOT NULL,
--   status TINYINT NOT NULL DEFAULT 1,
--   created_by INT DEFAULT NULL,
--   created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
--   updated_at TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
-- );


-- ALTER TABLE disease_group_info ADD CONSTRAINT fk_disease_group_info_user FOREIGN KEY (created_by) REFERENCES user(user_id);
-- ALTER TABLE disease_info ADD CONSTRAINT fk_disease_info_disease_group_id FOREIGN KEY (disease_group_id) REFERENCES disease_group_info(id);


-- ALTER TABLE disease_info ADD CONSTRAINT fk_disease_info_user FOREIGN KEY (created_by) REFERENCES user(user_id);

-- ALTER TABLE patient_info DROP FOREIGN KEY fk_patient_info_province;
-- ALTER TABLE patient_info DROP FOREIGN KEY fk_patient_info_district;
-- ALTER TABLE patient_info DROP FOREIGN KEY fk_patient_info_local_level;

-- ALTER TABLE patient_info MODIFY COLUMN province_id INT NOT NULL DEFAULT 0;
-- ALTER TABLE patient_info MODIFY COLUMN district_id INT NOT NULL DEFAULT 0;
-- ALTER TABLE patient_info MODIFY COLUMN local_level_id INT NOT NULL DEFAULT 0;

-- ALTER TABLE patient_info ADD COLUMN country VARCHAR(50) NOT NULL DEFAULT 'Nepal';
-- ALTER TABLE patient_info ADD COLUMN age_type VARCHAR(50) NOT NULL DEFAULT 'Year';

-- ALTER TABLE pharmacy_purchase_payment_info_detail ADD CONSTRAINT fk_pharmacy_purchase_payment_info_detail_ledger_id FOREIGN KEY (ledger_id) REFERENCES accounting_ledgerinfo(id);
-- ALTER TABLE pharmacy_purchase_payment_info_detail ADD CONSTRAINT fk_pharmacy_purchase_payment_info_detail_table_id FOREIGN KEY (table_id) REFERENCES pharmacy_purchase_payment_info(id);
-- ALTER TABLE pharmacy_purchase_payment_info_detail ADD CONSTRAINT fk_pharmacy_purchase_payment_info_detail_functional_year FOREIGN KEY (functional_year_id) REFERENCES functional_year(functional_year_id);
-- ALTER TABLE pharmacy_purchase_payment_info_detail ADD CONSTRAINT fk_pharmacy_purchase_payment_info_detail_branch FOREIGN KEY (branch_id) REFERENCES branch_info (branch_id);
-- ALTER TABLE pharmacy_purchase_payment_info_detail ADD CONSTRAINT fk_pharmacy_purchase_payment_info_detail_user FOREIGN KEY (created_by) REFERENCES user(user_id);

-- ALTER TABLE pharmacy_purchase_payment_info ADD CONSTRAINT fk_pharmacy_purchase_payment_info_ledger_id FOREIGN KEY (ledger_id) REFERENCES accounting_ledgerinfo(id);
-- ALTER TABLE pharmacy_purchase_payment_info ADD CONSTRAINT fk_pharmacy_purchase_payment_info_info_functional_year FOREIGN KEY (functional_year_id) REFERENCES functional_year(functional_year_id);
-- ALTER TABLE pharmacy_purchase_payment_info ADD CONSTRAINT fk_pharmacy_purchase_payment_info_branch FOREIGN KEY (branch_id) REFERENCES branch_info (branch_id);
-- ALTER TABLE pharmacy_purchase_payment_info ADD CONSTRAINT fk_pharmacy_purchase_payment_info_user FOREIGN KEY (created_by) REFERENCES user(user_id);


-- ALTER TABLE lab_test_info ADD CONSTRAINT fk_lab_test_info_lab_group_id FOREIGN KEY (lab_group_id) REFERENCES lab_group_info(id);
-- ALTER TABLE lab_test_info ADD CONSTRAINT fk_lab_test_info_lab_test_id FOREIGN KEY (lab_test_id) REFERENCES billing_title_info(billing_title_id);
-- ALTER TABLE lab_test_info ADD CONSTRAINT fk_lab_test_info_user FOREIGN KEY (created_by) REFERENCES user(user_id);

-- ALTER TABLE lab_group_info ADD CONSTRAINT fk_lab_group_info_user FOREIGN KEY (created_by) REFERENCES user(user_id);


-- ALTER TABLE pharmacy_purchase_info_detail ADD COLUMN discount_type VARCHAR(10);
-- ALTER TABLE pharmacy_purchase_info_detail ADD COLUMN sales_discount DECIMAL(19,2) DEFAULT "0.00"; 
-- ALTER TABLE pharmacy_stock_info ADD discount_type VARCHAR(10);
-- ALTER TABLE pharmacy_stock_info ADD COLUMN sales_discount DECIMAL(19,2) DEFAULT "0.00"; 
-- ALTER TABLE pharmacy_opening_stock_info ADD COLUMN discount_type VARCHAR(10);
-- ALTER TABLE pharmacy_opening_stock_info ADD COLUMN sales_discount DECIMAL(19,2) DEFAULT "0.00"; 

-- ALTER TABLE pharmacy_purchase_info_detail ADD COLUMN discount_percent DECIMAL(19,2) DEFAULT "0.00";

-- ALTER TABLE pharmacy_purchase_return_info ADD COLUMN return_type VARCHAR(50) NOT NULL DEFAULT 'PURCHASE_RETURN';

-- ALTER TABLE pharmacy_purchase_return_info_detail ADD COLUMN return_type VARCHAR(50) NOT NULL DEFAULT 'PURCHASE_RETURN';

-- ALTER TABLE pharmacy_purchase_return_info_detail DROP FOREIGN KEY fk_pharmacy_purchase_return_info_detail_purchase_id;

-- INSERT INTO accounting_ledger_mapping (id, label , ledger_id) VALUES (21,'Vat Payable' , 0);

-- ALTER TABLE pharmacy_purchase_return_info MODIFY COLUMN purchase_bill_no VARCHAR(45);

-- ALTER TABLE pharmacy_purchase_return_info DROP FOREIGN KEY fk_pharmacy_purchase_return_info_purchase_id;


-- ALTER TABLE pharmacy_sales_return_detail ADD CONSTRAINT fk_pharmacy_sales_return_detail_ledger_id FOREIGN KEY (ledger_id) REFERENCES accounting_ledgerinfo(id);
-- ALTER TABLE pharmacy_sales_return_detail ADD CONSTRAINT fk_pharmacy_sales_return_detail_functional_year FOREIGN KEY (functional_year_id) REFERENCES functional_year(functional_year_id);
-- ALTER TABLE pharmacy_sales_return_detail ADD CONSTRAINT fk_pharmacy_sales_return_detail_branch FOREIGN KEY (branch_id) REFERENCES branch_info (branch_id);
-- ALTER TABLE pharmacy_sales_return_detail ADD CONSTRAINT fk_pharmacy_sales_return_detail_user FOREIGN KEY (created_by) REFERENCES user(user_id);


-- ALTER TABLE pharmacy_sales_return_info ADD CONSTRAINT fk_pharmacy_sales_return_info_ledger_id FOREIGN KEY (ledger_id) REFERENCES accounting_ledgerinfo(id);
-- ALTER TABLE pharmacy_sales_return_info ADD CONSTRAINT fk_pharmacy_sales_return_info_info_functional_year FOREIGN KEY (functional_year_id) REFERENCES functional_year(functional_year_id);
-- ALTER TABLE pharmacy_sales_return_info ADD CONSTRAINT fk_pharmacy_sales_return_info_branch FOREIGN KEY (branch_id) REFERENCES branch_info (branch_id);
-- ALTER TABLE pharmacy_sales_return_info ADD CONSTRAINT fk_pharmacy_sales_return_info_user FOREIGN KEY (created_by) REFERENCES user(user_id);


-- ALTER TABLE pharmacy_sales_entry_info ADD CONSTRAINT fk_pharmacy_sales_entry_info_ledger_id FOREIGN KEY (ledger_id) REFERENCES accounting_ledgerinfo(id);
-- ALTER TABLE pharmacy_sales_entry_info ADD CONSTRAINT fk_pharmacy_sales_entry_info_info_functional_year FOREIGN KEY (functional_year_id) REFERENCES functional_year(functional_year_id);
-- ALTER TABLE pharmacy_sales_entry_info ADD CONSTRAINT fk_pharmacy_sales_entry_info_branch FOREIGN KEY (branch_id) REFERENCES branch_info (branch_id);
-- ALTER TABLE pharmacy_sales_entry_info ADD CONSTRAINT fk_pharmacy_sales_entry_info_user FOREIGN KEY (created_by) REFERENCES user(user_id);

-- ALTER TABLE pharmacy_sales_entry_detail ADD CONSTRAINT fk_pharmacy_sales_entry_detail_ledger_id FOREIGN KEY (ledger_id) REFERENCES accounting_ledgerinfo(id);
-- ALTER TABLE pharmacy_sales_entry_detail ADD CONSTRAINT fk_pharmacy_sales_entry_detail_info_functional_year FOREIGN KEY (functional_year_id) REFERENCES functional_year(functional_year_id);
-- ALTER TABLE pharmacy_sales_entry_detail ADD CONSTRAINT fk_pharmacy_sales_entry_detail_branch FOREIGN KEY (branch_id) REFERENCES branch_info (branch_id);
-- ALTER TABLE pharmacy_sales_entry_detail ADD CONSTRAINT fk_pharmacy_sales_entry_detail_user FOREIGN KEY (created_by) REFERENCES user(user_id);


-- ALTER TABLE pharmacy_sales_payment_info ADD CONSTRAINT fk_pharmacy_sales_payment_info_sales_id FOREIGN KEY (sales_id) REFERENCES pharmacy_sales_entry_info(id);

-- ALTER TABLE pdc_info ADD CONSTRAINT fk_pdc_info_party_ledger_id FOREIGN KEY (party_ledger_id) REFERENCES accounting_ledgerinfo(id);
-- ALTER TABLE pdc_info ADD CONSTRAINT fk_pdc_info_created_by FOREIGN KEY (created_by) REFERENCES user(user_id);

-- INSERT INTO version_info (version,description) 
-- VALUES (
--     '3.0.0',
--     'SALES ENTRY,
--      OPENING STOCK RETURN,
--      MODIFY purchase return tables,
--      SALES RETURN,
--      pdc_info 
--     '
-- );

-- INSERT INTO version_info (version,description) 
-- VALUES (
--   '3.1.0',
--   'disease group entry,
--    disease group mapping with disease,
--    lab group entry,
--    lab group mapping with lab test,
--    lab test entry,
--    pharmacy purchase payment entry,
--    sales bill number auto from index info,
--    add discount_type and sales_dis_percent in purchase_info details, stock_info andopening_stock_info ,
--    remove foreign key of province_id, district_id, local_level_id  and add country and age_type column in patient_info
--   '
-- );