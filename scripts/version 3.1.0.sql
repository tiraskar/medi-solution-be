ALTER TABLE patient_info DROP FOREIGN KEY fk_patient_info_province;
ALTER TABLE patient_info DROP FOREIGN KEY fk_patient_info_district;
ALTER TABLE patient_info DROP FOREIGN KEY fk_patient_info_local_level;

ALTER TABLE patient_info MODIFY COLUMN province_id INT NOT NULL DEFAULT 0;
ALTER TABLE patient_info MODIFY COLUMN district_id INT NOT NULL DEFAULT 0;
ALTER TABLE patient_info MODIFY COLUMN local_level_id INT NOT NULL DEFAULT 0;


ALTER TABLE patient_info ADD COLUMN country VARCHAR(50) NOT NULL DEFAULT 'Nepal';
ALTER TABLE patient_info ADD COLUMN age_type VARCHAR(50) NOT NULL DEFAULT 'Year';

CREATE TABLE disease_group_info(
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  disease_group_code INT NOT NULL,
  disease_group_name TEXT CHARACTER SET UTF8MB4 COLLATE UTF8MB4_UNICODE_CI NOT NULL,
  status TINYINT NOT NULL DEFAULT 1,
  remarks TEXT DEFAULT NULL,
  created_by INT NOT NULL,
  created_at DATETIME NOT NULL,
  updated_at DATETIME NOT NULL
);

ALTER TABLE disease_group_info ADD CONSTRAINT fk_disease_group_info_user FOREIGN KEY (created_by) REFERENCES user(user_id);

CREATE TABLE disease_info(
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  disease_code INT NOT NULL,
  disease_name TEXT CHARACTER SET UTF8MB4 COLLATE UTF8MB4_UNICODE_CI NOT NULL,
  disease_group_id INT NOT NULL,
  status TINYINT NOT NULL DEFAULT 1,
  remarks TEXT DEFAULT NULL,
  created_by INT NOT NULL,
  created_at DATETIME NOT NULL,
  updated_at DATETIME NOT NULL
);

ALTER TABLE disease_info ADD CONSTRAINT fk_disease_info_disease_group_id FOREIGN KEY (disease_group_id) REFERENCES disease_group_info(id);
ALTER TABLE disease_info ADD CONSTRAINT fk_disease_info_user FOREIGN KEY (created_by) REFERENCES user(user_id);


CREATE TABLE lab_group_info (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  lab_group_code INT NOT NULL,
  group_name TEXT CHARACTER SET UTF8MB4 COLLATE UTF8MB4_UNICODE_CI NOT NULL,
  status TINYINT NOT NULL DEFAULT 1,
  remarks TEXT DEFAULT NULL,
  created_by INT NOT NULL,
  created_at DATETIME NOT NULL,
  updated_at DATETIME NOT NULL
);

ALTER TABLE lab_group_info ADD CONSTRAINT fk_lab_group_info_user FOREIGN KEY (created_by) REFERENCES user(user_id);

CREATE TABLE lab_test_info (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  lab_group_id INT NOT NULL,
  lab_test_id INT NOT NULL,
  status TINYINT NOT NULL DEFAULT 1,
  remarks TEXT DEFAULT NULL,
  created_by INT NOT NULL,
  created_at DATETIME NOT NULL,
  updated_at DATETIME NOT NULL
);

ALTER TABLE lab_test_info ADD CONSTRAINT fk_lab_test_info_lab_group_id FOREIGN KEY (lab_group_id) REFERENCES lab_group_info(id);
ALTER TABLE lab_test_info ADD CONSTRAINT fk_lab_test_info_lab_test_id FOREIGN KEY (lab_test_id) REFERENCES billing_title_info(billing_title_id);
ALTER TABLE lab_test_info ADD CONSTRAINT fk_lab_test_info_user FOREIGN KEY (created_by) REFERENCES user(user_id);

INSERT INTO index_info (functional_year_id, title, index_code, max_id)
			VALUES(8,'sales_bill_number', 'SBN', 0);

ALTER TABLE pharmacy_purchase_info_detail ADD COLUMN sales_dis_percent DECIMAL(19,2) DEFAULT NULL;
ALTER TABLE pharmacy_purchase_info_detail ADD COLUMN sales_discount DECIMAL(19,2) DEFAULT NULL; 

ALTER TABLE pharmacy_stock_info ADD COLUMN sales_dis_percent DECIMAL(19,2) DEFAULT NULL;
ALTER TABLE pharmacy_stock_info ADD COLUMN sales_discount DECIMAL(19,2) DEFAULT NULL; 

ALTER TABLE pharmacy_opening_stock_info ADD COLUMN sales_dis_percent DECIMAL(19,2) DEFAULT NULL;
ALTER TABLE pharmacy_opening_stock_info ADD COLUMN sales_discount DECIMAL(19,2) DEFAULT NULL; 

ALTER TABLE pharmacy_purchase_info_detail ADD COLUMN discount_percent DECIMAL(19,2) DEFAULT NULL;

CREATE TABLE pharmacy_purchase_payment_info (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    comes_from VARCHAR(50) NOT NULL,
    ledger_id INT NOT NULL,
    payment_date_ad DATE NOT NULL,
    payment_date_bs VARCHAR(50) NOT NULL,
    payment_no VARCHAR(50) NOT NULL,
    payment_type VARCHAR(50) NOT NULL,
    remarks TEXT,
    total_amount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
    transaction_id INT NOT NULL,
    functional_year_id INT NOT NULL,
    branch_id INT NOT NULL,
    status TINYINT NOT NULL DEFAULT 1,
    created_by INT DEFAULT NULL,
    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
);

ALTER TABLE pharmacy_purchase_payment_info ADD CONSTRAINT fk_pharmacy_purchase_payment_info_ledger_id FOREIGN KEY (ledger_id) REFERENCES accounting_ledgerinfo(id);
ALTER TABLE pharmacy_purchase_payment_info ADD CONSTRAINT fk_pharmacy_purchase_payment_info_info_functional_year FOREIGN KEY (functional_year_id) REFERENCES functional_year(functional_year_id);
ALTER TABLE pharmacy_purchase_payment_info ADD CONSTRAINT fk_pharmacy_purchase_payment_info_branch FOREIGN KEY (branch_id) REFERENCES branch_info (branch_id);
ALTER TABLE pharmacy_purchase_payment_info ADD CONSTRAINT fk_pharmacy_purchase_payment_info_user FOREIGN KEY (created_by) REFERENCES user(user_id);

CREATE TABLE pharmacy_purchase_payment_info_detail (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    amount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
    cheque_no VARCHAR(65) DEFAULT NULL,
    ledger_id INT NOT NULL,
    payment_no VARCHAR(50) NOT NULL,
    table_id INT NOT NULL,
    transaction_id INT NOT NULL,
    transaction_type VARCHAR(45) NOT NULL,
    functional_year_id INT NOT NULL,
    branch_id INT NOT NULL,
    status TINYINT NOT NULL DEFAULT 1,
    created_by INT DEFAULT NULL,
    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
);

ALTER TABLE pharmacy_purchase_payment_info_detail ADD CONSTRAINT fk_pharmacy_purchase_payment_info_detail_ledger_id FOREIGN KEY (ledger_id) REFERENCES accounting_ledgerinfo(id);
ALTER TABLE pharmacy_purchase_payment_info_detail ADD CONSTRAINT fk_pharmacy_purchase_payment_info_detail_table_id FOREIGN KEY (table_id) REFERENCES pharmacy_purchase_payment_info(id);
ALTER TABLE pharmacy_purchase_payment_info_detail ADD CONSTRAINT fk_pharmacy_purchase_payment_info_detail_functional_year FOREIGN KEY (functional_year_id) REFERENCES functional_year(functional_year_id);
ALTER TABLE pharmacy_purchase_payment_info_detail ADD CONSTRAINT fk_pharmacy_purchase_payment_info_detail_branch FOREIGN KEY (branch_id) REFERENCES branch_info (branch_id);
ALTER TABLE pharmacy_purchase_payment_info_detail ADD CONSTRAINT fk_pharmacy_purchase_payment_info_detail_user FOREIGN KEY (created_by) REFERENCES user(user_id);


ALTER TABLE pharmacy_purchase_info_detail CHANGE COLUMN sales_dis_percent discount_type VARCHAR(10);
ALTER TABLE pharmacy_stock_info CHANGE COLUMN sales_dis_percent discount_type VARCHAR(10);
ALTER TABLE pharmacy_opening_stock_info CHANGE COLUMN sales_dis_percent discount_type VARCHAR(10);


ALTER TABLE pharmacy_sales_entry_info ADD COLUMN department_id INT DEFAULT NULL, ADD COLUMN phone_number VARCHAR(15) DEFAULT NULL,ADD COLUMN patient_id INT DEFAULT NULL;


INSERT INTO version_info (version,description) 
VALUES (
    '3.1.0',
    'disease group entry,
     disease group mapping with disease,
     lab group entry,
     lab group mapping with lab test,
     lab test entry,
     pharmacy purchase payment entry,
     sales bill number auto from index info,
     add discount_type and sales_dis_percent in purchase_info details, stock_info and opening_stock_info ,
     remove foreign key of province_id, district_id, local_level_id  and add country and age_type column in patient_info
    '
);