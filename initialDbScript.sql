
CREATE TABLE user (
    user_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) DEFAULT NULL,
    contact VARCHAR(50) DEFAULT NULL,
    user_type VARCHAR(45) NOT NULL DEFAULT 'user',
    status TINYINT NOT NULL DEFAULT 1,
    created_by INT DEFAULT NULL,
    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    last_password_changed_in DATETIME DEFAULT NULL
);


CREATE TABLE refresh_tokens (
  id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  user_id int NOT NULL,
  refresh_token text DEFAULT NULL,
  status TINYINT NOT NULL DEFAULT 1,
  created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE functional_year (
    functional_year_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    functional_year VARCHAR(50) NOT NULL,
    functional_year_start_ad DATE NOT NULL,
    functional_year_start_bs VARCHAR(45) NOT NULL,
    functional_year_end_ad DATE NOT NULL,
    functional_year_end_bs VARCHAR(45) NOT NULL,
    status TINYINT NOT NULL DEFAULT 1,
    created_by INT NOT NULL,
    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE branch_info (
    branch_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    branch_code INT NOT NULL,
    name TEXT CHARACTER SET UTF8MB4 COLLATE UTF8MB4_UNICODE_CI NOT NULL,
    address TEXT CHARACTER SET UTF8MB4 COLLATE UTF8MB4_UNICODE_CI DEFAULT NULL,
    contact TEXT CHARACTER SET UTF8MB4 COLLATE UTF8MB4_UNICODE_CI DEFAULT NULL,
    status TINYINT NOT NULL DEFAULT 1,
    created_by INT NOT NULL,
    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE department_info (
    department_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    department_code INT NOT NULL,
    department_name TEXT CHARACTER SET UTF8MB4 COLLATE UTF8MB4_UNICODE_CI NOT NULL,
    branch_id INT NOT NULL,
    functional_year_id INT NOT NULL,
    status TINYINT DEFAULT 1,
    created_by INT NOT NULL,
    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE billing_title_info (
    billing_title_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    department_id INT NOT NULL,
    billing_title_code INT NOT NULL,
    billing_title TEXT CHARACTER SET UTF8MB4 COLLATE UTF8MB4_UNICODE_CI NOT NULL,
    rate DOUBLE(50,2) NOT NULL,
    branch_id INT NOT NULL,
    functional_year_id INT NOT NULL,
    status TINYINT DEFAULT 1,
    created_by INT NOT NULL,
    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE caste_info (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    caste_code INT NOT NULL,
    caste_eng TEXT CHARACTER SET UTF8MB4 COLLATE UTF8MB4_UNICODE_CI NOT NULL,
    caste_nep TEXT CHARACTER SET UTF8MB4 COLLATE UTF8MB4_UNICODE_CI NOT NULL,
    status TINYINT NOT NULL DEFAULT 1,
    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS province (
  id int NOT NULL AUTO_INCREMENT,
  province_eng TEXT COLLATE utf8mb4_unicode_ci NOT NULL,
  province_nep TEXT COLLATE utf8mb4_unicode_ci NOT NULL,
  hq_eng TEXT COLLATE utf8mb4_unicode_ci NOT NULL,
  hq_nep TEXT COLLATE utf8mb4_unicode_ci NOT NULL,
  isDefault TINYINT DEFAULT 0,
  status TINYINT NOT NULL DEFAULT 1,
  created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
) CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS district (
  id int NOT NULL AUTO_INCREMENT,
  district_eng TEXT COLLATE utf8mb4_unicode_ci NOT NULL,
  district_nep TEXT COLLATE utf8mb4_unicode_ci NOT NULL,
  hq_eng TEXT COLLATE utf8mb4_unicode_ci NOT NULL,
  hq_nep TEXT COLLATE utf8mb4_unicode_ci NOT NULL,
  province_id int NOT NULL,
  isDefault TINYINT DEFAULT 0,
  status TINYINT NOT NULL DEFAULT 1,
  created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
) CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS local_level_type (
  id int NOT NULL AUTO_INCREMENT,
  type_nep TEXT COLLATE utf8mb4_unicode_ci NOT NULL,
  type_eng TEXT COLLATE utf8mb4_unicode_ci NOT NULL,
  status TINYINT NOT NULL DEFAULT 1,
  created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
) CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS local_level (
  id int NOT NULL AUTO_INCREMENT,
  local_level_name_eng TEXT COLLATE utf8mb4_unicode_ci NOT NULL,
  local_level_name_nep TEXT COLLATE utf8mb4_unicode_ci NOT NULL,
  district_id int NOT NULL,
  local_level_type_id int NOT NULL,
  total_wards int NOT NULL,
  status TINYINT NOT NULL DEFAULT 1,
  created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
) CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE patients (
  id INT AUTO_INCREMENT PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT,
    age INT NOT NULL,
    gender TEXT NOT NULL,
    contact TEXT NOT NULL,
    disease TEXT,
    doctor_name VARCHAR(255),
    appointment_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);



CREATE TABLE patient_info(
   patient_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   first_name TEXT CHARACTER SET UTF8MB4 COLLATE UTF8MB4_UNICODE_CI NOT NULL,
   middle_name TEXT CHARACTER SET UTF8MB4 COLLATE UTF8MB4_UNICODE_CI DEFAULT NULL,
   last_name TEXT CHARACTER SET UTF8MB4 COLLATE UTF8MB4_UNICODE_CI NOT NULL,
   age INT NOT NULL,
   gender TEXT CHARACTER SET UTF8MB4 COLLATE UTF8MB4_UNICODE_CI NOT NULL,
   caste TEXT CHARACTER SET UTF8MB4 COLLATE UTF8MB4_UNICODE_CI NOT NULL,
   province TEXT CHARACTER SET UTF8MB4 COLLATE UTF8MB4_UNICODE_CI NOT NULL,
   country VARCHAR(50) NOT NULL DEFAULT 'Nepal',
   age_type VARCHAR(50) NOT NULL DEFAULT 'Year',
   province_id INT NOT NULL DEFAULT 0,
   district TEXT CHARACTER SET UTF8MB4 COLLATE UTF8MB4_UNICODE_CI NOT NULL,
   district_id INT NOT NULL DEFAULT 0,
   local_level_name TEXT CHARACTER SET UTF8MB4 COLLATE UTF8MB4_UNICODE_CI NOT NULL,
   local_level_id INT NOT NULL DEFAULT 0,
   ward_no INT NOT NULL,
   toll_name TEXT CHARACTER SET UTF8MB4 COLLATE UTF8MB4_UNICODE_CI NOT NULL,
   contact TEXT CHARACTER SET UTF8MB4 COLLATE UTF8MB4_UNICODE_CI NOT NULL,
   referred_from TEXT CHARACTER SET UTF8MB4 COLLATE UTF8MB4_UNICODE_CI DEFAULT NULL,
   referred_to TEXT CHARACTER SET UTF8MB4 COLLATE UTF8MB4_UNICODE_CI DEFAULT NULL,
   registration_date_ad DATE NOT NULL,
   registration_date_bs VARCHAR(45) NOT NULL,
   branch_id INT NOT NULL,
   functional_year_id INT NOT NULL,
   status TINYINT NOT NULL DEFAULT 1,
   created_by INT NOT NULL,
   created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

ALTER TABLE patient_info
ADD COLUMN disease TEXT,
ADD COLUMN doctor_name VARCHAR(255),
ADD COLUMN appointment_date DATE;


-- CREATE TABLE patients (
--     id INT AUTO_INCREMENT PRIMARY KEY,
--     name VARCHAR(255) NOT NULL,
--     age INT NOT NULL,
--     gender ENUM('Male', 'Female', 'Other') NOT NULL,
--     contact VARCHAR(10) NOT NULL,
--     disease VARCHAR(255) NOT NULL,
--     doctor VARCHAR(255) NOT NULL,
--     appointment_date DATE NOT NULL,
--     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
-- );


CREATE TABLE index_info(
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  functional_year_id INT NOT NULL,
  title VARCHAR(255) NOT NULL,
  index_code VARCHAR(45) NOT NULL,
  max_id INT NOT NULL,
  status TINYINT NOT NULL DEFAULT 1,
  created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


CREATE TABLE billing_info (
    receipt_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    receipt_no VARCHAR(255) NOT NULL,
    patient_id INT NOT NULL,
    billing_title_id INT NOT NULL,
    qty INT NOT NULL DEFAULT 1,
    amount DOUBLE(50,2) NOT NULL,
    tender_amount DOUBLE(50,2) DEFAULT 0.0,
    return_amount DOUBLE(50,2) DEFAULT 0.0,
    receipt_date_ad DATE NOT NULL,
    receipt_date_bs VARCHAR(45) NOT NULL,
    payment_mode VARCHAR(45) DEFAULT "CASH",
    remarks TEXT CHARACTER SET UTF8MB4 COLLATE UTF8MB4_UNICODE_CI DEFAULT NULL,
    transaction_id INT NOT NULL,
    functional_year_id INT NOT NULL,
    branch_id INT NOT NULL,
    status TINYINT NOT NULL DEFAULT 1,
    created_by INT DEFAULT NULL,
    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


CREATE TABLE patient_follow_up_info (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    billing_title_id INT DEFAULT NULL,
    receipt_id INT DEFAULT NULL,
    date_ad DATE NOT NULL,
    date_bs VARCHAR(45) NOT NULL,
    registration_type VARCHAR(255) DEFAULT NULL,
    isFreeRegistration BOOLEAN NOT NULL DEFAULT false,
    queue_no INT NOT NULL,
    doctor_id INT DEFAULT NULL,
	  functional_year_id INT NOT NULL,
    branch_id INT NOT NULL,
	  status TINYINT NOT NULL DEFAULT 1,
    created_by INT DEFAULT NULL,
    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE label_info(
   id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   label_name VARCHAR(255) NOT NULL,
   status TINYINT NOT NULL DEFAULT 1
);


CREATE TABLE billing_title_mapping_info(
   id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   billing_title_id INT NOT NULL,
   label_id INT NOT NULL,
   branch_id INT NOT NULL,
   status TINYINT NOT NULL DEFAULT 1,
   created_by INT NOT NULL,
   created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
   updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE billing_high_level_info (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    comes_from VARCHAR(255) NOT NULL,
    receipt_no VARCHAR(255) NOT NULL,
    patient_id INT NOT NULL,
    total_amount DOUBLE(50 , 2 ) NOT NULL,
    tender_amount DOUBLE(50 , 2 ) DEFAULT 0.0,
    return_amount DOUBLE(50 , 2 ) DEFAULT 0.0,
    receipt_date_ad DATE NOT NULL,
    receipt_date_bs VARCHAR(45) NOT NULL,
    remarks TEXT CHARACTER SET UTF8MB4 COLLATE UTF8MB4_UNICODE_CI DEFAULT NULL,
    transaction_id INT NOT NULL,
    functional_year_id INT NOT NULL,
    branch_id INT NOT NULL,
    status TINYINT NOT NULL DEFAULT 1,
    created_by INT DEFAULT NULL,
    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (patient_id) REFERENCES patient_info (patient_id)
);

CREATE TABLE version_info(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  version VARCHAR(45) NOT NULL,
  description TEXT DEFAULT NULL,
  created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE user_permission_info(
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  user_id INT NOT NULL,
  permission JSON NOT NULL,
  status TINYINT NOT NULL DEFAULT 1,
  created_by INT DEFAULT NULL,
  created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE doctors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    degree VARCHAR(255) NOT NULL,
    namc_no VARCHAR(255) NOT NULL,
    status TINYINT NOT NULL DEFAULT 1,
    created_by INT NOT NULL,
    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
-- ALTER TABLE doctors
-- ADD COLUMN gender VARCHAR(10) AFTER name,
-- ADD COLUMN dob DATE AFTER gender,
-- ADD COLUMN email VARCHAR(255) AFTER dob,
-- ADD COLUMN mobile VARCHAR(20) AFTER email,
-- ADD COLUMN address TEXT AFTER mobile,
-- ADD COLUMN marital_status VARCHAR(20) AFTER address,
-- ADD COLUMN department VARCHAR(100) AFTER marital_status,
-- ADD COLUMN qualification VARCHAR(255) AFTER department,
-- ADD COLUMN reg_no VARCHAR(100) AFTER qualification,
-- ADD COLUMN bio TEXT AFTER reg_no,
-- ADD COLUMN photo VARCHAR(255) AFTER bio;




CREATE TABLE doctor (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    photo VARCHAR(255) DEFAULT NULL,
    gender ENUM('Male', 'Female', 'Other') DEFAULT NULL,
    dob DATE DEFAULT NULL,
    email VARCHAR(255) DEFAULT NULL,
    mobile VARCHAR(20) DEFAULT NULL,
    address TEXT DEFAULT NULL,
    marital_status ENUM('Single', 'Married') DEFAULT NULL,
    department VARCHAR(100) DEFAULT NULL,
    qualification VARCHAR(255) DEFAULT NULL,
    reg_no VARCHAR(100) DEFAULT NULL,
    bio TEXT DEFAULT NULL
);

CREATE TABLE agent (
    agent_id INT AUTO_INCREMENT PRIMARY KEY,
    agent_name VARCHAR(100) NOT NULL,          -- required: name of the agent/test
    parameters VARCHAR(255) NOT NULL,          -- required: what is being measured/tested
    low_range FLOAT NOT NULL,                  -- required: minimum reference value
    top_range FLOAT NOT NULL,                  -- required: maximum reference value
    rate FLOAT NOT NULL,                       -- required: cost of the test
    gender VARCHAR(10),                        -- optional: Male/Female/Other
    email VARCHAR(100),                        -- optional: email of the agent
    mobile VARCHAR(50),                        -- optional: contact number
    address VARCHAR(255),                      -- optional: address
    qualification VARCHAR(100),                -- optional: qualification
    bio TEXT,                                  -- optional: short bio or description
    created_by INT,                            -- optional: who created this record
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE test (
  test_id INT AUTO_INCREMENT PRIMARY KEY,
  test_name VARCHAR(100) NOT NULL,
  parameters TEXT,
  low_range DECIMAL(10,2),
  top_range DECIMAL(10,2),
  rate DECIMAL(10,2),
  gender VARCHAR(10),
  email VARCHAR(100),
  mobile VARCHAR(20),
  address VARCHAR(255),
  qualification VARCHAR(100),
  bio TEXT,
  created_by INT,
  status TINYINT(1) DEFAULT 1, -- 1 = active, 0 = inactive
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE test_group (
  group_id INT AUTO_INCREMENT PRIMARY KEY,
  group_name VARCHAR(100) NOT NULL,
  test_ids JSON NOT NULL,          -- store test IDs as JSON array
  created_by INT,
  status TINYINT(1) DEFAULT 1,    -- 1 = active, 0 = inactive
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



CREATE TABLE available_days (
    id INT AUTO_INCREMENT PRIMARY KEY,
    doctor_id INT NOT NULL,
    day VARCHAR(50) NOT NULL,
    status TINYINT NOT NULL DEFAULT 1,
    created_by INT NOT NULL,
    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

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
  updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

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
    updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE accounting_ledgergroup(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  ledger_group_name VARCHAR(255) NOT NULL,
  formula TEXT NOT NULL,
  is_editable TINYINT NOT NULL DEFAULT 0,
  status TINYINT NOT NULL DEFAULT 1,
  created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE accounting_ledgersub_group(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  sub_group_name VARCHAR(255) NOT NULL,
  is_editable TINYINT NOT NULL DEFAULT 0,
  status TINYINT NOT NULL DEFAULT 1,
  created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
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
  updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


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
  updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE patient_admission_info(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  patient_id INT NOT NULL,
  admit_date_bs VARCHAR(45) NOT NULL,
  admit_date_ad DATE NOT NULL,
  ward VARCHAR(255) NOT NULL,
  bed_no VARCHAR(255) NOT NULL,
  deposit_amount DOUBLE(50,2) NOT NULL DEFAULT 0,
  ledger_id INT NOT NULL,
  is_discharged TINYINT DEFAULT 0,
  discharge_date_ad DATE DEFAULT NULL,
  discharge_date_bs VARCHAR(45) DEFAULT NULL,
  functional_year_id INT NOT NULL,
  branch_id INT NOT NULL,
  status TINYINT NOT NULL DEFAULT 1,
  created_by INT DEFAULT NULL,
  created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE user_branch_info(
   id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
   user_id INT NOT NULL,
   branch_id INT DEFAULT 0,
   status TINYINT NOT NULL DEFAULT 1,
   created_by INT DEFAULT NULL,
   created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
   updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE pharmacy_unit_info (
    unit_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    unit_name VARCHAR(255) NOT NULL,
    unit_symbol VARCHAR(55) NOT NULL,
    status TINYINT NOT NULL DEFAULT 1,
	  created_by INT NOT NULL,
    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE pharmacy_category_info (
    category_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    category_code INT NOT NULL,
    category_name VARCHAR(200) NOT NULL,
    status TINYINT NOT NULL DEFAULT 1,
	  created_by INT NOT NULL,
    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE pharmacy_brand_info (
    brand_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    brand_code INT NOT NULL,
    brand_name VARCHAR(255) NOT NULL,
    company_name VARCHAR(255) NOT NULL,
    status TINYINT NOT NULL DEFAULT 1,
	  created_by INT NOT NULL,
    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE pharmacy_product_generic_name_info (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    generic_name VARCHAR(255) NOT NULL,
	  status TINYINT NOT NULL DEFAULT 1,
	  created_by INT NOT NULL,
    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE pharmacy_product_basic_info (
    product_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	  product_code INT NOT NULL,
    product_name VARCHAR(255) NOT NULL,
    category_id INT DEFAULT NULL,
    is_free BOOLEAN NOT NULL,
    is_taxable BOOLEAN NOT NULL,
    tax_rate DOUBLE(50 , 2 ) NOT NULL,
    brand_id INT DEFAULT NULL,
	  base_unit_id INT NOT NULL,
    minimum_stock_qty INT NOT NULL,
    mrp DOUBLE(50,2) DEFAULT 0,
    mrpAmountType VARCHAR(55) DEFAULT NULL,
    discountPercentInMrp DOUBLE(50,2) DEFAULT 0,
    status TINYINT NOT NULL DEFAULT 1,
	  created_by INT NOT NULL,
	  functional_year_id INT NOT NULL,
    branch_id INT NOT NULL,
    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


CREATE TABLE pharmacy_product_unit_info (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    unit_id INT NOT NULL,
    unit_type VARCHAR(255) NOT NULL,
	  functional_year_id INT NOT NULL,
    branch_id INT NOT NULL,
	  status TINYINT NOT NULL DEFAULT 1,
	  created_by INT NOT NULL,
    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
);


CREATE TABLE pharmacy_product_unit_conversion_info (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    base_unit_conversion_value DOUBLE(50,2) DEFAULT 0.0,
    derived_unit_conversion_value DOUBLE(50,2) DEFAULT 0.0,
    base_unit_id INT DEFAULT NULL,
    derived_unit_id INT DEFAULT NULL,
    product_id INT NOT NULL,
    functional_year_id INT NOT NULL,
    branch_id INT NOT NULL,
	  status TINYINT NOT NULL DEFAULT 1,
	  created_by INT NOT NULL,
    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
);


CREATE TABLE accounting_ledger_mapping (
  id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  label varchar(255) NOT NULL,
  ledger_id int NOT NULL
);

CREATE TABLE party_info (
    party_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ledger_id INT NOT NULL,
    name VARCHAR(255)CHARACTER SET UTF8 COLLATE UTF8_UNICODE_CI DEFAULT NULL,
    address VARCHAR(255)CHARACTER SET UTF8 COLLATE UTF8_UNICODE_CI DEFAULT NULL,
    propriter VARCHAR(50)CHARACTER SET UTF8 COLLATE UTF8_UNICODE_CI DEFAULT NULL,
    contact VARCHAR(50) DEFAULT NULL,
    panvat VARCHAR(50) DEFAULT NULL,
    credit_limit DECIMAL(65 , 2 ) DEFAULT NULL,
    credit_time_limit INT DEFAULT NULL,
    credit_duration VARCHAR(45) DEFAULT NULL,
    category VARCHAR(50) NOT NULL,
    opening_balance DECIMAL(50 , 2 ) DEFAULT NULL,
    opening_balance_date DATE DEFAULT NULL,
    opening_balance_date_bs VARCHAR(45) DEFAULT NULL,
    alt_contact1 VARCHAR(45) DEFAULT NULL,
    alt_contact2 VARCHAR(45) DEFAULT NULL,
    alt_contact3 VARCHAR(45) DEFAULT NULL,
    functional_year_id INT NOT NULL,
    branch_id INT NOT NULL,
    status TINYINT NOT NULL DEFAULT 1,
    created_by INT DEFAULT NULL,
    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE pharmacy_product_batch_info (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    product_id INT NOT NULL,
    batch_no INT NOT NULL,
    expiry_date_ad_month INT NOT NULL,
    expiry_date_ad_year INT NOT NULL,
    barcode_value VARCHAR(255) DEFAULT NULL,
    table_id INT DEFAULT NULL,
    comes_from VARCHAR(255) NOT NULL,
    transaction_id INT DEFAULT NULL,
    functional_year_id INT NOT NULL,
    branch_id INT NOT NULL,
    status TINYINT NOT NULL DEFAULT 1,
    created_by INT DEFAULT NULL,
    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE pharmacy_stock_info (
  id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  comes_from varchar(50) DEFAULT NULL,
  product_id int NOT NULL,
  unit_id int NOT NULL,
  opening_stock decimal(52,2) DEFAULT '0.00',
  stock_value decimal(52,2) NULL DEFAULT '0.00',
  batch_id int not null,
  purchase decimal(52,2) NOT NULL DEFAULT '0.00',
  purchase_return decimal(52,2) NOT NULL DEFAULT '0.00',
  purchase_rate decimal(52,2) DEFAULT '0.00',
  reconcile_qty decimal(52,2) NOT NULL DEFAULT '0.00',
  sales decimal(52,2) NOT NULL DEFAULT '0.00',
  sales_return decimal(52,2) NOT NULL DEFAULT '0.00',
  mrp DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
  sales_discount DECIMAL(19,2) DEFAULT NULL,
  discount_type VARCHAR(10),
  stock_date_ad date NOT NULL,
  stock_date_bs varchar(25) DEFAULT NULL,
  ledger_id INT NOT NULL,
  table_id int DEFAULT NULL,
  transaction_id int DEFAULT NULL,
  functional_year_id INT NOT NULL,
  branch_id INT NOT NULL,
  status TINYINT NOT NULL DEFAULT 1,
  created_by INT DEFAULT NULL,
  created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


CREATE TABLE pharmacy_opening_stock_info (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    opening_stock_date_ad DATE NOT NULL,
    opening_stock_date_bs VARCHAR(45) NOT NULL,
    product_id INT NOT NULL,
    unit_id INT NOT NULL,
    batch_id INT NOT NULL,
    opening_stock_qty INT NOT NULL,
    purchase_rate DOUBLE(50 , 2 ) NOT NULL,
    stock_value DOUBLE(50 , 2 ) NOT NULL,
    stock_id int not null,
    ledger_id INT NOT NULL,
    sales_discount DECIMAL(19,2) DEFAULT NULL,
    discount_type VARCHAR(10),
    transaction_id INT DEFAULT NULL,
    functional_year_id INT NOT NULL,
    branch_id INT NOT NULL,
    status TINYINT NOT NULL DEFAULT 1,
    created_by INT DEFAULT NULL,
    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE pharmacy_purchase_info (
    purchase_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	  vouchernumber VARCHAR(50) NOT NULL,
    bill_date_ad DATE NOT NULL,
    bill_date_bs VARCHAR(50) NOT NULL,
    bill_number VARCHAR(255) NOT NULL,
	  party_id INT DEFAULT NULL,
    ledger_id INT DEFAULT NULL,
	  purchase_order_id VARCHAR(50) DEFAULT NULL,
    purchase_order_no VARCHAR(50) DEFAULT NULL,
    total_amount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
    total_taxable_amount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
    taxable_discount_amount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
    total_non_taxable_amount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
    non_taxable_discount_amount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
    vat_amount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
    discount_amount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
    grand_total_amount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
    remarks TEXT,
    transaction_date_ad DATE NOT NULL,
    transaction_date_bs VARCHAR(50) NOT NULL,
    transaction_id INT NOT NULL,
    functional_year_id INT NOT NULL,
    branch_id INT NOT NULL,
    status TINYINT NOT NULL DEFAULT 1,
    created_by INT DEFAULT NULL,
    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE pharmacy_purchase_info_detail (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	  vouchernumber VARCHAR(50) NOT NULL,
	  purchase_id INT NOT NULL,
	  product_id INT NOT NULL,
	  unit_id INT NOT NULL,
    qty DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
    rate DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
	  amount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
	  discount_amount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
	  amount_after_discount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
	  batch_id INT NOT NULL,
    landing_cost DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
    sales_discount DECIMAL(19,2) DEFAULT NULL,
    discount_type VARCHAR(10),
    discount_percent DECIMAL(19,2) DEFAULT NULL,
    is_taxable TINYINT NOT NULL,
    transaction_id INT NOT NULL,
    functional_year_id INT NOT NULL,
    branch_id INT NOT NULL,
    status TINYINT NOT NULL DEFAULT 1,
    created_by INT DEFAULT NULL,
    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE pharmacy_purchase_payment_mode_info (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	  vouchernumber VARCHAR(50) NOT NULL,
	  purchase_id INT NOT NULL,
	  ledger_id INT DEFAULT NULL,
    party_ledger_id INT DEFAULT NULL,
	  bill_number VARCHAR(255) NOT NULL,
    amount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
    cheque_no VARCHAR(50) DEFAULT NULL,
    payment_type VARCHAR(255) NOT NULL,
    remarks TEXT,
    transaction_date_ad DATE NOT NULL,
    transaction_date_bs VARCHAR(50) NOT NULL,
    transaction_id INT NOT NULL,
    functional_year_id INT NOT NULL,
    branch_id INT NOT NULL,
    status TINYINT NOT NULL DEFAULT 1,
    created_by INT DEFAULT NULL,
    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE pharmacy_purchase_return_info (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    grand_total_amount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
    ledger_id INT NOT NULL,
    purchase_bill_no VARCHAR(45),
    purchase_id INT NOT NULL,
    purchase_return_date_ad DATE NOT NULL,
    purchase_return_date_bs VARCHAR(50) NOT NULL,
    purchase_return_no VARCHAR(45) NOT NULL,
    remarks TEXT,
    total_damage_amount DECIMAL(65 , 2 ) DEFAULT '0.00',
    total_return_amount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
    total_taxable_amount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
    taxable_discount_amount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
    transaction_id INT NOT NULL,
    vat_amount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
    discount_amount DECIMAL(19 , 2 ) DEFAULT NULL,
    non_taxable_amount DECIMAL(19 , 2 ) DEFAULT '0.00',
    non_taxable_discount_amount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
    vat_rate DECIMAL(19 , 2 ) DEFAULT NULL,
    return_type VARCHAR(50) NOT NULL DEFAULT 'PURCHASE_RETURN',
    functional_year_id INT NOT NULL,
    branch_id INT NOT NULL,
    status TINYINT NOT NULL DEFAULT 1,
    created_by INT DEFAULT NULL,
    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
); 

CREATE TABLE pharmacy_purchase_return_info_detail (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    damage_qty DECIMAL(65 , 2 ) DEFAULT '0.00',
    damage_amount DECIMAL(65 , 2 ) DEFAULT '0.00',
    purchase_detail_id INT NOT NULL,
    purchase_return_id INT NOT NULL,
    purchase_return_no VARCHAR(45) NOT NULL,
	  product_id INT NOT NULL,
    unit_id INT NOT NULL,
    return_amount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
    return_qty DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
    return_type VARCHAR(50) NOT NULL DEFAULT 'PURCHASE_RETURN',
    transaction_id INT NOT NULL,
    functional_year_id INT NOT NULL,
    branch_id INT NOT NULL,
    status TINYINT NOT NULL DEFAULT 1,
    created_by INT DEFAULT NULL,
    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

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
  grand_total_amount DECIMAL(65 , 2 )   NOT NULL DEFAULT '0.00',
  total_amount DECIMAL(65 , 2 ) NOT  NULL DEFAULT '0.00',
  total_taxable_amount DECIMAL(65 , 2 ) NOT  NULL DEFAULT '0.00',
  taxable_discount_amount DECIMAL(65 , 2 ) NOT  NULL DEFAULT '0.00',
  total_non_taxable_amount DECIMAL(65 , 2 ) NOT  NULL DEFAULT '0.00',
  non_taxable_discount_amount DECIMAL(65 , 2 )  NOT NULL DEFAULT '0.00',
  total_discount_amount DECIMAL(65 , 2 )  NOT NULL DEFAULT '0.00',
  vat_amount DECIMAL(65 , 2 )  NOT NULL DEFAULT '0.00',
  vat_rate DECIMAL(65 , 2 )  NOT NULL DEFAULT '0.00',
  department_id INT DEFAULT NULL,
  phone_number VARCHAR(15) DEFAULT NULL,
  patient_id INT DEFAULT NULL,
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
  rate DECIMAL(65 , 2 )  NOT NULL DEFAULT '0.00',
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
  sales_id INT NOT NULL,
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

CREATE TABLE pharmacy_sales_return_info (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  ledger_id INT NOT NULL,
  party_id INT DEFAULT NULL,
  remarks TEXT,
  return_amount DECIMAL(65 , 2 ) DEFAULT '0.00',
  sales_return_date_bs VARCHAR(50) NOT NULL,
  sales_bill_amount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
  sales_bill_discount_amount DECIMAL(65 , 2 ) DEFAULT '0.00',
  sales_bill_no VARCHAR(50) NOT NULL,
  sales_id INT NOT NULL,
  sales_return_bill_number VARCHAR(50) NOT NULL,
  sales_return_date_ad DATE NOT NULL,
  total_taxable_amount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
  vat_amount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
  non_taxable_amount DECIMAL(19 , 2 ) DEFAULT NULL,
  vat_rate DECIMAL(19 , 2 ) DEFAULT NULL,
  taxable_discount_amount DECIMAL(19 , 2 ) DEFAULT NULL,
  non_taxable_discount_amount DECIMAL(19 , 2 ) DEFAULT '0.00',
  transaction_id INT NOT NULL,
  functional_year_id INT NOT NULL,
  branch_id INT NOT NULL,
  status TINYINT NOT NULL DEFAULT 1,
  created_by INT DEFAULT NULL,
  created_at DATETIME NOT NULL,
  updated_at DATETIME NOT NULL
);


CREATE TABLE pharmacy_sales_return_detail (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  ledger_id INT NOT NULL,
  party_id INT DEFAULT NULL,
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
 

ALTER TABLE disease_group_info ADD CONSTRAINT fk_disease_group_info_user FOREIGN KEY (created_by) REFERENCES user(user_id);
ALTER TABLE disease_info ADD CONSTRAINT fk_disease_info_disease_group_id FOREIGN KEY (disease_group_id) REFERENCES disease_group_info(id);


ALTER TABLE disease_info ADD CONSTRAINT fk_disease_info_user FOREIGN KEY (created_by) REFERENCES user(user_id);

ALTER TABLE pharmacy_sales_return_detail ADD CONSTRAINT fk_pharmacy_sales_return_detail_ledger_id FOREIGN KEY (ledger_id) REFERENCES accounting_ledgerinfo(id);
ALTER TABLE pharmacy_sales_return_detail ADD CONSTRAINT fk_pharmacy_sales_return_detail_functional_year FOREIGN KEY (functional_year_id) REFERENCES functional_year(functional_year_id);
ALTER TABLE pharmacy_sales_return_detail ADD CONSTRAINT fk_pharmacy_sales_return_detail_branch FOREIGN KEY (branch_id) REFERENCES branch_info (branch_id);
ALTER TABLE pharmacy_sales_return_detail ADD CONSTRAINT fk_pharmacy_sales_return_detail_user FOREIGN KEY (created_by) REFERENCES user(user_id);


ALTER TABLE pharmacy_sales_return_info ADD CONSTRAINT fk_pharmacy_sales_return_info_ledger_id FOREIGN KEY (ledger_id) REFERENCES accounting_ledgerinfo(id);
ALTER TABLE pharmacy_sales_return_info ADD CONSTRAINT fk_pharmacy_sales_return_info_info_functional_year FOREIGN KEY (functional_year_id) REFERENCES functional_year(functional_year_id);
ALTER TABLE pharmacy_sales_return_info ADD CONSTRAINT fk_pharmacy_sales_return_info_branch FOREIGN KEY (branch_id) REFERENCES branch_info (branch_id);
ALTER TABLE pharmacy_sales_return_info ADD CONSTRAINT fk_pharmacy_sales_return_info_user FOREIGN KEY (created_by) REFERENCES user(user_id);


ALTER TABLE pharmacy_sales_entry_info ADD CONSTRAINT fk_pharmacy_sales_entry_info_ledger_id FOREIGN KEY (ledger_id) REFERENCES accounting_ledgerinfo(id);
ALTER TABLE pharmacy_sales_entry_info ADD CONSTRAINT fk_pharmacy_sales_entry_info_info_functional_year FOREIGN KEY (functional_year_id) REFERENCES functional_year(functional_year_id);
ALTER TABLE pharmacy_sales_entry_info ADD CONSTRAINT fk_pharmacy_sales_entry_info_branch FOREIGN KEY (branch_id) REFERENCES branch_info (branch_id);
ALTER TABLE pharmacy_sales_entry_info ADD CONSTRAINT fk_pharmacy_sales_entry_info_user FOREIGN KEY (created_by) REFERENCES user(user_id);

ALTER TABLE pharmacy_sales_entry_detail ADD CONSTRAINT fk_pharmacy_sales_entry_detail_ledger_id FOREIGN KEY (ledger_id) REFERENCES accounting_ledgerinfo(id);
ALTER TABLE pharmacy_sales_entry_detail ADD CONSTRAINT fk_pharmacy_sales_entry_detail_info_functional_year FOREIGN KEY (functional_year_id) REFERENCES functional_year(functional_year_id);
ALTER TABLE pharmacy_sales_entry_detail ADD CONSTRAINT fk_pharmacy_sales_entry_detail_branch FOREIGN KEY (branch_id) REFERENCES branch_info (branch_id);
ALTER TABLE pharmacy_sales_entry_detail ADD CONSTRAINT fk_pharmacy_sales_entry_detail_user FOREIGN KEY (created_by) REFERENCES user(user_id);


ALTER TABLE pharmacy_sales_payment_info ADD CONSTRAINT fk_pharmacy_sales_payment_info_sales_id FOREIGN KEY (sales_id) REFERENCES pharmacy_sales_entry_info(id);

ALTER TABLE pdc_info ADD CONSTRAINT fk_pdc_info_party_ledger_id FOREIGN KEY (party_ledger_id) REFERENCES accounting_ledgerinfo(id);
ALTER TABLE pdc_info ADD CONSTRAINT fk_pdc_info_created_by FOREIGN KEY (created_by) REFERENCES user(user_id);

ALTER TABLE pharmacy_purchase_payment_info_detail ADD CONSTRAINT fk_pharmacy_purchase_payment_info_detail_ledger_id FOREIGN KEY (ledger_id) REFERENCES accounting_ledgerinfo(id);
ALTER TABLE pharmacy_purchase_payment_info_detail ADD CONSTRAINT fk_pharmacy_purchase_payment_info_detail_table_id FOREIGN KEY (table_id) REFERENCES pharmacy_purchase_payment_info(id);
ALTER TABLE pharmacy_purchase_payment_info_detail ADD CONSTRAINT fk_pharmacy_purchase_payment_info_detail_functional_year FOREIGN KEY (functional_year_id) REFERENCES functional_year(functional_year_id);
ALTER TABLE pharmacy_purchase_payment_info_detail ADD CONSTRAINT fk_pharmacy_purchase_payment_info_detail_branch FOREIGN KEY (branch_id) REFERENCES branch_info (branch_id);
ALTER TABLE pharmacy_purchase_payment_info_detail ADD CONSTRAINT fk_pharmacy_purchase_payment_info_detail_user FOREIGN KEY (created_by) REFERENCES user(user_id);

ALTER TABLE pharmacy_purchase_payment_info ADD CONSTRAINT fk_pharmacy_purchase_payment_info_ledger_id FOREIGN KEY (ledger_id) REFERENCES accounting_ledgerinfo(id);
ALTER TABLE pharmacy_purchase_payment_info ADD CONSTRAINT fk_pharmacy_purchase_payment_info_info_functional_year FOREIGN KEY (functional_year_id) REFERENCES functional_year(functional_year_id);
ALTER TABLE pharmacy_purchase_payment_info ADD CONSTRAINT fk_pharmacy_purchase_payment_info_branch FOREIGN KEY (branch_id) REFERENCES branch_info (branch_id);
ALTER TABLE pharmacy_purchase_payment_info ADD CONSTRAINT fk_pharmacy_purchase_payment_info_user FOREIGN KEY (created_by) REFERENCES user(user_id);


ALTER TABLE lab_test_info ADD CONSTRAINT fk_lab_test_info_lab_group_id FOREIGN KEY (lab_group_id) REFERENCES lab_group_info(id);
ALTER TABLE lab_test_info ADD CONSTRAINT fk_lab_test_info_lab_test_id FOREIGN KEY (lab_test_id) REFERENCES billing_title_info(billing_title_id);
ALTER TABLE lab_test_info ADD CONSTRAINT fk_lab_test_info_user FOREIGN KEY (created_by) REFERENCES user(user_id);

ALTER TABLE lab_group_info ADD CONSTRAINT fk_lab_group_info_user FOREIGN KEY (created_by) REFERENCES user(user_id);


ALTER TABLE pharmacy_purchase_return_info_detail ADD CONSTRAINT fk_pharmacy_purchase_return_info_detail_functional_year FOREIGN KEY (functional_year_id) REFERENCES functional_year(functional_year_id);
ALTER TABLE pharmacy_purchase_return_info_detail ADD CONSTRAINT fk_pharmacy_purchase_return_info_detail_branch FOREIGN KEY (branch_id) REFERENCES branch_info (branch_id);
ALTER TABLE pharmacy_purchase_return_info_detail ADD CONSTRAINT fk_pharmacy_purchase_return_info_detail_user FOREIGN KEY (created_by) REFERENCES user(user_id);
ALTER TABLE pharmacy_purchase_return_info_detail ADD CONSTRAINT fk_pharmacy_purchase_return_info_detail_product_id FOREIGN KEY (product_id) REFERENCES pharmacy_product_basic_info(product_id);
ALTER TABLE pharmacy_purchase_return_info_detail ADD CONSTRAINT fk_pharmacy_purchase_return_info_detail_unit_id FOREIGN KEY (unit_id) REFERENCES pharmacy_unit_info (unit_id);

ALTER TABLE pharmacy_purchase_return_info ADD CONSTRAINT fk_pharmacy_purchase_return_info_functional_year FOREIGN KEY (functional_year_id) REFERENCES functional_year(functional_year_id);
ALTER TABLE pharmacy_purchase_return_info ADD CONSTRAINT fk_pharmacy_purchase_return_info_branch FOREIGN KEY (branch_id) REFERENCES branch_info (branch_id);
ALTER TABLE pharmacy_purchase_return_info ADD CONSTRAINT fk_pharmacy_purchase_return_info_user FOREIGN KEY (created_by) REFERENCES user(user_id);

ALTER TABLE pharmacy_purchase_info ADD CONSTRAINT fk_pharmacy_purchase_info_ledger_id FOREIGN KEY (ledger_id) REFERENCES accounting_ledgerinfo(id);
ALTER TABLE pharmacy_purchase_info ADD CONSTRAINT fk_pharmacy_purchase_info_functional_year FOREIGN KEY (functional_year_id) REFERENCES functional_year(functional_year_id);
ALTER TABLE pharmacy_purchase_info ADD CONSTRAINT fk_pharmacy_purchase_info_branch FOREIGN KEY (branch_id) REFERENCES branch_info (branch_id);
ALTER TABLE pharmacy_purchase_info ADD CONSTRAINT fk_pharmacy_purchase_info_user FOREIGN KEY (created_by) REFERENCES user(user_id);

ALTER TABLE pharmacy_purchase_info_detail ADD CONSTRAINT fk_pharmacy_purchase_info_detail_purchase_id FOREIGN KEY (purchase_id) REFERENCES pharmacy_purchase_info(purchase_id);
ALTER TABLE pharmacy_purchase_info_detail ADD CONSTRAINT fk_pharmacy_purchase_info_detail_product_id FOREIGN KEY (product_id) REFERENCES pharmacy_product_basic_info(product_id);
ALTER TABLE pharmacy_purchase_info_detail ADD CONSTRAINT fk_pharmacy_purchase_info_detail_unit_id FOREIGN KEY (unit_id) REFERENCES pharmacy_unit_info (unit_id);
ALTER TABLE pharmacy_purchase_info_detail ADD CONSTRAINT fk_pharmacy_purchase_info_detail_batch_id FOREIGN KEY (batch_id) REFERENCES pharmacy_product_batch_info (id);
ALTER TABLE pharmacy_purchase_info_detail ADD CONSTRAINT fk_pharmacy_purchase_info_detail_functional_year FOREIGN KEY (functional_year_id) REFERENCES functional_year(functional_year_id);
ALTER TABLE pharmacy_purchase_info_detail ADD CONSTRAINT fk_pharmacy_purchase_info_detail_branch FOREIGN KEY (branch_id) REFERENCES branch_info (branch_id);
ALTER TABLE pharmacy_purchase_info_detail ADD CONSTRAINT fk_pharmacy_purchase_info_detail_user FOREIGN KEY (created_by) REFERENCES user(user_id);

ALTER TABLE pharmacy_purchase_payment_mode_info ADD CONSTRAINT fk_pharmacy_purchase_payment_mode_info_purchase_id FOREIGN KEY (purchase_id) REFERENCES pharmacy_purchase_info(purchase_id);
ALTER TABLE pharmacy_purchase_payment_mode_info ADD CONSTRAINT fk_pharmacy_purchase_payment_mode_info_ledger_id FOREIGN KEY (ledger_id) REFERENCES accounting_ledgerinfo(id);
ALTER TABLE pharmacy_purchase_payment_mode_info ADD CONSTRAINT fk_pharmacy_pharmacy_purchase_payment_mode_info_purchase_id FOREIGN KEY (purchase_id) REFERENCES pharmacy_purchase_info(purchase_id);
ALTER TABLE pharmacy_purchase_payment_mode_info ADD CONSTRAINT fk_pharmacy_purchase_payment_mode_info_functional_year FOREIGN KEY (functional_year_id) REFERENCES functional_year(functional_year_id);
ALTER TABLE pharmacy_purchase_payment_mode_info ADD CONSTRAINT fk_pharmacy_purchase_payment_mode_info_branch FOREIGN KEY (branch_id) REFERENCES branch_info (branch_id);
ALTER TABLE pharmacy_purchase_payment_mode_info ADD CONSTRAINT fk_pharmacy_purchase_payment_mode_info_user FOREIGN KEY (created_by) REFERENCES user(user_id);


ALTER TABLE pharmacy_product_batch_info ADD CONSTRAINT fk_pharmacy_product_batch_info_product_id FOREIGN KEY (product_id) REFERENCES pharmacy_product_basic_info(product_id);
ALTER TABLE pharmacy_product_batch_info ADD CONSTRAINT fk_pharmacy_product_batch_info_functional_year FOREIGN KEY (functional_year_id) REFERENCES functional_year(functional_year_id);
ALTER TABLE pharmacy_product_batch_info ADD CONSTRAINT fk_pharmacy_product_batch_info_branch FOREIGN KEY (branch_id) REFERENCES branch_info (branch_id);
ALTER TABLE pharmacy_product_batch_info ADD CONSTRAINT fk_pharmacy_product_batch_info_user FOREIGN KEY (created_by) REFERENCES user(user_id);

ALTER TABLE pharmacy_stock_info ADD CONSTRAINT fk_pharmacy_stock_info_product_id FOREIGN KEY (product_id) REFERENCES pharmacy_product_basic_info(product_id);
ALTER TABLE pharmacy_stock_info ADD CONSTRAINT fk_pharmacy_stock_info_unit_id FOREIGN KEY (unit_id) REFERENCES pharmacy_unit_info (unit_id);
ALTER TABLE pharmacy_stock_info ADD CONSTRAINT fk_pharmacy_stock_info_batch_id FOREIGN KEY (batch_id) REFERENCES pharmacy_product_batch_info (id);
ALTER TABLE pharmacy_stock_info ADD CONSTRAINT fk_pharmacy_stock_info_functional_year FOREIGN KEY (functional_year_id) REFERENCES functional_year(functional_year_id);
ALTER TABLE pharmacy_stock_info ADD CONSTRAINT fk_pharmacy_stock_info_branch FOREIGN KEY (branch_id) REFERENCES branch_info (branch_id);
ALTER TABLE pharmacy_stock_info ADD CONSTRAINT fk_pharmacy_stock_info_user FOREIGN KEY (created_by) REFERENCES user(user_id);


ALTER TABLE pharmacy_opening_stock_info ADD CONSTRAINT fk_pharmacy_opening_stock_info_product_id FOREIGN KEY (product_id) REFERENCES pharmacy_product_basic_info(product_id);
ALTER TABLE pharmacy_opening_stock_info ADD CONSTRAINT fk_pharmacy_opening_stock_info_unit_id FOREIGN KEY (unit_id) REFERENCES pharmacy_unit_info (unit_id);
ALTER TABLE pharmacy_opening_stock_info ADD CONSTRAINT fk_pharmacy_opening_stock_info_batch_id FOREIGN KEY (batch_id) REFERENCES pharmacy_product_batch_info (id);
ALTER TABLE pharmacy_opening_stock_info ADD CONSTRAINT fk_pharmacy_opening_stock_info_functional_year FOREIGN KEY (functional_year_id) REFERENCES functional_year(functional_year_id);
ALTER TABLE pharmacy_opening_stock_info ADD CONSTRAINT fk_pharmacy_opening_stock_info_branch FOREIGN KEY (branch_id) REFERENCES branch_info (branch_id);
ALTER TABLE pharmacy_opening_stock_info ADD CONSTRAINT fk_pharmacy_opening_stock_info_user FOREIGN KEY (created_by) REFERENCES user(user_id);


ALTER TABLE party_info ADD CONSTRAINT fk_party_info_ledger_id FOREIGN KEY (ledger_id) REFERENCES accounting_ledgerinfo(id);
ALTER TABLE party_info ADD CONSTRAINT fk_party_info_functional_year FOREIGN KEY (functional_year_id) REFERENCES functional_year (functional_year_id);
ALTER TABLE party_info ADD CONSTRAINT fk_party_info_branch FOREIGN KEY (branch_id) REFERENCES branch_info (branch_id);
ALTER TABLE party_info ADD CONSTRAINT fk_party_info_user FOREIGN KEY (created_by) REFERENCES user(user_id);


ALTER TABLE pharmacy_product_basic_info ADD CONSTRAINT fk_pharmacy_product_basic_info_category_id FOREIGN KEY (category_id) REFERENCES pharmacy_category_info(category_id);
ALTER TABLE pharmacy_product_basic_info ADD CONSTRAINT fk_pharmacy_product_basic_info_brand_id FOREIGN KEY (brand_id) REFERENCES pharmacy_brand_info  (brand_id);
ALTER TABLE pharmacy_product_basic_info ADD CONSTRAINT fk_fk_pharmacy_product_basic_info_base_unit_id FOREIGN KEY (base_unit_id) REFERENCES pharmacy_unit_info (unit_id);
ALTER TABLE pharmacy_product_basic_info ADD CONSTRAINT fk_pharmacy_product_basic_info_functional_year_id FOREIGN KEY (functional_year_id) REFERENCES functional_year (functional_year_id);
ALTER TABLE pharmacy_product_basic_info ADD CONSTRAINT fk_pharmacy_product_basic_info_branch_id FOREIGN KEY (branch_id) REFERENCES branch_info (branch_id);


ALTER TABLE pharmacy_product_unit_info ADD CONSTRAINT fk_pharmacy_product_unit_info_product_id FOREIGN KEY (product_id) REFERENCES pharmacy_product_basic_info(product_id);
ALTER TABLE pharmacy_product_unit_info ADD CONSTRAINT fk_pharmacy_product_unit_info_unit_id FOREIGN KEY (unit_id) REFERENCES pharmacy_unit_info(unit_id);
ALTER TABLE pharmacy_product_unit_info ADD CONSTRAINT fk_pharmacy_product_unit_info_functional_year_id FOREIGN KEY (functional_year_id) REFERENCES functional_year (functional_year_id);
ALTER TABLE pharmacy_product_unit_info ADD CONSTRAINT fk_pharmacy_product_unit_info_branch_id FOREIGN KEY (branch_id) REFERENCES branch_info (branch_id);

ALTER TABLE pharmacy_product_unit_conversion_info ADD CONSTRAINT fk_pharmacy_product_unit_conversion_info_product_id FOREIGN KEY (product_id) REFERENCES pharmacy_product_basic_info(product_id);
ALTER TABLE pharmacy_product_unit_conversion_info ADD CONSTRAINT fk_pharmacy_product_unit_conversion_info_base_unit_id FOREIGN KEY (base_unit_id) REFERENCES pharmacy_unit_info(unit_id);
ALTER TABLE pharmacy_product_unit_conversion_info ADD CONSTRAINT fk_pharmacy_product_unit_conversion_info_derived_unit_id FOREIGN KEY (derived_unit_id) REFERENCES pharmacy_unit_info(unit_id);
ALTER TABLE pharmacy_product_unit_conversion_info ADD CONSTRAINT fk_pharmacy_product_unit_conversion_info_functional_year_id FOREIGN KEY (functional_year_id) REFERENCES functional_year (functional_year_id);
ALTER TABLE pharmacy_product_unit_conversion_info ADD CONSTRAINT fk_pharmacy_product_unit_conversion_info_branch_id FOREIGN KEY (branch_id) REFERENCES branch_info (branch_id);



ALTER TABLE user_branch_info ADD CONSTRAINT fk_user_branch_info_user_id FOREIGN KEY (user_id) REFERENCES user(user_id);
ALTER TABLE user_branch_info ADD CONSTRAINT fk_user_branch_info_created_by FOREIGN KEY (created_by) REFERENCES user(user_id);

ALTER TABLE patient_follow_up_info ADD CONSTRAINT fk_patient_follow_up_doctor FOREIGN KEY (doctor_id) REFERENCES doctors(id);


ALTER TABLE patient_admission_info ADD CONSTRAINT fk_patient_admission_info_patient_id FOREIGN KEY (patient_id) REFERENCES patient_info (patient_id);

ALTER TABLE patient_admission_info ADD CONSTRAINT fk_patient_admission_info_ledger_id FOREIGN KEY (ledger_id) REFERENCES accounting_ledgerinfo(id);

ALTER TABLE patient_admission_info ADD CONSTRAINT fk_patient_admission_info_user FOREIGN KEY (created_by) REFERENCES user(user_id);

ALTER TABLE patient_admission_info ADD CONSTRAINT fk_patient_admission_info_functional_year FOREIGN KEY (functional_year_id) REFERENCES functional_year (functional_year_id);

ALTER TABLE patient_admission_info ADD CONSTRAINT fk_patient_admission_info_branch FOREIGN KEY (branch_id) REFERENCES branch_info (branch_id);



ALTER TABLE accounting_transaction_detail ADD CONSTRAINT fk_accounting_transaction_detail_ledger_id FOREIGN KEY (ledger_id) REFERENCES accounting_ledgerinfo(id);

ALTER TABLE accounting_transaction_detail ADD CONSTRAINT fk_accounting_transaction_detail_functional_year FOREIGN KEY (functional_year_id) REFERENCES functional_year (functional_year_id);

ALTER TABLE accounting_transaction_detail ADD CONSTRAINT fk_accounting_transaction_detail_branch FOREIGN KEY (branch_id) REFERENCES branch_info (branch_id);

ALTER TABLE accounting_transaction_detail ADD CONSTRAINT fk_accounting_transaction_detail_user FOREIGN KEY (created_by) REFERENCES user(user_id);



ALTER TABLE accounting_ledgerinfo ADD CONSTRAINT fk_accounting_ledgerinfo_master_ledger_group_id FOREIGN KEY (master_ledger_group_id) REFERENCES accounting_ledgergroup(id);

ALTER TABLE accounting_ledgerinfo ADD CONSTRAINT fk_accounting_ledgerinfo_ledger_sub_group_id FOREIGN KEY (ledger_sub_group_id) REFERENCES accounting_ledgersub_group(id);

ALTER TABLE accounting_ledgerinfo ADD CONSTRAINT fk_accounting_ledgerinfo_functional_year FOREIGN KEY (functional_year_id) REFERENCES functional_year (functional_year_id);

ALTER TABLE accounting_ledgerinfo ADD CONSTRAINT fk_accounting_ledgerinfo_branch FOREIGN KEY (branch_id) REFERENCES branch_info (branch_id);

ALTER TABLE accounting_ledgerinfo ADD CONSTRAINT fk_accounting_ledgerinfo_user FOREIGN KEY (created_by) REFERENCES user(user_id);


ALTER TABLE accounting_log_info ADD CONSTRAINT fk_accounting_log_info_user_id FOREIGN KEY (user_id) REFERENCES user(user_id);

ALTER TABLE log_info ADD CONSTRAINT fk_log_info_user_id FOREIGN KEY (user_id) REFERENCES user(user_id);

ALTER TABLE available_days ADD CONSTRAINT fk_available_days_doctor_id FOREIGN KEY (doctor_id) REFERENCES doctors(id);

ALTER TABLE available_days ADD CONSTRAINT fk_available_days_user FOREIGN KEY (created_by) REFERENCES user(user_id);

ALTER TABLE doctors ADD CONSTRAINT fj_doctors_user FOREIGN KEY (created_by) REFERENCES user(user_id);

ALTER TABLE user_permission_info ADD CONSTRAINT fk_user_permission_info_user_id FOREIGN KEY (user_id) REFERENCES user(user_id);

ALTER TABLE billing_info ADD COLUMN billing_high_level_info_id INT NOT NULL;

ALTER TABLE billing_info ADD CONSTRAINT fk_billing_high_level_info_id  FOREIGN KEY (billing_high_level_info_id) REFERENCES billing_high_level_info (id);

ALTER TABLE patient_follow_up_info ADD COLUMN remarks TEXT DEFAULT NULL;


ALTER TABLE refresh_tokens ADD CONSTRAINT fk_refresh_token_user FOREIGN KEY (user_id) REFERENCES  user(user_id);

ALTER TABLE functional_year ADD CONSTRAINT fk_functional_year_user FOREIGN KEY (created_by) REFERENCES user(user_id);

ALTER TABLE branch_info ADD CONSTRAINT fk_branch_info_user FOREIGN KEY (created_by) REFERENCES user(user_id);

ALTER TABLE department_info ADD CONSTRAINT fk_department_info_functional_year FOREIGN KEY (functional_year_id) REFERENCES functional_year (functional_year_id);
ALTER TABLE department_info ADD CONSTRAINT fk_department_info_branch FOREIGN KEY (branch_id) REFERENCES branch_info (branch_id);
ALTER TABLE department_info ADD CONSTRAINT fk_department_info_user FOREIGN KEY (created_by) REFERENCES user(user_id);


ALTER TABLE billing_title_info ADD CONSTRAINT fk_billing_title_info_department FOREIGN KEY (department_id) REFERENCES department_info (department_id);
ALTER TABLE billing_title_info ADD CONSTRAINT fk_billing_title_info_functional_year FOREIGN KEY (functional_year_id) REFERENCES functional_year (functional_year_id);
ALTER TABLE billing_title_info ADD CONSTRAINT fk_billing_title_info_branch FOREIGN KEY (branch_id) REFERENCES branch_info (branch_id);
ALTER TABLE billing_title_info ADD CONSTRAINT fk_billing_title_info_user FOREIGN KEY (created_by) REFERENCES user(user_id);


ALTER TABLE patient_info ADD CONSTRAINT fk_patient_info_functional_year FOREIGN KEY (functional_year_id) REFERENCES functional_year (functional_year_id);
ALTER TABLE patient_info ADD CONSTRAINT fk_patient_info_branch FOREIGN KEY (branch_id) REFERENCES branch_info (branch_id);
ALTER TABLE patient_info ADD CONSTRAINT fk_patient_info_user FOREIGN KEY (created_by) REFERENCES user(user_id);


ALTER TABLE billing_info ADD CONSTRAINT fk_billing_info_patient FOREIGN KEY (patient_id) REFERENCES patient_info(patient_id);
ALTER TABLE billing_info ADD CONSTRAINT fk_billing_info_billing_title  FOREIGN KEY (billing_title_id) REFERENCES billing_title_info (billing_title_id);
ALTER TABLE billing_info ADD CONSTRAINT fk_billing_info_functional_year FOREIGN KEY (functional_year_id) REFERENCES functional_year (functional_year_id);
ALTER TABLE billing_info ADD CONSTRAINT fk_billing_info_branch FOREIGN KEY (branch_id) REFERENCES branch_info (branch_id);
ALTER TABLE billing_info ADD CONSTRAINT fk_billing_info_user FOREIGN KEY (created_by) REFERENCES user(user_id);


ALTER TABLE patient_follow_up_info ADD CONSTRAINT fk_patient_follow_up_info_patient FOREIGN KEY (patient_id) REFERENCES patient_info(patient_id);
ALTER TABLE patient_follow_up_info ADD CONSTRAINT fk_patient_follow_up_info_functional_year FOREIGN KEY (functional_year_id) REFERENCES functional_year (functional_year_id);
ALTER TABLE patient_follow_up_info ADD CONSTRAINT fk_patient_follow_up_info_branch FOREIGN KEY (branch_id) REFERENCES branch_info (branch_id);
ALTER TABLE patient_follow_up_info ADD CONSTRAINT fk_patient_follow_up_info_user FOREIGN KEY (created_by) REFERENCES user(user_id);


ALTER TABLE billing_title_mapping_info ADD CONSTRAINT fk_billing_title_mapping_info_billing_title  FOREIGN KEY (billing_title_id) REFERENCES billing_title_info (billing_title_id);
ALTER TABLE billing_title_mapping_info ADD CONSTRAINT fk_billing_title_mapping_info_branch FOREIGN KEY (branch_id) REFERENCES branch_info (branch_id);
ALTER TABLE billing_title_mapping_info ADD CONSTRAINT fk_billing_title_mapping_info_label FOREIGN KEY (label_id) REFERENCES label_info (id);
ALTER TABLE billing_title_mapping_info ADD CONSTRAINT fk_billing_title_mapping_info_user FOREIGN KEY (created_by) REFERENCES user(user_id);


ALTER TABLE district ADD CONSTRAINT fk_district_province FOREIGN KEY (province_id) REFERENCES province(id);

ALTER TABLE local_level ADD CONSTRAINT fk_local_level_district  FOREIGN KEY (district_id) REFERENCES district(id);
ALTER TABLE local_level ADD CONSTRAINT fk_local_level_type FOREIGN KEY (local_level_type_id) REFERENCES local_level_type(id);



INSERT INTO user (username, password, name,user_type) VALUES ('admin','$2a$10$AiaOiTTCDD6SLOujFdyKCu60p8cSxv4d3hqwdpF.gp4BVa6irk4Py','Admin Admin','admin');

INSERT INTO label_info (label_name) VALUES ('NEW_PATIENT_REGISTRATION'), ('OLD_PATIENT_REGISTRATION');

INSERT INTO caste_info (caste_code,caste_eng,caste_nep) VALUES (1,'Dalit','दलित');
INSERT INTO caste_info (caste_code,caste_eng,caste_nep) VALUES (2,'Janjati','जनजाति');
INSERT INTO caste_info (caste_code,caste_eng,caste_nep) VALUES (3,'Madhesi','मधेसी');
INSERT INTO caste_info (caste_code,caste_eng,caste_nep) VALUES (4,'Muslim','मुस्लिम');
INSERT INTO caste_info (caste_code,caste_eng,caste_nep) VALUES (5,'Brahmin/Chettri','ब्राह्मण/क्षेत्री');
INSERT INTO caste_info (caste_code,caste_eng,caste_nep) VALUES (6,'Other','अन्य');



INSERT INTO `province` (`id`, `province_eng`, `province_nep`, `hq_eng`, `hq_nep`) VALUES
(
1,
'Koshi',
'कोशी',
'Biratnagar',
'बिराटनगर'
),

(
2,
'Madhesh',
'मधेश',
'Janakpur',
'जनकपूर'
),

(
3,
'Bagmati',
'बागमति',
'Hetauda',
'हेटौडा'
),

(
4,
'Gandaki',
'गण्डकी',
'Pokhara',
'पोखरा'
),

(
5,
'Lumbini',
'लुम्बिनी',
'Deukhuri',
'देउखुरी'
),

(
6,
'Karnali',
'कर्णाली',
'Birendranagar',
'बिरेन्द्रनगर'
),

(
7,
'Sudurpashchim',
'सुदुरपश्चिम',
'Godawari',
'गोदावरी'
);



INSERT INTO `local_level_type` (`id`, `type_nep`, `type_eng`) VALUES
(
1,
'गाउँपालिका',
'Rural Municipality'
),

(
2,
'नगरपालिका',
'Municipality'
),

(
3,
'उपमहानगरपालिका',
'Sub-Metropolitian City'
),

(
4,
'महानगरपालिका',
'Metropolitian City'
);



INSERT INTO `district` (`id`, `district_eng`, `district_nep`, `hq_eng`, `hq_nep`, `province_id`) VALUES
(
1,
'Bhojpur',
'भोजपुर',
'Bhojpur',
'भोजपुर',
1),

(
2,
'Dhankuta',
'धनकुटा',
'Dhankuta',
'धनकुटा',
1),

(
3,
'Ilam',
'इलाम',
'Ilam',
'इलाम',
1),

(
4,
'Jhapa',
'झापा',
'Bhadrapur',
'भद्रपुर',
1),

(
5,
'Khotang',
'खोटाँग',
'Diktel Rupakot Majhuwagadhi',
'दिक्तेल रुपाकोट मझुवागढी',
1),

(
6,
'Morang',
'मोरंग',
'Biratnagar',
'बिराटनगर',
1),

(
7,
'Okhaldhunga',
'ओखलढुंगा',
'Siddhicharan',
'सिद्धिचरण',
1),

(
8,
'Panchthar',
'पांचथर',
'Phidim',
'फिदिम',
1),

(
9,
'Sankhuwasabha',
'संखुवासभा',
'Khandbari',
'खाँदबारी',
1),

(
10,
'Solukhumbu',
'सोलुखुम्बू',
'Solududhkunda',
'सोलुदुधकुण्ड',
1),

(
11,
'Sunsari',
'सुनसरी',
'Inaruwa',
'इनरुवा',
1),

(
12,
'Taplejung',
'ताप्लेजुंग',
'Phungling',
'फुङलिङ',
1),

(
13,
'Tehrathum',
'तेह्रथुम',
'Myanglung',
'म्याङलुङ',
1),

(
14,
'Udayapur',
'उदयपुर',
'Triyuga',
'त्रियुगा',
1),

(
15,
'Parsa',
'पर्सा',
'Birgunj',
'बीरगञ्ज',
2),

(
16,
'Bara',
'बारा',
'Kalaiya',
'कलैया',
2),

(
17,
'Rautahat',
'रौतहट',
'Gaur',
'गौर',
2),

(
18,
'Sarlahi',
'सर्लाही',
'Malangwa',
'मलंगवा',
2),

(
19,
'Dhanusha',
'धनुषा',
'Janakpurdham',
'जनकपुरधाम',
2),

(
20,
'Siraha',
'सिराहा',
'Siraha',
'सिराहा',
2),

(
21,
'Mahottari',
'महोत्तरी',
'Jaleshwar',
'जलेश्वर',
2),

(
22,
'Saptari',
'सप्तरी',
'Rajbiraj',
'राजविराज',
2),

(
23,
'Sindhuli',
'सिन्धुली',
'Kamalamai',
'कमलामाई',
3),

(
24,
'Ramechhap',
'रामेछाप',
'Manthali',
'मन्थली',
3),

(
25,
'Dolakha',
'दोलखा',
'Bhimeshwar',
'भिमेश्वर',
3),

(
26,
'Bhaktapur',
'भक्तपुर',
'Bhaktapur',
'भक्तपुर',
3),

(
27,
'Dhading',
'धादिङ',
'Neelakantha',
'निलकण्ठ',
3),

(
28,
'Kathmandu',
'काठमाण्डौं',
'Kathmandu',
'काठमाण्डौं',
3),

(
29,
'Kavrepalanchok',
'काभ्रेपलान्चोक',
'Dhulikhel',
'धुलिखेल',
3),

(
30,
'Lalitpur',
'ललितपुर',
'Lalitpur',
'ललितपुर',
3),

(
31,
'Nuwakot',
'नुवाकोट',
'Bidur',
'बिदुर',
3),

(
32,
'Rasuwa',
'रसुवा',
'Gosaikunda',
'गोसाईकुण्ड',
3),

(
33,
'Sindhupalchok',
'सिन्धुपाल्चोक',
'Chautara Sangachowkgadhi',
'चौतारा साँगाचोकगढी',
3),

(
34,
'Chitwan',
'चितवन',
'Bharatpur',
'भरतपुर',
3),

(
35,
'Makwanpur',
'मकवानपुर',
'Hetauda',
'हेटौडा',
3),

(
36,
'Baglung',
'बागलुङ',
'Baglung',
'बागलुङ',
4),

(
37,
'Gorkha',
'गोरखा',
'Gorkha',
'गोरखा',
4),

(
38,
'Kaski',
'कास्की',
'Pokhara',
'पोखरा',
4),

(
39,
'Lamjung',
'लमजुङ',
'Besishahar',
'बेसीशहर',
4),

(
40,
'Manang',
'मनाङ',
'Chame',
'चामे',
4),

(
41,
'Mustang',
'मुस्ताङ',
'Gharapjhong',
'घरपझोङ',
4),

(
42,
'Myagdi',
'म्याग्दी',
'Beni',
'बेनी',
4),

(
43,
'Nawalpur',
'नवलपुर',
'Kawasoti',
'कावासोती',
4),

(
44,
'Parbat',
'पर्वत',
'Kusma',
'कुश्मा',
4),

(
45,
'Syangja',
'स्याङजा',
'Putalibazar',
'पुतलीबजार',
4),

(
46,
'Tanahun',
'तनहुँ',
'Vyas',
'व्यास',
4),

(
47,
'Kapilvastu',
'कपिलवस्तु',
'Kapilvastu',
'कपिलवस्तु',
5),

(
48,
'Nawalparasi',
'नवलपरासी',
'Ramgram',
'रामग्राम',
5),

(
49,
'Rupandehi',
'रुपन्देही',
'Siddharthanagar',
'सिद्धार्थनगर',
5),

(
50,
'Arghakhanchi',
'अर्घाखाँची',
'Sandhikharka',
'सन्धीखर्क',
5),

(
51,
'Gulmi',
'गुल्मी',
'Resunga',
'रेसुङ्गा',
5),

(
52,
'Palpa',
'पाल्पा',
'Tansen',
'तानसेन',
5),

(
53,
'Dang Deukhuri',
'दाङ देउखुरी',
'Ghorahi',
'घोराही',
5),

(
54,
'Pyuthan',
'प्युठान',
'Pyuthan',
'प्युठान',
5),

(
55,
'Rolpa',
'रोल्पा',
'Rolpa',
'रोल्पा',
5),

(
56,
'Eastern Rukum',
'पूर्वी रूकुम',
'Sisne',
'सिस्ने',
5),

(
57,
'Banke',
'बाँके',
'Nepalganj',
'नेपालगञ्ज',
5),

(
58,
'Bardiya',
'बर्दिया',
'Gulariya',
'गुलरिया',
5),

(
59,
'Western Rukum',
'पश्चिमी रूकुम',
'Musikot',
'मुसीकोट',
6),

(
60,
'Salyan',
'सल्यान',
'Shaarada',
'शारदा',
6),

(
61,
'Dolpa',
'डोल्पा',
'Thuli Bheri',
'ठूली भेरी',
6),

(
62,
'Humla',
'हुम्ला',
'Simikot',
'सिमिकोट',
6),

(
63,
'Jumla',
'जुम्ला',
'Chandannath',
'चन्दननाथ',
6),

(
64,
'Kalikot',
'कालिकोट',
'Khandachakra',
'खाँडाचक्र',
6),

(
65,
'Mugu',
'मुगु',
'Chhayanath Rara',
'छायाँनाथ रारा',
6),

(
66,
'Surkhet',
'सुर्खेत',
'Birendranagar',
'बिरेन्द्रनगर',
6),

(
67,
'Dailekh',
'दैलेख',
'Narayan',
'नारायण',
6),

(
68,
'Jajarkot',
'जाजरकोट',
'Bheri',
'भेरी',
6),

(
69,
'Kailali',
'कैलाली',
'Dhangadhi',
'धनगढी',
7),

(
70,
'Achham',
'अछाम',
'Mangalsen',
'मङ्गलसेन',
7),

(
71,
'Doti',
'डोटी',
'Dipayal Silgadhi',
'दिपायल सिलगढी',
7),

(
72,
'Bajhang',
'बझाङ',
'Jayaprithvi',
'जयपृथ्वी',
7),

(
73,
'Bajura',
'बाजुरा',
'Badimalika',
'बडीमालिका',
7),

(
74,
'Kanchanpur',
'कंचनपुर',
'Bheemdatta',
'भिमदत्त',
7),

(
75,
'Dadeldhura',
'डडेलधुरा',
'Amargadhi',
'अमरगढी',
7),

(
76,
'Baitadi',
'बैतडी',
'Dasharathchand',
'दशरथचन्द',
7),

(
77,
'Darchula',
'दार्चुला',
'Mahakali',
'महाकाली',
7);


-- local_level --

INSERT INTO `local_level` (`id`, `local_level_name_eng`, `local_level_name_nep`, `district_id`, `local_level_type_id`, `total_wards`) VALUES
(
1,
'Phungling',
'फुङलिङ',
12,
2,
11
),

(
2,
'Aathrai Tribeni',
'आठराई त्रिवेणी',
12,
1,
5
),

(
3,
'Sidingba',
'सिदिङ्वा',
12,
1,
7
),

(
4,
'Phaktanglung',
'फक्ताङलुङ',
12,
1,
7
),

(
5,
'Mikwakhola',
'मिक्वाखोला',
12,
1,
5
),

(
6,
'Meringden',
'मेरिङदेन',
12,
1,
6
),

(
7,
'Maiwakhola',
'मैवाखोला',
12,
1,
6
),

(
8,
'Pathivara Yangwarak',
'पाथीभरा याङवरक',
12,
1,
6
),

(
9,
'Sirijangha',
'सिरीजङ्घा',
12,
1,
8
),

(
10,
'Phidim',
'फिदिम',
8,
2,
14
),

(
11,
'Phalelung',
'फालेलुङ',
8,
1,
8
),

(
12,
'Phalgunanda',
'फाल्गुनन्द',
8,
1,
7
),

(
13,
'Hilihang',
'हिलिहाङ',
8,
1,
7
),

(
14,
'Kummayak',
'कुम्मायक',
8,
1,
5
),

(
15,
'Miklajung',
'मिक्लाजुङ',
8,
1,
8
),

(
16,
'Tumwewa',
'तुम्बेवा',
8,
1,
5
),

(
17,
'Yangwarak',
'याङवरक',
8,
1,
6
),

(
18,
'Ilam',
'ईलाम',
3,
2,
12
),

(
19,
'Deumai',
'देउमाई',
3,
2,
9
),

(
20,
'Mai',
'माई',
3,
2,
10
),

(
21,
'Suryodaya',
'सूर्योदय',
3,
2,
14
),

(
22,
'Phakphokthum',
'फाकफोकथुम',
3,
1,
7
),

(
23,
'Chulachuli',
'चुलाचुली',
3,
1,
6
),

(
24,
'Maijogmai',
'माईजोगमाई',
3,
1,
6
),

(
25,
'Mansebung',
'माङसेबुङ',
3,
1,
6
),

(
26,
'Rong',
'रोङ',
3,
1,
6
),

(
27,
'Sandakpur',
'सन्दकपुर',
3,
1,
5
),

(
28,
'Mechinagar',
'मेचीनगर',
4,
2,
15
),

(
29,
'Damak',
'दमक',
4,
2,
10
),

(
30,
'Kankai',
'कन्काई',
4,
2,
9
),

(
31,
'Bhadrapur',
'भद्रपुर',
4,
2,
10
),

(
32,
'Arjundhara',
'अर्जुनधारा',
4,
2,
11
),

(
33,
'Shivasatakshi',
'शिवशताक्षी',
4,
2,
11
),

(
34,
'Gauradaha',
'गौरादह',
4,
2,
9
),

(
35,
'Birtamod',
'विर्तामोड',
4,
2,
10
),

(
36,
'Kamal',
'कमल',
4,
1,
7
),

(
37,
'Gaurigunj',
'गौरीगंज',
4,
1,
6
),

(
38,
'Bahradashi',
'बाह्रदशी',
4,
1,
7
),

(
39,
'Jhapa',
'झापा',
4,
1,
7
),

(
40,
'Buddhashanti',
'बुद्धशान्ति',
4,
1,
7
),

(
41,
'Haldibari',
'हल्दिवारी',
4,
1,
5
),

(
42,
'Kachankawal',
'कचनकवल',
4,
1,
7
),

(
43,
'Biratnagar',
'विराटनगर',
6,
4,
19
),

(
44,
'Belbari',
'बेलवारी',
6,
2,
11
),

(
45,
'Letang',
'लेटाङ',
6,
2,
9
),

(
46,
'Pathari Shanishchare',
'पथरी शनिश्चरे',
6,
2,
10
),

(
47,
'Rangeli',
'रंगेली',
6,
2,
9
),

(
48,
'Ratuwamai',
'रतुवामाई',
6,
2,
10
),

(
49,
'Sunawarshi',
'सुनवर्षि',
6,
2,
9
),

(
50,
'Urlabari',
'उर्लावारी',
6,
2,
9
),

(
51,
'Sundarharaicha',
'सुन्दरहरैचा',
6,
2,
12
),

(
52,
'Budhiganga',
'बुढीगंगा',
6,
1,
7
),

(
53,
'Dhanapalthan',
'धनपालथान',
6,
1,
7
),

(
54,
'Gramthan',
'ग्रामथान',
6,
1,
7
),

(
55,
'Jahada',
'जहदा',
6,
1,
7
),

(
56,
'Kanepokhari',
'कानेपोखरी',
6,
1,
7
),

(
57,
'Katahari',
'कटहरी',
6,
1,
7
),

(
58,
'Kerabari',
'केरावारी',
6,
1,
10
),

(
59,
'Miklajung',
'मिक्लाजुङ',
6,
1,
9
),

(
60,
'Itahari',
'ईटहरी',
11,
3,
20
),

(
61,
'Dharan',
'धरान',
11,
3,
20
),

(
62,
'Inaruwa',
'ईनरुवा',
11,
2,
10
),

(
63,
'Duhabi',
'दुहवी',
11,
2,
12
),

(
64,
'Ramdhuni',
'रामधुनी',
11,
2,
9
),

(
65,
'Barahakshetra',
'बराहक्षेत्र',
11,
2,
11
),

(
66,
'Dewanganj',
'देवानगञ्ज',
11,
1,
7
),

(
67,
'Koshi',
'कोशी',
11,
1,
8
),

(
68,
'Gadhi',
'गढी',
11,
1,
6
),

(
69,
'Barju',
'बर्जु',
11,
1,
6
),

(
70,
'Bhokraha Narsingh',
'भोक्राहा नरसिंह',
11,
1,
8
),

(
71,
'Harinagara',
'हरिनगर',
11,
1,
7
),

(
72,
'Pakhribas',
'पाख्रिबास',
2,
2,
10
),

(
73,
'Dhankuta',
'धनकुटा',
2,
2,
10
),

(
74,
'Mahalaxmi',
'महालक्ष्मी',
2,
2,
9
),

(
75,
'Sangurigadhi',
'साँगुरीगढी',
2,
1,
10
),

(
76,
'Shahidbhumi',
'सहिदभूमि',
2,
1,
7
),

(
77,
'Chhathar Jorpati',
'छथर जोरपाटी',
2,
1,
6
),

(
78,
'Choubise',
'चौविसे',
2,
1,
8
),

(
79,
'Myanglung',
'म्याङलुङ',
13,
2,
10
),

(
80,
'Laligurans',
'लालीगुराँस',
13,
2,
9
),

(
81,
'Aathrai',
'आठराई',
13,
1,
7
),

(
82,
'Chhathar',
'छथर',
13,
1,
6
),

(
83,
'Phedap',
'फेदाप',
13,
1,
5
),

(
84,
'Menchhayayem',
'मेन्छयायेम',
13,
1,
6
),

(
85,
'Chainpur',
'चैनपुर',
9,
2,
11
),

(
86,
'Dharmadevi',
'धर्मदेवी',
9,
2,
9
),

(
87,
'Khandbari',
'खाँदवारी',
9,
2,
11
),

(
88,
'Madi',
'मादी',
9,
2,
9
),

(
89,
'Panchkhapan',
'पाँचखपन',
9,
2,
9
),

(
90,
'Bhotkhola',
'भोटखोला',
9,
1,
5
),

(
91,
'Chichila',
'चिचिला',
9,
1,
5
),

(
92,
'Makalu',
'मकालु',
9,
1,
6
),

(
93,
'Savapokhari',
'सभापोखरी',
9,
1,
6
),

(
94,
'Silichong',
'सिलीचोङ',
9,
1,
5
),

(
95,
'Bhojpur',
'भोजपुर',
1,
2,
12
),

(
96,
'Shadananda',
'षडानन्द',
1,
2,
14
),

(
97,
'Tyamkemaiyum',
'टेम्केमैयुङ',
1,
1,
9
),

(
98,
'Ramprasad Rai',
'रामप्रसाद राई',
1,
1,
8
),

(
99,
'Arun',
'अरुण',
1,
1,
7
),

(
100,
'Pauwadungma',
'पौवादुङमा',
1,
1,
6
),


(
101,
'Salpasilichho',
'साल्पासिलिछो',
1,
1,
6
),

(
102,
'Aamchowk',
'आमचोक',
1,
1,
10
),

(
103,
'Hatuwagadhi',
'हतुवागढी',
1,
1,
9
),

(
104,
'Solududhkunda',
'सोलुदुधकुण्ड',
10,
2,
11
),

(
105,
'Mapya Dudhkoshi',
'माप्य दुधकोशी',
10,
1,
7
),

(
106,
'Khumbu Pasanglhamu',
'खुम्वु पासाङल्हमु',
10,
1,
5
),

(
107,
'Thulung Dudhkoshi',
'थुलुङ दुधकोशी',
10,
1,
9
),

(
108,
'Nechasalyan',
'नेचासल्यान',
10,
1,
5
),

(
109,
'Mahakulung',
'माहाकुलुङ',
10,
1,
5
),

(
110,
'Likhu Pike',
'लिखु पिके',
10,
1,
5
),

(
111,
'Sotang',
'सोताङ',
10,
1,
5
),

(
112,
'Siddhicharan',
'सिद्दिचरण',
7,
2,
12
),

(
113,
'Khijidemba',
'खिजिदेम्बा',
7,
1,
9
),

(
114,
'Champadevi',
'चम्पादेवी',
7,
1,
10
),

(
115,
'Chishankhugadhi',
'चिशंखुगढी',
7,
1,
8
),

(
116,
'Manebhanjyang',
'मानेभञ्याङ',
7,
1,
9
),

(
117,
'Molung',
'मोलुङ',
7,
1,
8
),

(
118,
'Likhu',
'लिखु',
7,
1,
9
),

(
119,
'Sunkoshi',
'सुनकोशी',
7,
1,
10
),

(
120,
'Halesi Tuwachung',
'हलेसी तुवाचुङ',
5,
2,
11
),

(
121,
'Diktel Rupakot Majhuwagadhi',
'दिक्तेल रुपाकोट मझुवागढी',
5,
2,
15
),

(
122,
'Aiselukharka',
'ऐसेलुखर्क',
5,
1,
7
),

(
123,
'Rawa Besi',
'रावा बेसी',
5,
1,
6
),

(
124,
'Jantedhunga',
'जन्तेढुंगा',
5,
1,
6
),

(
125,
'Khotehang',
'खोटेहाङ',
5,
1,
9
),

(
126,
'Kepilasgadhi',
'केपिलासगढी',
5,
1,
7
),

(
127,
'Diprung Chuichumma',
'दिप्रुङ चुइचुम्मा',
5,
1,
7
),

(
128,
'Sakela',
'साकेला',
5,
1,
5
),

(
129,
'Barahapokhari',
'वराहपोखरी',
5,
1,
6
),

(
130,
'Katari',
'कटारी',
14,
2,
14
),

(
131,
'Chaudandigadhi',
'चौदण्डीगढी',
14,
2,
10
),

(
132,
'Triyuga',
'त्रियुगा',
14,
2,
16
),

(
133,
'Belaka',
'वेलका',
14,
2,
9
),

(
134,
'Udayapurgadhi',
'उदयपुरगढी',
14,
1,
8
),

(
135,
'Tapli',
'ताप्ली',
14,
1,
5
),

(
136,
'Rautamai',
'रौतामाई',
14,
1,
8
),

(
137,
'Limchungbung',
'लिम्चुङ्बुङ',
14,
1,
5
),

(
138,
'Rajbiraj',
'राजविराज',
22,
2,
16
),

(
139,
'Kanchanrup',
'कञ्चनरुप',
22,
2,
12
),

(
140,
'Dakneshwori',
'डाक्नेश्वरी',
22,
2,
10
),

(
141,
'Bodebarsain',
'बोदेबरसाईन',
22,
2,
10
),

(
142,
'Khadak',
'खडक',
22,
2,
11
),

(
143,
'Shambhunath',
'शम्भुनाथ',
22,
2,
12
),

(
144,
'Surunga',
'सुरुङ्‍गा',
22,
2,
11
),

(
145,
'Hanumannagar Kankalini',
'हनुमाननगर कङ्कालिनी',
22,
2,
14
),

(
146,
'Saptakoshi',
'सप्तकोशी',
22,
2,
11
),

(
147,
'Agnisair Krishnasawaran',
'अग्निसाइर कृष्णासरवन',
22,
1,
6
),

(
148,
'Chhinnamasta',
'छिन्नमस्ता',
22,
1,
7
),

(
149,
'Mahadeva',
'महादेवा',
22,
1,
6
),

(
150,
'Tirahut',
'तिरहुत',
22,
1,
5
),

(
151,
'Tilathi Koiladi',
'तिलाठी कोईलाडी',
22,
1,
8
),

(
152,
'Rupani',
'रुपनी',
22,
1,
6
),

(
153,
'Rajgadh',
'राजगढ',
22,
1,
6
),

(
154,
'Bishnupur',
'बिष्णुपुर',
22,
1,
7
),

(
155,
'Balan Bihul',
'बलान बिहुल',
22,
1,
6
),

(
156,
'Lahan',
'लहान',
20,
2,
24
),

(
157,
'Dhangadhimai',
'धनगढीमाई',
20,
2,
14
),

(
158,
'Siraha',
'सिराहा',
20,
2,
22
),

(
159,
'Golbazar',
'गोलबजार',
20,
2,
13
),

(
160,
'Mirchaiya',
'मिर्चैयाँ',
20,
2,
12
),

(
161,
'Kalyanpur',
'कल्याणपुर',
20,
2,
12
),

(
162,
'Karjanha',
'कर्जन्हा',
20,
2,
11
),

(
163,
'Sukhipur',
'सुखीपुर',
20,
2,
10
),

(
164,
'Bhagwanpur',
'भगवानपुर',
20,
1,
5
),

(
165,
'Aurahi',
'औरही',
20,
1,
5
),

(
166,
'Bishnupur',
'विष्णुपुर',
20,
1,
5
),

(
167,
'Bariyapatti',
'बरियारपट्टी',
20,
1,
5
),

(
168,
'Laxmipur Patari',
'लक्ष्मीपुर पतारी',
20,
1,
6
),

(
169,
'Naraha',
'नरहा',
20,
1,
5
),

(
170,
'Sakhuwanankarkatti',
'सखुवानान्कारकट्टी',
20,
1,
5
),

(
171,
'Anarma',
'अर्नमा',
20,
1,
5
),

(
172,
'Nawarajpur',
'नवराजपुर',
20,
1,
5
),


(
173,
'Janakpurdham',
'जनकपुरधाम',
19,
3,
25
),

(
174,
'Kshireshwornath',
'क्षिरेश्वरनाथ',
19,
2,
10
),

(
175,
'Ganeshman Charnath',
'गणेशमान चारनाथ',
19,
2,
11
),

(
176,
'Dhanushadham',
'धनुषाधाम',
19,
2,
9
),

(
177,
'Nagrain',
'नगराइन',
19,
2,
9
),

(
178,
'Bideha',
'विदेह',
19,
2,
9
),

(
179,
'Mithila',
'मिथिला',
19,
2,
11
),

(
180,
'Shahidnagar',
'शहीदनगर',
19,
2,
9
),

(
181,
'Sabaila',
'सबैला',
19,
2,
13
),

(
182,
'Kamala',
'कमला',
19,
2,
9
),

(
183,
'Mithila Bihari',
'मिथिला बिहारी',
19,
2,
10
),

(
184,
'Hansapur',
'हंसपुर',
19,
2,
9
),

(
185,
'Janaknandini',
'जनकनन्दिनी',
19,
1,
6
),

(
186,
'Bateshwor',
'बटेश्वर',
19,
1,
5
),

(
187,
'Mukhiyapatti Musaharmiya',
'मुखियापट्टी मुसहरमिया',
19,
1,
6
),

(
188,
'Laxminiya',
'लक्ष्मीनिया',
19,
1,
7
),

(
189,
'Aurahi',
'औरही',
19,
1,
6
),

(
190,
'Dhanauji',
'धनौजी',
19,
1,
5
),

(
191,
'Jaleshwor',
'जलेश्वर',
21,
2,
12
),

(
192,
'Bardibas',
'बर्दिबास',
21,
2,
14
),

(
193,
'Gaushala',
'गौशाला',
21,
2,
12
),

(
194,
'Loharpatti',
'लोहरपट्टी',
21,
2,
9
),

(
195,
'Ramgopalpur',
'रामगोपालपुर',
21,
2,
9
),

(
196,
'Manra Shiswa',
'मनरा शिसवा',
21,
2,
10
),

(
197,
'Matihani',
'मटिहानी',
21,
2,
9
),

(
198,
'Bhagaha',
'भँगाहा',
21,
2,
9
),

(
199,
'Balwa',
'बलवा',
21,
2,
11
),

(
200,
'Aurahi',
'औरही',
21,
2,
9
),

(
201,
'Ekdara',
'एकडारा',
21,
1,
6
),

(
202,
'Sonma',
'सोनमा',
21,
1,
8
),

(
203,
'Samsi',
'साम्सी',
21,
1,
7
),

(
204,
'Mahottari',
'महोत्तरी',
21,
1,
6
),

(
205,
'Pipra',
'पिपरा',
21,
1,
7
),

(
206,
'Ishworpur',
'ईश्वरपुर',
18,
2,
15
),

(
207,
'Malangwa',
'मलंगवा',
18,
2,
12
),

(
208,
'Lalbandi',
'लालबन्दी',
18,
2,
17
),

(
209,
'Haripur',
'हरिपुर',
18,
2,
9
),

(
210,
'Haripurwa',
'हरिपुर्वा',
18,
2,
9
),

(
211,
'Harion',
'हरिवन',
18,
2,
11
),

(
212,
'Barhathwa',
'बरहथवा',
18,
2,
18
),

(
213,
'Balra',
'बलरा',
18,
2,
11
),

(
214,
'Godaita',
'गोडैटा',
18,
2,
12
),

(
215,
'Bagmati',
'बागमती',
18,
2,
12
),

(
216,
'Kawilasi',
'कविलासी',
18,
2,
10
),

(
217,
'Chakraghatta',
'चक्रघट्टा',
18,
1,
9
),

(
218,
'Chandranagar',
'चन्द्रनगर',
18,
1,
7
),

(
219,
'Dhankaul',
'धनकौल',
18,
1,
7
),

(
220,
'Brahmapuri',
'ब्रह्मपुरी',
18,
1,
7
),

(
221,
'Ramnagar',
'रामनगर',
18,
1,
7
),

(
222,
'Bishnu',
'विष्णु',
18,
1,
8
),

(
223,
'Kaudena',
'कौडेना',
18,
1,
7
),

(
224,
'Parsa',
'पर्सा',
18,
1,
6
),

(
225,
'Basbariya',
'बसबरीया',
18,
1,
6
),

(
226,
'Kamalamai',
'कमलामाई',
23,
2,
14
),

(
227,
'Dudhauli',
'दुधौली',
23,
2,
14
),

(
228,
'Golanjor',
'गोलन्जर',
23,
1,
7
),

(
229,
'Ghyanglekh',
'घ्याङलेख',
23,
1,
5
),

(
230,
'Tinpatan',
'तीनपाटन',
23,
1,
11
),

(
231,
'Phikkal',
'फिक्कल',
23,
1,
6
),

(
232,
'Marin',
'मरिण',
23,
1,
7
),

(
233,
'Sunkoshi',
'सुनकोशी',
23,
1,
7
),

(
234,
'Hariharpurgadhi',
'हरिहरपुरगढी',
23,
1,
8
),

(
235,
'Manthali',
'मन्थली',
24,
2,
14
),

(
236,
'Ramechhap',
'रामेछाप',
24,
2,
9
),

(
237,
'Umakunda',
'उमाकुण्ड',
24,
1,
7
),

(
238,
'Khandadevi',
'खाँडादेवी',
24,
1,
9
),

(
239,
'Gokulganga',
'गोकुलगङ्गा',
24,
1,
6
),

(
240,
'Doramba',
'दोरम्बा',
24,
1,
7
),

(
241,
'Likhu Tamakoshi',
'लिखु तामाकोशी',
24,
1,
7
),

(
242,
'Sunapati',
'सुनापती',
24,
1,
5
),

(
243,
'Jiri',
'जिरी',
25,
2,
9
),

(
244,
'Bhimeshwor',
'भिमेश्वर',
25,
2,
9
),

(
245,
'Kalinchowk',
'कालिन्चोक',
25,
1,
9
),

(
246,
'Gaurishankar',
'गौरीशङ्कर',
25,
1,
9
),

(
247,
'Tamakoshi',
'तामाकोशी',
25,
1,
7
),

(
248,
'Melung',
'मेलुङ्ग',
25,
1,
7
),

(
249,
'Bigu',
'विगु',
25,
1,
8
),

(
250,
'Baiteshwor',
'वैतेश्वर',
25,
1,
8
),

(
251,
'Shailung',
'शैलुङ्ग',
25,
1,
8
),

(
252,
'Chautara Sangachowkgadhi',
'चौतारा साँगाचोकगढी',
33,
2,
14
),

(
253,
'Bahrabise',
'बाह्रविसे',
33,
2,
9
),

(
254,
'Melamchi',
'मेलम्ची',
33,
2,
13
),

(
255,
'Indrawati',
'ईन्द्रावती',
33,
1,
12
),

(
256,
'Jugal',
'जुगल',
33,
1,
7
),

(
257,
'Panchpokhari Thangpal',
'पाँचपोखरी थाङपाल',
33,
1,
8
),

(
258,
'Balephi',
'बलेफी',
33,
1,
8
),

(
259,
'Bhotekoshi',
'भोटेकोशी',
33,
1,
5
),

(
260,
'Lisankhu Pakhar',
'लिसङ्खु पाखर',
33,
1,
7
),

(
261,
'Sunkoshi',
'सुनकोशी',
33,
1,
7
),

(
262,
'Helambu',
'हेलम्बु',
33,
1,
7
),

(
263,
'Tripurasundari',
'त्रिपुरासुन्दरी',
33,
1,
6
),

(
264,
'Dhulikhel',
'धुलिखेल',
29,
2,
12
),

(
265,
'Banepa',
'बनेपा',
29,
2,
14
),

(
266,
'Panauti',
'पनौती',
29,
2,
12
),

(
267,
'Panchkhal',
'पाँचखाल',
29,
2,
13
),

(
268,
'Namobuddha',
'नमोबुद्ध',
29,
2,
11
),

(
269,
'Mandandeupur',
'मण्डनदेउपुर',
29,
2,
12
),

(
270,
'Khanikhola',
'खानीखोला',
29,
1,
7
),

(
271,
'Chaurideurali',
'चौंरीदेउराली',
29,
1,
9
),

(
272,
'Temal',
'तेमाल',
29,
1,
9
),

(
273,
'Bethanchowk',
'बेथानचोक',
29,
1,
6
),

(
274,
'Bhumlu',
'भुम्लु',
29,
1,
10
),

(
275,
'Mahabharat',
'महाभारत',
29,
1,
8
),

(
276,
'Roshi',
'रोशी',
29,
1,
12
),

(
277,
'Lalitpur',
'ललितपुर',
30,
4,
29
),

(
278,
'Godawari',
'गोदावरी',
30,
2,
14
),

(
279,
'Mahalaxmi',
'महालक्ष्मी',
30,
2,
10
),

(
280,
'Konjyosom',
'कोन्ज्योसोम',
30,
1,
5
),

(
281,
'Bagmati',
'बागमती',
30,
1,
7
),

(
282,
'Mahankal',
'महाङ्काल',
30,
1,
6
),

(
283,
'Changunarayan',
'चाँगुनारायण',
26,
2,
9
),

(
284,
'Bhaktapur',
'भक्तपुर',
26,
2,
10
),

(
285,
'Madhyapur Thimi',
'मध्यपुर थिमी',
26,
2,
9
),

(
286,
'Suryabinayak',
'सूर्यविनायक',
26,
2,
10
),

(
287,
'Kathmandu',
'काठमाण्डौं',
28,
4,
32
),

(
288,
'Kageshwori Manohara',
'कागेश्वरी मनोहरा',
28,
2,
9
),

(
289,
'Kirtipur',
'कीर्तिपुर',
28,
2,
10
),

(
290,
'Gokarneshwor',
'गोकर्णेश्वर',
28,
2,
9
),

(
291,
'Chandragiri',
'चन्द्रागिरी',
28,
2,
15
),

(
292,
'Tokha',
'टोखा',
28,
2,
11
),

(
293,
'Tarakeshwor',
'तारकेश्वर',
28,
2,
11
),

(
294,
'Dakshinkali',
'दक्षिणकाली',
28,
2,
9
),

(
295,
'Nagarjun',
'नागार्जुन',
28,
2,
10
),

(
296,
'Budhanilkantha',
'बुढानिलकण्ठ',
28,
2,
13
),

(
297,
'Shankharapur',
'शङ्खरापुर',
28,
2,
9
),

(
298,
'Bidur',
'विदुर',
31,
2,
13
),

(
299,
'Belkotgadhi',
'बेलकोटगढी',
31,
2,
13
),

(
300,
'Kakani',
'ककनी',
31,
1,
8
),

(
301,
'Kispang',
'किस्पाङ',
31,
1,
5
),

(
302,
'Tadi',
'तादी',
31,
1,
6
),

(
303,
'Tarakeshwor',
'तारकेश्वर',
31,
1,
6
),

(
304,
'Dupcheshwor',
'दुप्चेश्वर',
31,
1,
7
),

(
305,
'Panchakanya',
'पञ्चकन्या',
31,
1,
5
),

(
306,
'Likhu',
'लिखु',
31,
1,
6
),

(
307,
'Meghang',
'म्यगङ',
31,
1,
6
),

(
308,
'Shivapuri',
'शिवपुरी',
31,
1,
8
),

(
309,
'Suryagadhi',
'सुर्यगढी',
31,
1,
5
),

(
310,
'Uttargaya',
'उत्तरगया',
32,
1,
5
),

(
311,
'Kalika',
'कालिका',
32,
1,
5
),

(
312,
'Gosaikunda',
'गोसाईकुण्ड',
32,
1,
6
),

(
313,
'Naukunda',
'नौकुण्ड',
32,
1,
6
),

(
314,
'Aamachhodingmo',
'आमाछोदिङमो',
32,
1,
5
),

(
315,
'Dhunibeshi',
'धुनीबेंशी',
27,
2,
9
),

(
316,
'Neelakantha',
'निलकण्ठ',
27,
2,
14
),

(
317,
'Khaniyabas',
'खनियाबास',
27,
1,
5
),

(
318,
'Gajuri',
'गजुरी',
27,
1,
8
),

(
319,
'Galchhi',
'गल्छी',
27,
1,
8
),

(
320,
'Gangajamuna',
'गङ्गाजमुना',
27,
1,
7
),

(
321,
'Jwalamukhi',
'ज्वालामूखी',
27,
1,
7
),

(
322,
'Thakre',
'थाक्रे',
27,
1,
11
),

(
323,
'Netrawati Dabajong',
'नेत्रावती डबजोङ',
27,
1,
5
),

(
324,
'Benighat Rorang',
'बेनीघाट रोराङ्ग',
27,
1,
10
),

(
325,
'Rubi Valley',
'रुवी भ्याली',
27,
1,
6
),

(
326,
'Siddhalek',
'सिद्धलेक',
27,
1,
7
),

(
327,
'Tripurasundari',
'त्रिपुरासुन्दरी',
27,
1,
7
),

(
328,
'Hetauda',
'हेटौडा',
35,
3,
19
),

(
329,
'Thaha',
'थाहा',
35,
2,
12
),

(
330,
'Indrasarowar',
'इन्द्रसरोबर',
35,
1,
5
),

(
331,
'Kailash',
'कैलाश',
35,
1,
10
),

(
332,
'Bakaiya',
'बकैया',
35,
1,
12
),

(
333,
'Bagmati',
'बाग्मति',
35,
1,
9
),

(
334,
'Bhimphedi',
'भिमफेदी',
35,
1,
9
),

(
335,
'Makawanpurgadhi',
'मकवानपुरगढी',
35,
1,
8
),

(
336,
'Manahari',
'मनहरी',
35,
1,
9
),

(
337,
'Raksirang',
'राक्सिराङ्ग',
35,
1,
9
),

(
338,
'Chandrapur',
'चन्द्रपुर',
17,
2,
10
),

(
339,
'Garuda',
'गरुडा',
17,
2,
9
),

(
340,
'Gaur',
'गौर',
17,
2,
9
),

(
341,
'Baudhimai',
'बौधीमाई',
17,
2,
9
),

(
342,
'Brindawan',
'बृन्दावन',
17,
2,
9
),

(
343,
'Dewahi Gonahi',
'देवाही गोनाही',
17,
2,
9
),

(
344,
'Gadhimai',
'गढीमाई',
17,
2,
9
),

(
345,
'Gujara',
'गुजरा',
17,
2,
9
),

(
346,
'Katahariya',
'कटहरिया',
17,
2,
9
),

(
347,
'Madhav Narayan',
'माधव नारायण',
17,
2,
9
),

(
348,
'Maulapur',
'मौलापुर',
17,
2,
9
),

(
349,
'Phatuwabijaypur',
'फतुवाबिजयपुर',
17,
2,
11
),

(
350,
'Ishnath',
'ईशनाथ',
17,
2,
9
),

(
351,
'Paroha',
'परोहा',
17,
2,
9
),

(
352,
'Rajpur',
'राजपुर',
17,
2,
9
),

(
353,
'Rajdevi',
'राजदेवी',
17,
2,
9
),

(
354,
'Durga Bhagawati',
'दुर्गा भगवती',
17,
1,
5
),

(
355,
'Yamunamai',
'यमुनामाई',
17,
1,
5
),

(
356,
'Kalaiya',
'कलैया',
16,
3,
27
),

(
357,
'Jeetpur Simara',
'जीतपुर सिमरा',
16,
3,
24
),

(
358,
'Kolhabi',
'कोल्हवी',
16,
2,
11
),

(
359,
'Nijgadh',
'निजगढ',
16,
2,
13
),

(
360,
'Mahagadimai',
'महागढीमाई',
16,
2,
11
),

(
361,
'Simraungadh',
'सिम्रौनगढ',
16,
2,
11
),

(
362,
'Pachrauta',
'पचरौता',
16,
2,
9
),

(
363,
'Aadarsha Kotwal',
'आदर्श कोटवाल',
16,
1,
8
),

(
364,
'Karaiyamai',
'करैयामाई',
16,
1,
8
),

(
365,
'Devtal',
'देवताल',
16,
1,
7
),

(
366,
'Parwanipur',
'परवानीपुर',
16,
1,
5
),

(
367,
'Prasauni',
'प्रसौनी',
16,
1,
7
),

(
368,
'Pheta',
'फेटा',
16,
1,
7
),

(
369,
'Baragadhi',
'बारागढी',
16,
1,
6
),

(
370,
'Suwarna',
'सुवर्ण',
16,
1,
8
),

(
371,
'Bishrampur',
'विश्रामपुर',
16,
1,
5
),

(
372,
'Birgunj',
'बिरगंज',
15,
4,
32
),

(
373,
'Pokhariya',
'पोखरिया',
15,
2,
10
),

(
374,
'Bahudarmai',
'बहुदरमाई',
15,
2,
9
),

(
375,
'Parsagadhi',
'पर्सागढी',
15,
2,
9
),

(
376,
'Thori',
'ठोरी',
15,
1,
5
),

(
377,
'Jagarnathpur',
'जगरनाथपुर',
15,
1,
6
),

(
378,
'Dhobini',
'धोबीनी',
15,
1,
5
),

(
379,
'Chhipaharmai',
'छिपहरमाई',
15,
1,
5
),

(
380,
'Pakaha Mainpur',
'पकाहा मैनपुर',
15,
1,
5
),

(
381,
'Bindabasini',
'बिन्दबासिनी',
15,
1,
5
),

(
382,
'Sakhuwa Prasauni',
'सखुवा प्रसौनी',
15,
1,
6
),

(
383,
'Paterwa Sugauli',
'पटेर्वा सुगौली',
15,
1,
5
),

(
384,
'Kalikamai',
'कालिकामाई',
15,
1,
5
),

(
385,
'Jira Bhawani',
'जिरा भवानी',
15,
1,
5
),

(
386,
'Bharatpur',
'भरतपुर',
34,
4,
29
),

(
387,
'Kalika',
'कालिका',
34,
2,
11
),

(
388,
'Khairhani',
'खैरहनी',
34,
2,
13
),

(
389,
'Madi',
'माडी',
34,
2,
9
),

(
390,
'Ratnanagar',
'रत्ननगर',
34,
2,
16
),

(
391,
'Rapti',
'राप्ती',
34,
2,
13
),

(
392,
'Ichchhakamana',
'इच्छाकामना',
34,
1,
7
),

(
393,
'Gorkha',
'गोरखा',
37,
2,
14
),

(
394,
'Palungtar',
'पालुङटार',
37,
2,
10
),

(
395,
'Barpak Sulikot',
'बारपाक सुलिकोट',
37,
1,
8
),

(
396,
'Siranchowk',
'सिरानचोक',
37,
1,
8
),

(
397,
'Ajirkot',
'अजिरकोट',
37,
1,
5
),

(
398,
'Aarughat',
'आरूघाट',
37,
1,
10
),

(
399,
'Gandaki',
'गण्डकी',
37,
1,
8
),

(
400,
'Chumanuwri',
'चुमनुव्री',
37,
1,
7
),

(
401,
'Dharche',
'धार्चे',
37,
1,
7
),

(
402,
'Bhimsen',
'भिमसेनथापा',
37,
1,
8
),

(
403,
'Shahid Lakhan',
'शहिद लखन',
37,
1,
9
),

(
404,
'Besishahar',
'बेसीशहर',
39,
2,
11
),

(
405,
'Madhyanepal',
'मध्यनेपाल',
39,
2,
10
),

(
406,
'Rainas',
'राईनास',
39,
2,
10
),

(
407,
'Sundarbazar',
'सुन्दरबजार',
39,
2,
11
),

(
408,
'Kwholasothar',
'क्व्होलासोथार',
39,
1,
9
),

(
409,
'Dudhpokhari',
'दूधपोखरी',
39,
1,
6
),

(
410,
'Dordi',
'दोर्दी',
39,
1,
9
),

(
411,
'Marsyangdi',
'मर्स्याङदी',
39,
1,
9
),

(
412,
'Bhanu',
'भानु',
46,
2,
13
),

(
413,
'Bhimad',
'भिमाद',
46,
2,
9
),

(
414,
'Vyas',
'व्यास',
46,
2,
14
),

(
415,
'Shuklagandaki',
'शुक्लागण्डकी',
46,
2,
12
),

(
416,
'Aanbookhaireni',
'आँबुखैरेनी',
46,
1,
6
),

(
417,
'Rishing',
'ऋषिङ्ग',
46,
1,
8
),

(
418,
'Ghiring',
'घिरिङ',
46,
1,
5
),

(
419,
'Devghat',
'देवघाट',
46,
1,
5
),

(
420,
'Myagde',
'म्याग्दे',
46,
1,
7
),

(
421,
'Bandipur',
'वन्दिपुर',
46,
1,
6
),

(
422,
'Galyang',
'गल्याङ',
45,
2,
11
),

(
423,
'Chapakot',
'चापाकोट',
45,
2,
10
),

(
424,
'Putalibazar',
'पुतलीबजार',
45,
2,
14
),

(
425,
'Bheerkot',
'भीरकोट',
45,
2,
9
),

(
426,
'Waling',
'वालिङ',
45,
2,
14
),

(
427,
'Arjunchaupari',
'अर्जुनचौपारी',
45,
1,
6
),

(
428,
'Aandhikhola',
'आँधिखोला',
45,
1,
6
),

(
429,
'Kaligandaki',
'कालीगण्डकी',
45,
1,
7
),

(
430,
'Phedikhola',
'फेदीखोला',
45,
1,
5
),

(
431,
'Biruwa',
'बिरुवा',
45,
1,
8
),

(
432,
'Harinas',
'हरिनास',
45,
1,
7
),

(
433,
'Pokhara',
'पोखरा',
38,
4,
33
),

(
434,
'Annapurna',
'अन्नपूर्ण',
38,
1,
11
),

(
435,
'Machhapuchhre',
'माछापुच्छ्रे',
38,
1,
9
),

(
436,
'Madi',
'मादी',
38,
1,
12
),

(
437,
'Rupa',
'रूपा',
38,
1,
7
),

(
438,
'Chame',
'चामे',
40,
1,
5
),

(
439,
'Narpa Bhumi',
'नार्पा भूमि',
40,
1,
5
),

(
440,
'Nason',
'नासोँ',
40,
1,
9
),

(
441,
'Manang Ngisyang',
'मनाङ ङिस्याङ',
40,
1,
9
),

(
442,
'Gharapjhong',
'घरपझोङ',
41,
1,
5
),

(
443,
'Thasang',
'थासाङ',
41,
1,
5
),

(
444,
'Lo Ghekar Damodarkunda',
'लो घेकर दामोदरकुण्ड',
41,
1,
5
),

(
445,
'Lomanthang',
'लोमन्थाङ',
41,
1,
5
),

(
446,
'Bahragung Muktichhetra',
'वारागुङ मुक्तिक्षेत्र',
41,
1,
5
),

(
447,
'Beni',
'बेनी',
42,
2,
10
),

(
448,
'Annapurna',
'अन्नपुर्ण',
42,
1,
8
),

(
449,
'Dhawalagiri',
'धवलागिरी',
42,
1,
7
),

(
450,
'Mangala',
'मंगला',
42,
1,
5
),

(
451,
'Malika',
'मालिका',
42,
1,
7
),

(
452,
'Raghuganga',
'रघुगंगा',
42,
1,
8
),

(
453,
'Kushma',
'कुश्मा',
44,
2,
14
),

(
454,
'Phalewas',
'फलेवास',
44,
2,
11
),

(
455,
'Jaljala',
'जलजला',
44,
1,
9
),

(
456,
'Paiyun',
'पैयूं',
44,
1,
7
),

(
457,
'Mahashila',
'महाशिला',
44,
1,
6
),

(
458,
'Modi',
'मोदी',
44,
1,
8
),

(
459,
'Bihadi',
'विहादी',
44,
1,
6
),

(
460,
'Baglung',
'बागलुङ',
36,
2,
14
),

(
461,
'Galkot',
'गल्कोट',
36,
2,
11
),

(
462,
'Jaimini',
'जैमूनी',
36,
2,
10
),

(
463,
'Dhorpatan',
'ढोरपाटन',
36,
2,
9
),

(
464,
'Bareng',
'वरेङ',
36,
1,
5
),

(
465,
'Kathekhola',
'काठेखोला',
36,
1,
8
),

(
466,
'Tamankhola',
'तमानखोला',
36,
1,
6
),

(
467,
'Tarakhola',
'ताराखोला',
36,
1,
5
),

(
468,
'Nisikhola',
'निसीखोला',
36,
1,
7
),

(
469,
'Badigad',
'वडिगाड',
36,
1,
10
),

(
470,
'Musikot',
'मुसिकोट',
51,
2,
9
),

(
471,
'Resunga',
'रेसुङ्गा',
51,
2,
14
),

(
472,
'Ishma',
'ईस्मा',
51,
1,
6
),

(
473,
'Kaligandaki',
'कालीगण्डकी',
51,
1,
7
),

(
474,
'Gulmi Darbar',
'गुल्मी दरबार',
51,
1,
7
),

(
475,
'Satyawati',
'सत्यवती',
51,
1,
8
),

(
476,
'Chandrakot',
'चन्द्रकोट',
51,
1,
8
),

(
477,
'Rurukshetra',
'रुरुक्षेत्र',
51,
1,
6
),

(
478,
'Chhatrakot',
'छत्रकोट',
51,
1,
6
),

(
479,
'Dhurkot',
'धुर्कोट',
51,
1,
7
),

(
480,
'Madane',
'मदाने',
51,
1,
7
),

(
481,
'Malika',
'मालिका',
51,
1,
8
),

(
482,
'Rampur',
'रामपुर',
52,
2,
10
),

(
483,
'Tansen',
'तानसेन',
52,
2,
14
),

(
484,
'Nisdi',
'निस्दी',
52,
1,
7
),

(
485,
'Purbakhola',
'पूर्वखोला',
52,
1,
6
),

(
486,
'Rambha',
'रम्भा',
52,
1,
5
),

(
487,
'Mathagadhi',
'माथागढी',
52,
1,
8
),

(
488,
'Tinau',
'तिनाउ',
52,
1,
6
),

(
489,
'Baganaskali',
'बगनासकाली',
52,
1,
9
),

(
490,
'Ribdikot',
'रिब्दिकोट',
52,
1,
8
),

(
491,
'Rainadevi Chhahara',
'रैनादेवी छहरा',
52,
1,
8
),

(
492,
'Butwal',
'बुटवल',
49,
3,
19
),

(
493,
'Devdaha',
'देवदह',
49,
2,
12
),

(
494,
'Lumbini Sanskritik',
'लुम्बिनी सांस्कृतिक',
49,
2,
13
),

(
495,
'Sainamaina',
'सैनामैना',
49,
2,
11
),

(
496,
'Siddharthanagar',
'सिद्धार्थनगर',
49,
2,
13
),

(
497,
'Tilottama',
'तिलोत्तमा',
49,
2,
17
),

(
498,
'Gaidahawa',
'गैडहवा',
49,
1,
9
),

(
499,
'Kanchan',
'कन्चन',
49,
1,
5
),

(
500,
'Kotahimai',
'कोटहीमाई',
49,
1,
7
),

(
501,
'Marchawari',
'मर्चवारी',
49,
1,
7
),

(
502,
'Mayadevi',
'मायादेवी',
49,
1,
8
),

(
503,
'Omsatiya',
'ओमसतिया',
49,
1,
6
),

(
504,
'Rohini',
'रोहिणी',
49,
1,
7
),

(
505,
'Sammarimai',
'सम्मरीमाई',
49,
1,
7
),

(
506,
'Siyari',
'सियारी',
49,
1,
7
),

(
507,
'Shuddhodhan',
'शुद्धोधन',
49,
1,
7
),

(
508,
'Kapilvastu',
'कपिलवस्तु',
47,
2,
12
),

(
509,
'Buddhabhumi',
'बुद्धभुमी',
47,
2,
10
),

(
510,
'Shivraj',
'शिवराज',
47,
2,
11
),

(
511,
'Maharajgunj',
'महाराजगंज',
47,
2,
11
),

(
512,
'Krishnanagar',
'कृष्णनगर',
47,
2,
12
),

(
513,
'Banganga',
'बाणगंगा',
47,
2,
11
),

(
514,
'Mayadevi',
'मायादेवी',
47,
1,
8
),

(
515,
'Yasodhara',
'यसोधरा',
47,
1,
8
),

(
516,
'Shuddhodhan',
'सुद्धोधन',
47,
1,
6
),

(
517,
'Bijaynagar',
'विजयनगर',
47,
1,
7
),

(
518,
'Sandhikharka',
'सन्धिखर्क',
50,
2,
12
),

(
519,
'Shitaganga',
'शितगंगा',
50,
2,
14
),

(
520,
'Bhumikasthan',
'भूमिकास्थान',
50,
2,
10
),

(
521,
'Chhatradev',
'छत्रदेव',
50,
1,
8
),

(
522,
'Panini',
'पाणिनी',
50,
1,
8
),

(
523,
'Malarani',
'मालारानी',
50,
1,
9
),

(
524,
'Pyuthan',
'प्यूठान',
54,
2,
10
),

(
525,
'Swargadwari',
'स्वर्गद्वारी',
54,
2,
9
),

(
526,
'Gaumukhi',
'गौमुखी',
54,
1,
7
),

(
527,
'Mandavi',
'माण्डवी',
54,
1,
5
),

(
528,
'Sarumarani',
'सरुमारानी',
54,
1,
6
),

(
529,
'Mallarani',
'मल्लरानी',
54,
1,
5
),

(
530,
'Naubahini',
'नौवहिनी',
54,
1,
8
),

(
531,
'Jhimruk',
'झिमरुक',
54,
1,
8
),

(
532,
'Airawati',
'ऐरावती',
54,
1,
6
),

(
533,
'Rolpa',
'रोल्पा',
55,
2,
10
),

(
534,
'Triveni',
'त्रिवेणी',
55,
1,
7
),

(
535,
'Duikholi',
'परिवर्तन',
55,
1,
6
),

(
536,
'Madi',
'माडी',
55,
1,
6
),

(
537,
'Runtigadhi',
'रुन्टीगढी',
55,
1,
9
),

(
538,
'Lungri',
'लुङग्री',
55,
1,
7
),

(
539,
'Sukidaha',
'गंगादेव',
55,
1,
7
),

(
540,
'Sunchhahari',
'सुनछहरी',
55,
1,
7
),

(
541,
'Sunil Smriti',
'सुनिल स्मृति',
55,
1,
8
),

(
542,
'Thabang',
'थवाङ',
55,
1,
5
),

(
543,
'Musikot',
'मुसिकोट',
59,
2,
14
),

(
544,
'Chaurjahari',
'चौरजहारी',
59,
2,
14
),

(
545,
'Aathbiskot',
'आठबिसकोट',
59,
2,
14
),

(
546,
'Putha Uttarganga',
'पुथा उत्तरगंगा',
56,
1,
14
),

(
547,
'Bhume',
'भूमे',
56,
1,
9
),

(
548,
'Sisne',
'सिस्ने',
56,
1,
8
),

(
549,
'Banphikot',
'बाँफिकोट',
59,
1,
10
),

(
550,
'Triveni',
'त्रिवेणी',
59,
1,
10
),

(
551,
'Sani Bheri',
'सानी भेरी',
59,
1,
11
),

(
552,
'Shaarada',
'शारदा',
60,
2,
15
),

(
553,
'Bagchaur',
'बागचौर',
60,
2,
12
),

(
554,
'Bangad Kupinde',
'बनगाड कुपिण्डे',
60,
2,
12
),

(
555,
'Kalimati',
'कालिमाटी',
60,
1,
7
),

(
556,
'Triveni',
'त्रिवेणी',
60,
1,
6
),

(
557,
'Kapurkot',
'कपुरकोट',
60,
1,
6
),

(
558,
'Chhatreshwori',
'छत्रेश्वरी',
60,
1,
7
),

(
559,
'Siddha Kumakh',
'सिद्ध कुमाख',
60,
1,
5
),

(
560,
'Kumakh',
'कुमाख',
60,
1,
7
),

(
561,
'Darma',
'दार्मा',
60,
1,
6
),

(
562,
'Tulsipur',
'तुल्सीपुर',
53,
3,
19
),

(
563,
'Ghorahi',
'घोराही',
53,
3,
19
),

(
564,
'Lamahi',
'लमही',
53,
2,
9
),

(
565,
'Bangalachuli',
'बंगलाचुली',
53,
1,
8
),

(
566,
'Dangisharan',
'दंगीशरण',
53,
1,
7
),

(
567,
'Gadhawa',
'गढवा',
53,
1,
8
),

(
568,
'Rajpur',
'राजपुर',
53,
1,
7
),

(
569,
'Rapti',
'राप्ती',
53,
1,
9
),

(
570,
'Shantinagar',
'शान्तिनगर',
53,
1,
7
),

(
571,
'Babai',
'बबई',
53,
1,
7
),

(
572,
'Nepalgunj',
'नेपालगंज',
57,
3,
23
),

(
573,
'Kohalpur',
'कोहलपुर',
57,
2,
15
),

(
574,
'Narainapur',
'नरैनापुर',
57,
1,
6
),

(
575,
'Rapti Sonari',
'राप्ती सोनारी',
57,
1,
9
),

(
576,
'Baijanath',
'बैजनाथ',
57,
1,
8
),

(
577,
'Khajura',
'खजुरा',
57,
1,
8
),

(
578,
'Duduwa',
'डुडुवा',
57,
1,
6
),

(
579,
'Janaki',
'जानकी',
57,
1,
6
),

(
580,
'Gulariya',
'गुलरिया',
58,
2,
12
),

(
581,
'Madhuwan',
'मधुवन',
58,
2,
9
),

(
582,
'Rajapur',
'राजापुर',
58,
2,
10
),

(
583,
'Thakurbaba',
'ठाकुरबाबा',
58,
2,
9
),

(
584,
'Bansgadhi',
'बाँसगढी',
58,
2,
9
),

(
585,
'Barbardiya',
'बारबर्दिया',
58,
2,
11
),

(
586,
'Badhaiyatal',
'बढैयाताल',
58,
1,
9
),

(
587,
'Geruwa',
'गेरुवा',
58,
1,
6
),

(
588,
'Birendranagar',
'बीरेन्द्रनगर',
66,
2,
16
),

(
589,
'Bheriganga',
'भेरीगंगा',
66,
2,
13
),

(
590,
'Gurbhakot',
'गुर्भाकोट',
66,
2,
14
),

(
591,
'Panchapuri',
'पञ्चपुरी',
66,
2,
11
),

(
592,
'Lekbeshi',
'लेकवेशी',
66,
2,
10
),

(
593,
'Chaukune',
'चौकुने',
66,
1,
10
),

(
594,
'Barahatal',
'बराहताल',
66,
1,
10
),

(
595,
'Chingad',
'चिङ्गाड',
66,
1,
6
),

(
596,
'Simta',
'सिम्ता',
66,
1,
9
),

(
597,
'Narayan',
'नारायण',
67,
2,
11
),

(
598,
'Dullu',
'दुल्लु',
67,
2,
13
),

(
599,
'Chamunda Bindrasaini',
'चामुण्डा विन्द्रासैनी',
67,
2,
9
),

(
600,
'Aathabis',
'आठबीस',
67,
2,
9
),

(
601,
'Bhagawatimai',
'भगवतीमाई',
67,
1,
7
),

(
602,
'Gurans',
'गुराँस',
67,
1,
8
),

(
603,
'Dungeshwor',
'डुंगेश्वर',
67,
1,
6
),

(
604,
'Naumule',
'नौमुले',
67,
1,
8
),

(
605,
'Mahabu',
'महावु',
67,
1,
6
),

(
606,
'Bhairabi',
'भैरवी',
67,
1,
7
),

(
607,
'Thantikandh',
'ठाँटीकाँध',
67,
1,
6
),

(
608,
'Bheri',
'भेरी',
68,
2,
13
),

(
609,
'Chhedagad',
'छेडागाड',
68,
2,
13
),

(
610,
'Nalgaad',
'नलगाड',
68,
2,
13
),

(
611,
'Barekot',
'बारेकोट',
68,
1,
9
),

(
612,
'Kushe',
'कुसे',
68,
1,
9
),

(
613,
'Junichaande',
'जुनीचाँदे',
68,
1,
11
),

(
614,
'Shibalaya',
'शिवालय',
68,
1,
9
),

(
615,
'Thuli Bheri',
'ठूली भेरी',
61,
2,
11
),

(
616,
'Tripurasundari',
'त्रिपुरासुन्दरी',
61,
2,
11
),

(
617,
'Dolpo Buddha',
'डोल्पो बुद्ध',
61,
1,
6
),

(
618,
'She Phoksundo',
'शे फोक्सुन्डो',
61,
1,
9
),

(
619,
'Jagdulla',
'जगदुल्ला',
61,
1,
6
),

(
620,
'Mudkechula',
'मुड्केचुला',
61,
1,
9
),

(
621,
'Kaike',
'काईके',
61,
1,
7
),

(
622,
'Chharka Tangsong',
'छार्का ताङसोङ',
61,
1,
6
),

(
623,
'Chandannath',
'चन्दननाथ',
63,
2,
10
),

(
624,
'Kankasundari',
'कनकासुन्दरी',
63,
1,
8
),

(
625,
'Sinja',
'सिंजा',
63,
1,
6
),

(
626,
'Hima',
'हिमा',
63,
1,
7
),

(
627,
'Tila',
'तिला',
63,
1,
9
),

(
628,
'Guthichaur',
'गुठिचौर',
63,
1,
5
),

(
629,
'Tatopani',
'तातोपानी',
63,
1,
8
),

(
630,
'Patarasi',
'पातारासी',
63,
1,
7
),

(
631,
'Khandachakra',
'खाँडाचक्र',
64,
2,
11
),

(
632,
'Raskot',
'रास्कोट',
64,
2,
9
),

(
633,
'Tilagufa',
'तिलागुफा',
64,
2,
11
),

(
634,
'Pachaljharana',
'पचालझरना',
64,
1,
9
),

(
635,
'Sanni Triveni',
'सान्नी त्रिवेणी',
64,
1,
9
),

(
636,
'Narharinath',
'नरहरिनाथ',
64,
1,
9
),

(
637,
'Shuva Kalika',
'शुभ कालीका',
64,
1,
8
),

(
638,
'Mahawai',
'महावै',
64,
1,
7
),

(
639,
'Palata',
'पलाता',
64,
1,
9
),

(
640,
'Chhayanath Rara',
'छायाँनाथ रारा',
65,
2,
14
),

(
641,
'Mugum Karmarong',
'मुगुम कार्मारोंग',
65,
1,
9
),

(
642,
'Soru',
'सोरु',
65,
1,
11
),

(
643,
'Khatyad',
'खत्याड',
65,
1,
11
),

(
644,
'Simkot',
'सिमकोट',
62,
1,
8
),

(
645,
'Namkha',
'नाम्खा',
62,
1,
6
),

(
646,
'Kharpunath',
'खार्पुनाथ',
62,
1,
5
),

(
647,
'Sarkegad',
'सर्केगाड',
62,
1,
8
),

(
648,
'Chankheli',
'चंखेली',
62,
1,
6
),

(
649,
'Adanchuli',
'अदानचुली',
62,
1,
6
),

(
650,
'Tajakot',
'ताँजाकोट',
62,
1,
5
),

(
651,
'Badimalika',
'बडीमालिका',
73,
2,
9
),

(
652,
'Triveni',
'त्रिवेणी',
73,
2,
9
),

(
653,
'Budhiganga',
'बुढीगंगा',
73,
2,
10
),

(
654,
'Budhinanda',
'बुढीनन्दा',
73,
2,
10
),

(
655,
'Gaumul',
'गौमुल',
73,
1,
6
),

(
656,
'Jagganath',
'जगन्‍नाथ',
73,
1,
6
),

(
657,
'Swamikartik Khaapar',
'स्वामीकार्तिक खापर',
73,
1,
5
),

(
658,
'Khaptad Chhededaha',
'खप्तड छेडेदह',
73,
1,
7
),

(
659,
'Himali',
'हिमाली',
73,
1,
7
),

(
660,
'Jayaprithvi',
'जयपृथ्वी',
72,
2,
11
),

(
661,
'Bungal',
'बुंगल',
72,
2,
11
),

(
662,
'Talkot',
'तलकोट',
72,
1,
7
),

(
663,
'Masta',
'मष्टा',
72,
1,
7
),

(
664,
'Khaptadchhanna',
'खप्तडछान्ना',
72,
1,
7
),

(
665,
'Thalara',
'थलारा',
72,
1,
9
),

(
666,
'Bitthadchir',
'वित्थडचिर',
72,
1,
9
),

(
667,
'Surma',
'सूर्मा',
72,
1,
5
),

(
668,
'Chhabispathivera',
'छबिसपाथिभेरा',
72,
1,
7
),

(
669,
'Durgathali',
'दुर्गाथली',
72,
1,
7
),

(
670,
'Kedarasyu',
'केदारस्युँ',
72,
1,
9
),

(
671,
'Saipal',
'साइपाल',
72,
1,
5
),

(
672,
'Mangalsen',
'मंगलसेन',
70,
2,
14
),

(
673,
'Kamalbazar',
'कमलबजार',
70,
2,
10
),

(
674,
'Sanfebagar',
'साँफेबगर',
70,
2,
14
),

(
675,
'Panchadewal Binayak',
'पन्चदेवल विनायक',
70,
2,
9
),

(
676,
'Chaurpati',
'चौरपाटी',
70,
1,
7
),

(
677,
'Mellekh',
'मेल्लेख',
70,
1,
8
),

(
678,
'Bannigadhi Jaygadh',
'बान्निगढी जयगढ',
70,
1,
6
),

(
679,
'Ramaroshan',
'रामारोशन',
70,
1,
7
),

(
680,
'Dhakari',
'ढकारी',
70,
1,
8
),

(
681,
'Turmakhad',
'तुर्माखाँद',
70,
1,
8
),

(
682,
'Dipayal Silgadhi',
'दिपायल सिलगढी',
71,
2,
9
),

(
683,
'Shikhar',
'शिखर',
71,
2,
11
),

(
684,
'Purbichauki',
'पूर्वीचौकी',
71,
1,
7
),

(
685,
'Badikedar',
'बडीकेदार',
71,
1,
5
),

(
686,
'Jorayal',
'जोरायल',
71,
1,
6
),

(
687,
'Sayal',
'सायल',
71,
1,
6
),

(
688,
'Aadarsha',
'आदर्श',
71,
1,
7
),

(
689,
'K I Singh',
'के आई सिं',
71,
1,
7
),

(
690,
'Bogatan Fudsil',
'बोगटान फुड्सिल',
71,
1,
7
),

(
691,
'Dhangadhi',
'धनगढी',
69,
3,
19
),

(
692,
'Tikapur',
'टिकापुर',
69,
2,
9
),

(
693,
'Ghodaghodi',
'घोडाघोडी',
69,
2,
12
),

(
694,
'Lamkichuha',
'लम्कीचुहा',
69,
2,
10
),

(
695,
'Bhajani',
'भजनी',
69,
2,
9
),

(
696,
'Godawari',
'गोदावरी',
69,
2,
12
),

(
697,
'Gauriganga',
'गौरीगंगा',
69,
2,
11
),

(
698,
'Janaki',
'जानकी',
69,
1,
9
),

(
699,
'Bardgoriya',
'बर्दगोरिया',
69,
1,
6
),

(
700,
'Mohanyal',
'मोहन्याल',
69,
1,
7
),

(
701,
'Kailari',
'कैलारी',
69,
1,
9
),

(
702,
'Joshipur',
'जोशीपुर',
69,
1,
7
),

(
703,
'Chure',
'चुरे',
69,
1,
6
),

(
704,
'Bheemdatta',
'भीमदत्त',
74,
2,
19
),

(
705,
'Punarbas',
'पुर्नवास',
74,
2,
11
),

(
706,
'Bedkot',
'वेदकोट',
74,
2,
10
),

(
707,
'Mahakali',
'महाकाली',
74,
2,
9
),

(
708,
'Shuklaphanta',
'शुक्लाफाँटा',
74,
2,
12
),

(
709,
'Belauri',
'बेलौरी',
74,
2,
11
),

(
710,
'Krishnapur',
'कृष्णपुर',
74,
2,
9
),

(
711,
'Beldandi',
'बेलडाडी',
74,
1,
5
),

(
712,
'Laljhadi',
'लालझाडी',
74,
1,
6
),

(
713,
'Amargadhi',
'अमरगढी',
75,
2,
11
),

(
714,
'Parshuram',
'परशुराम',
75,
2,
12
),

(
715,
'Aalital',
'आलिताल',
75,
1,
8
),

(
716,
'Bhageshwor',
'भागेश्वर',
75,
1,
5
),

(
717,
'Navadurga',
'नवदुर्गा',
75,
1,
5
),

(
718,
'Ajayameru',
'अजयमेरु',
75,
1,
6
),

(
719,
'Ganyapadhura',
'गन्यापधुरा',
75,
1,
5
),

(
720,
'Dasharathchand',
'दशरथचन्द',
76,
2,
11
),

(
721,
'Patan',
'पाटन',
76,
2,
10
),

(
722,
'Melauli',
'मेलौली',
76,
2,
9
),

(
723,
'Purchaudi',
'पुर्चौडी',
76,
2,
10
),

(
724,
'Sunarya',
'सुर्नया',
76,
1,
8
),

(
725,
'Sigas',
'सिगास',
76,
1,
9
),

(
726,
'Shivanath',
'शिवनाथ',
76,
1,
6
),

(
727,
'Pancheshwor',
'पञ्चेश्वर',
76,
1,
6
),

(
728,
'Dogdakedar',
'दोगडाकेदार',
76,
1,
8
),

(
729,
'Dilasaini',
'डीलासैनी',
76,
1,
7
),

(
730,
'Mahakali',
'महाकाली',
77,
2,
9
),

(
731,
'Shailyashikhar',
'शैल्यशिखर',
77,
2,
9
),

(
732,
'Malikarjun',
'मालिकार्जुन',
77,
1,
8
),

(
733,
'Apihimal',
'अपिहिमाल',
77,
1,
6
),

(
734,
'Duhun',
'दुहुँ',
77,
1,
5
),

(
735,
'Naugad',
'नौगाड',
77,
1,
6
),

(
736,
'Marma',
'मार्मा',
77,
1,
6
),

(
737,
'Lekam',
'लेकम',
77,
1,
6
),

(
738,
'Vyans',
'ब्याँस',
77,
1,
6
),

(
739,
'Kawasoti',
'कावासोती',
43,
2,
17
),

(
740,
'Gaindakot',
'गैडाकोट',
43,
2,
18
),

(
741,
'Devchuli',
'देवचुली',
43,
2,
17
),

(
742,
'Madhyabindu',
'मध्यविन्दु',
43,
2,
15
),

(
743,
'Bungdikali',
'बौदीकाली',
43,
1,
6
),

(
744,
'Bulingtar',
'बुलिङटार',
43,
1,
6
),

(
745,
'Binayi Tribeni',
'विनयी त्रिवेणी',
43,
1,
7
),

(
746,
'Hupsekot',
'हुप्सेकोट',
43,
1,
6
),

(
747,
'Bardghat',
'बर्दघाट',
48,
2,
16
),

(
748,
'Ramgram',
'रामग्राम',
48,
2,
18
),

(
749,
'Sunwal',
'सुनवल',
48,
2,
13
),

(
750,
'Susta',
'सुस्ता',
48,
1,
5
),

(
751,
'Palhinandan',
'पाल्हीनन्दन',
48,
1,
6
),

(
752,
'Pratappur',
'प्रतापपुर',
48,
1,
9
),

(
753,
'Sarawal',
'सरावल',
48,
1,
7
);


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



INSERT INTO label_info (label_name, status) VALUES ("PATIENT_ADMISSION_DEPOSIT", 1);

INSERT INTO accounting_ledger_mapping (id,label, ledger_id) VALUES (1,'Purchase Ledger', 0);
INSERT INTO accounting_ledger_mapping (id,label, ledger_id) VALUES (2,'Stock Ledger', 0);
INSERT INTO accounting_ledger_mapping (id,label, ledger_id) VALUES (3,'Opening Stock',0);
INSERT INTO accounting_ledger_mapping (id,label, ledger_id) VALUES (4,'Cash In Hand', 0);
INSERT INTO accounting_ledger_mapping (id,label, ledger_id) VALUES (5,'Bad Debt', 0);
INSERT INTO accounting_ledger_mapping (id,label, ledger_id) VALUES (6,'Bad Debt Reserve', 0);
INSERT INTO accounting_ledger_mapping (id,label, ledger_id) VALUES (7,'Provision For Discount', 0);
INSERT INTO accounting_ledger_mapping (id,label, ledger_id) VALUES (8,'Discount', 0);
INSERT INTO accounting_ledger_mapping (id,label, ledger_id) VALUES (9,'Short Term Bank Loan', 0);
INSERT INTO accounting_ledger_mapping (id,label, ledger_id) VALUES (10,'Wages', 0);
INSERT INTO accounting_ledger_mapping (id,label, ledger_id) VALUES (11,'Liabilities', 0);           
INSERT INTO accounting_ledger_mapping (id,label, ledger_id) VALUES (12,'Dividend Paid', 0);         
INSERT INTO accounting_ledger_mapping (id,label, ledger_id) VALUES (13,'Interest Received', 0);
INSERT INTO accounting_ledger_mapping (id,label, ledger_id) VALUES (14,'Dividend Received', 0);
INSERT INTO accounting_ledger_mapping (id,label, ledger_id) VALUES (15,'Retained Earning', 0);
INSERT INTO accounting_ledger_mapping (id,label, ledger_id) VALUES (16,'Milk Purchase Transportation A/C', 0);
INSERT INTO accounting_ledger_mapping (id,label, ledger_id) VALUES (17,'Milk Purchase Stock A/C', 0);
INSERT INTO accounting_ledger_mapping (id,label, ledger_id) VALUES (18,'Sales Ledger', 0);
INSERT INTO accounting_ledger_mapping (id,label, ledger_id) VALUES (19,'Sales Commission A/C',0);
INSERT INTO accounting_ledger_mapping (id,label, ledger_id) VALUES (20,'Damage Goods A/C',0);
INSERT INTO accounting_ledger_mapping (id, label , ledger_id) VALUES (21,'Vat Payable' , 0);

INSERT INTO index_info (functional_year_id,title,index_code,max_id) VALUES (1,'purchase','PUI',0);

INSERT INTO index_info (functional_year_id, title, index_code, max_id) VALUES (1, 'purchase_return', 'PRI', 0);

INSERT INTO index_info (functional_year_id, title, index_code, max_id, status) VALUES (1, 'sales', 'SAI', 0, 1);

INSERT INTO index_info (functional_year_id, title, index_code, max_id, status)
VALUES (1, 'sales return', 'SRI', 0,1);

INSERT INTO index_info (functional_year_id, title, index_code, max_id)
			VALUES(1,'sales_bill_number', 'SBN', 0);

INSERT INTO version_info (version,description) 
VALUES ('1.0.1','added feature for free registration of patient');

INSERT INTO version_info (version,description) 
VALUES (
    '1.0.2',
    ' added sticker reprint option in patient registration,
      added queue no in patient registration,
      added fromData and toDate in patient pagination
    '
);

INSERT INTO version_info (version,description) 
VALUES (
    '1.1.0',
    ' Added summary report,
      Added confirmation message in all the available modules
    '
);

INSERT INTO version_info (version,description) 
VALUES (
    '1.2.0',
    'Added Transaction report,
      Added default province and district feature
    '
);

INSERT INTO version_info (version,description) 
VALUES (
    '1.2.1',
    ' fixed date issue in print api,
      added from date and to date in summary report,
      added qty in opd billing,
      added edit option in billing title
    '
);


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

INSERT INTO version_info (version,description) 
VALUES (
    '2.0.0',
    ' added pharmacy module,
      added service summary report,
      minor ui changes,
      added IPD module,
    '
);

INSERT INTO version_info (version,description) 
VALUES (
    '2.1.0',
    ' added ledger mapping, opening stock , party master, purchase entry module '
);

INSERT INTO version_info (version,description) 
VALUES (
    '2.1.1',
    'change branch_id datatype to int default 0 and removed foreign key constraint'
);

INSERT INTO version_info (version,description) 
VALUES (
    '2.2.0',
    'purchase return by purchase voucher voucher number'
);

INSERT INTO version_info (version,description) 
VALUES (
    '2.2.1',
    'add taxable_discount_amount and non_taxable_discount_amount in purchase_return_info'
);

INSERT INTO version_info (version,description) 
VALUES (
    '2.2.2',
    'add taxable_discount_amount and non_taxable_discount_amount in pharmacy_purchase_info'
);

INSERT INTO version_info (version,description) 
VALUES (
    '2.2.3',
    'added mrp in pharmacy_stock_info'
);

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

UPDATE province SET isDefault=1 WHERE id=5;
UPDATE district SET isDefault=1 WHERE id=49;