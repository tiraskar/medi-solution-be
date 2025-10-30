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
    updated_at TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
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
    updated_at TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
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
  stock_date_ad date NOT NULL,
  stock_date_bs varchar(25) DEFAULT NULL,
  table_id int DEFAULT NULL,
  transaction_id int DEFAULT NULL,
  functional_year_id INT NOT NULL,
  branch_id INT NOT NULL,
  status TINYINT NOT NULL DEFAULT 1,
  created_by INT DEFAULT NULL,
  created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
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
    transaction_id INT DEFAULT NULL,
    functional_year_id INT NOT NULL,
    branch_id INT NOT NULL,
    status TINYINT NOT NULL DEFAULT 1,
    created_by INT DEFAULT NULL,
    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
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
    updated_at TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
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
    transaction_id INT NOT NULL,
    functional_year_id INT NOT NULL,
    branch_id INT NOT NULL,
    status TINYINT NOT NULL DEFAULT 1,
    created_by INT DEFAULT NULL,
    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
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
    updated_at TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
);


ALTER TABLE pharmacy_product_basic_info DROP COLUMN sales_margin;

ALTER TABLE pharmacy_product_basic_info ADD COLUMN mrp DOUBLE(50,2) DEFAULT 0;
ALTER TABLE pharmacy_product_basic_info ADD COLUMN mrpAmountType VARCHAR(55) DEFAULT NULL;
ALTER TABLE pharmacy_product_basic_info ADD COLUMN discountPercentInMrp DOUBLE(50,2) DEFAULT 0;


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


ALTER TABLE pharmacy_product_basic_info MODIFY COLUMN updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;
ALTER TABLE pharmacy_brand_info MODIFY COLUMN updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;
ALTER TABLE pharmacy_category_info MODIFY COLUMN updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;
ALTER TABLE pharmacy_opening_stock_info MODIFY COLUMN updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;
ALTER TABLE pharmacy_product_batch_info MODIFY COLUMN updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;
ALTER TABLE pharmacy_product_generic_name_info MODIFY COLUMN updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;
ALTER TABLE pharmacy_product_unit_conversion_info MODIFY COLUMN updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;
ALTER TABLE pharmacy_purchase_info MODIFY COLUMN updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;
ALTER TABLE pharmacy_purchase_info_detail MODIFY COLUMN updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;
ALTER TABLE pharmacy_purchase_payment_mode_info MODIFY COLUMN updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;
ALTER TABLE pharmacy_stock_info MODIFY COLUMN updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;
ALTER TABLE pharmacy_unit_info MODIFY COLUMN updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;


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



INSERT INTO index_info (functional_year_id,title,index_code,max_id) VALUES (1,'purchase','PUI',0);

INSERT INTO index_info (functional_year_id, title, index_code, max_id) VALUES (1, 'purchase_return', 'PRI', 0);


ALTER TABLE pharmacy_stock_info ADD ledger_id INT NOT NULL;
ALTER TABLE pharmacy_opening_stock_info ADD ledger_id INT NOT NULL;


ALTER TABLE pharmacy_purchase_info_detail ADD is_taxable TINYINT NOT NULL;


ALTER TABLE pharmacy_purchase_info ADD total_non_taxable_amount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00';

INSERT INTO version_info (version,description) 
VALUES (
    '2.1.0',
    ' added ledger mapping, opening stock , party master, purchase entry module '
);
