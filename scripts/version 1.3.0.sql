START TRANSACTION;

CREATE TABLE user_permission_info(
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  user_id INT NOT NULL,
  permission JSON NOT NULL,
  status TINYINT NOT NULL DEFAULT 1,
  created_by INT DEFAULT NULL,
  created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
);

ALTER TABLE user_permission_info ADD CONSTRAINT fk_user_permission_info_user_id FOREIGN KEY (user_id) REFERENCES user(user_id);

CREATE TABLE doctors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    degree VARCHAR(255) NOT NULL,
    namc_no VARCHAR(255) NOT NULL,
    status TINYINT NOT NULL DEFAULT 1,
    created_by INT NOT NULL,
    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
);

ALTER TABLE doctors ADD CONSTRAINT fj_doctors_user FOREIGN KEY (created_by) REFERENCES user(user_id);

CREATE TABLE available_days (
    id INT AUTO_INCREMENT PRIMARY KEY,
    doctor_id INT NOT NULL,
    day VARCHAR(50) NOT NULL,
    status TINYINT NOT NULL DEFAULT 1,
    created_by INT NOT NULL,
    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
);

ALTER TABLE available_days ADD CONSTRAINT fk_available_days_doctor_id FOREIGN KEY (doctor_id) REFERENCES doctors(id);
ALTER TABLE available_days ADD CONSTRAINT fk_available_days_user FOREIGN KEY (created_by) REFERENCES user(user_id);

ALTER TABLE billing_high_level_info ADD column comes_from VARCHAR(255) NOT NULL;

SET SQL_SAFE_UPDATES = 0;
UPDATE billing_high_level_info AS bhl
SET bhl.comes_from = (
    SELECT
        CASE
		    WHEN pf.registration_type = 'NEW_PATIENT_REGISTRATION' THEN 'NEW_PATIENT_REGISTRATION'
            WHEN pf.registration_type='OLD_PATIENT_REGISTRATION' THEN 'OLD_PATIENT_REGISTRATION'
            ELSE 'OPD_BILLING'
        END
    FROM billing_info AS bi
    LEFT JOIN patient_follow_up_info AS pf ON bi.receipt_id = pf.receipt_id
    WHERE bi.billing_high_level_info_id = bhl.id LIMIT 1
)
WHERE EXISTS (
    SELECT 1
    FROM billing_info AS bi
	LEFT JOIN patient_follow_up_info AS pf ON bi.receipt_id = pf.receipt_id
    WHERE bi.billing_high_level_info_id = bhl.id LIMIT 1
);
SET SQL_SAFE_UPDATES = 1;

CREATE TABLE log_info (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  module_name VARCHAR(255) NOT NULL,
  table_name VARCHAR(255) NOT NULL,
  row_id INT NOT NULL,
  new_value TEXT CHARACTER SET UTF8MB4 COLLATE UTF8MB4_UNICODE_CI DEFAULT NULL,
  old_value TEXT CHARACTER SET UTF8MB4 COLLATE UTF8MB4_UNICODE_CI DEFAULT NULL,
  operation VARCHAR(55) NOT NULL,
  remarks TEXT NOT NULL,
  user_id INT NOT NULL,
  transaction_date DATETIME NOT NULL,
  created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
);

ALTER TABLE log_info ADD CONSTRAINT fk_log_info_user_id FOREIGN KEY (user_id) REFERENCES user(user_id);

CREATE TABLE accounting_log_info(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    module_name VARCHAR(255) NOT NULL,
    new_value TEXT CHARACTER SET UTF8MB4 COLLATE UTF8MB4_UNICODE_CI DEFAULT NULL,
    old_value TEXT CHARACTER SET UTF8MB4 COLLATE UTF8MB4_UNICODE_CI DEFAULT NULL,
    operation_performed VARCHAR(255) NOT NULL,
    table_name VARCHAR(255) NOT NULL,
    transaction_date DATETIME NOT NULL,
    user_id INT DEFAULT NULL,
    remarks TEXT NOT NULL,
    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
);

ALTER TABLE accounting_log_info ADD CONSTRAINT fk_accounting_log_info_user_id FOREIGN KEY (user_id) REFERENCES user(user_id);



CREATE TABLE accounting_ledgergroup(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  ledger_group_name VARCHAR(255) NOT NULL,
  formula TEXT NOT NULL,
  is_editable TINYINT NOT NULL DEFAULT 0,
  status TINYINT NOT NULL DEFAULT 1,
  created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE accounting_ledgersub_group(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  sub_group_name VARCHAR(255) NOT NULL,
  is_editable TINYINT NOT NULL DEFAULT 0,
  status TINYINT NOT NULL DEFAULT 1,
  created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE accounting_ledgerinfo(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  ledgername VARCHAR(255) NOT NULL,
  ledger_type VARCHAR(255) NOT NULL,
  master_ledger_group_id INT NOT NULL,
  ledger_sub_group_id INT DEFAULT NULL,
  address VARCHAR(255) DEFAULT NULL,
  contact VARCHAR(255) DEFAULT NULL,
  opening_balance DOUBLE(50,2) DEFAULT 0.0,
  opening_balance_date DATE NOT NULL,
  functional_year_id INT NOT NULL,
  branch_id INT NOT NULL,
  status TINYINT NOT NULL DEFAULT 1,
  created_by INT DEFAULT NULL,
  created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
);

ALTER TABLE accounting_ledgerinfo ADD CONSTRAINT fk_accounting_ledgerinfo_master_ledger_group_id FOREIGN KEY (master_ledger_group_id) REFERENCES accounting_ledgergroup(id);

ALTER TABLE accounting_ledgerinfo ADD CONSTRAINT fk_accounting_ledgerinfo_ledger_sub_group_id FOREIGN KEY (ledger_sub_group_id) REFERENCES accounting_ledgersub_group(id);

ALTER TABLE accounting_ledgerinfo ADD CONSTRAINT fk_accounting_ledgerinfo_functional_year FOREIGN KEY (functional_year_id) REFERENCES functional_year (functional_year_id);

ALTER TABLE accounting_ledgerinfo ADD CONSTRAINT fk_accounting_ledgerinfo_branch FOREIGN KEY (branch_id) REFERENCES branch_info (branch_id);

ALTER TABLE accounting_ledgerinfo ADD CONSTRAINT fk_accounting_ledgerinfo_user FOREIGN KEY (created_by) REFERENCES user(user_id);

CREATE TABLE accounting_transaction_detail(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  comes_from VARCHAR(255) NOT NULL,
  ledger_id INT NOT NULL,
  credit DOUBLE(50,2) NOT NULL,
  debit DOUBLE (50,2) NOT NULL,
  narration TEXT DEFAULT NULL,
  particular TEXT DEFAULT NULL,
  particular_id INT DEFAULT NULL,
  table_id INT DEFAULT NULL,
  transaction_id INT DEFAULT NULL,
  voucher_date_ad DATE NOT NULL,
  voucher_date_bs VARCHAR(255) NOT NULL,
  voucher_number VARCHAR(255) DEFAULT NULL,
  voucher_type VARCHAR(255) DEFAULT NULL,
  functional_year_id INT NOT NULL,
  branch_id INT NOT NULL,
  status TINYINT NOT NULL DEFAULT 1,
  created_by INT DEFAULT NULL,
  created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
);

ALTER TABLE accounting_transaction_detail ADD CONSTRAINT fk_accounting_transaction_detail_ledger_id FOREIGN KEY (ledger_id) REFERENCES accounting_ledgerinfo(id);

ALTER TABLE accounting_transaction_detail ADD CONSTRAINT fk_accounting_transaction_detail_functional_year FOREIGN KEY (functional_year_id) REFERENCES functional_year (functional_year_id);

ALTER TABLE accounting_transaction_detail ADD CONSTRAINT fk_accounting_transaction_detail_branch FOREIGN KEY (branch_id) REFERENCES branch_info (branch_id);

ALTER TABLE accounting_transaction_detail ADD CONSTRAINT fk_accounting_transaction_detail_user FOREIGN KEY (created_by) REFERENCES user(user_id);



INSERT INTO accounting_ledgergroup (ledger_group_name,formula) VALUES ('Account Payable','credit-debit');

INSERT INTO accounting_ledgergroup (ledger_group_name,formula) VALUES ('Account Receivable','debit-credit');

INSERT INTO accounting_ledgergroup (ledger_group_name,formula) VALUES ('Bank Account','debit-credit');

INSERT INTO accounting_ledgergroup (ledger_group_name,formula) VALUES ('Bank OCC Account','credit-debit');

INSERT INTO accounting_ledgergroup (ledger_group_name,formula) VALUES ('Bank OD Account','credit-debit');

INSERT INTO accounting_ledgergroup (ledger_group_name,formula) VALUES ('Capital A/c','credit-debit');

INSERT INTO accounting_ledgergroup (ledger_group_name,formula) VALUES ('Cash in Hand','debit-credit');

INSERT INTO accounting_ledgergroup (ledger_group_name,formula) VALUES ('Current Assets','debit-credit');

INSERT INTO accounting_ledgergroup (ledger_group_name,formula) VALUES ('Current Liabilities','credit-debit');

INSERT INTO accounting_ledgergroup (ledger_group_name,formula) VALUES ('Direct Expenses','debit-credit');

INSERT INTO accounting_ledgergroup (ledger_group_name,formula) VALUES ('Direct Income','credit-debit');

INSERT INTO accounting_ledgergroup (ledger_group_name,formula) VALUES ('Duties and Tax','debit-credit');

INSERT INTO accounting_ledgergroup (ledger_group_name,formula) VALUES ('Fix Assets','debit-credit');

INSERT INTO accounting_ledgergroup (ledger_group_name,formula) VALUES ('Indirect Expenses','debit-credit');

INSERT INTO accounting_ledgergroup (ledger_group_name,formula) VALUES ('Indirect Income','credit-debit');

INSERT INTO accounting_ledgergroup (ledger_group_name,formula) VALUES ('Investment','debit-credit');

INSERT INTO accounting_ledgergroup (ledger_group_name,formula) VALUES ('Loan and Advance','debit-credit');

INSERT INTO accounting_ledgergroup (ledger_group_name,formula) VALUES ('Loans','credit-debit');

INSERT INTO accounting_ledgergroup (ledger_group_name,formula) VALUES ( 'Provision','credit-debit');

INSERT INTO accounting_ledgergroup (ledger_group_name,formula) VALUES ('Purchase','debit-credit');

INSERT INTO accounting_ledgergroup (ledger_group_name,formula) VALUES ('Sales','credit-debit');        

INSERT INTO accounting_ledgergroup (ledger_group_name,formula) VALUES ('Mics. Expenses (assets)','debit-credit');

INSERT INTO accounting_ledgergroup (ledger_group_name,formula) VALUES ('Reserve and surplus','credit-debit');

INSERT INTO accounting_ledgergroup (ledger_group_name,formula) VALUES ('Retained Earning','credit-debit');

INSERT INTO accounting_ledgergroup (ledger_group_name,formula) VALUES ('Stock In hand (closing stock)','debit-credit');

INSERT INTO accounting_ledgergroup (ledger_group_name,formula) VALUES ('Sundry Creditors','credit-debit');

INSERT INTO accounting_ledgergroup (ledger_group_name,formula) VALUES ('Sundry Debtors','debit-credit');

INSERT INTO accounting_ledgergroup (ledger_group_name,formula) VALUES ('Suspense a/c','debit-credit');

INSERT INTO accounting_ledgergroup (ledger_group_name,formula) VALUES ('Unsecured Loan','credit-debit');

INSERT INTO accounting_ledgergroup (ledger_group_name,formula) VALUES ('Stock In hand (opening Stock)','debit-credit');

INSERT INTO accounting_ledgergroup (ledger_group_name,formula) VALUES ('Secured Loan','credit-debit');

INSERT INTO accounting_ledgergroup (ledger_group_name,formula) VALUES ('Bonus Share','debit-credit');

INSERT INTO accounting_ledgergroup (ledger_group_name,formula) VALUES ('Short Term Loan','credit-debit');

INSERT INTO accounting_ledgergroup (ledger_group_name,formula) VALUES ('Share Capital','credit-debit');





INSERT INTO accounting_ledgersub_group (sub_group_name) VALUES ('Carriage inward expenses');

INSERT INTO accounting_ledgersub_group (sub_group_name) VALUES ('Manufacturing expenses');

INSERT INTO accounting_ledgersub_group (sub_group_name) VALUES ('Administrative expenses');

INSERT INTO accounting_ledgersub_group (sub_group_name) VALUES ('Selling & distributions expenses');

INSERT INTO accounting_ledgersub_group (sub_group_name) VALUES ('Financial expenses');

INSERT INTO accounting_ledgersub_group (sub_group_name) VALUES ('Non- operating income');

INSERT INTO accounting_ledgersub_group (sub_group_name) VALUES ('Preliminary expenses');

INSERT INTO accounting_ledgersub_group (sub_group_name) VALUES ('Interest Paid');



CREATE TABLE patient_admission_info(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  patient_id INT NOT NULL,
  admit_date_bs VARCHAR(45) NOT NULL,
  admit_date_ad DATE NOT NULL,
  ward VARCHAR(255) NOT NULL,
  bed_no VARCHAR(255) NOT NULL,
  deposit_amount DOUBLE(50,2) NOT NULL DEFAULT 0,
  ledger_id INT NOT NULL,
  functional_year_id INT NOT NULL,
  branch_id INT NOT NULL,
  status TINYINT NOT NULL DEFAULT 1,
  created_by INT DEFAULT NULL,
  created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
);

ALTER TABLE patient_admission_info ADD CONSTRAINT fk_patient_admission_info_patient_id FOREIGN KEY (patient_id) REFERENCES patient_info (patient_id);

ALTER TABLE patient_admission_info ADD CONSTRAINT fk_patient_admission_info_ledger_id FOREIGN KEY (ledger_id) REFERENCES accounting_ledgerinfo(id);

ALTER TABLE patient_admission_info ADD CONSTRAINT fk_patient_admission_info_user FOREIGN KEY (created_by) REFERENCES user(user_id);

ALTER TABLE patient_admission_info ADD CONSTRAINT fk_patient_admission_info_functional_year FOREIGN KEY (functional_year_id) REFERENCES functional_year (functional_year_id);

ALTER TABLE patient_admission_info ADD CONSTRAINT fk_patient_admission_info_branch FOREIGN KEY (branch_id) REFERENCES branch_info (branch_id);



INSERT INTO label_info (label_name, status) VALUES ("PATIENT_ADMISSION_DEPOSIT", 1);


ALTER TABLE patient_follow_up_info ADD COLUMN doctor_id INT DEFAULT NULL;
ALTER TABLE patient_follow_up_info ADD CONSTRAINT fk_patient_follow_up_doctor FOREIGN KEY (doctor_id) REFERENCES doctors(id);


INSERT INTO version_info (version,description) 
VALUES (
    '1.3.0',
    ' added user registration and permission module,
      added doctor registration module,
      added comes_from in opd_billing pagination,
      added edit option in department,billing_title,user,patient and opd billing with log,
      added delete option in opd billing,
      added patient admission module,
      added doctor in patient_registration module
    '
);

COMMIT;