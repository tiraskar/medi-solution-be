CREATE TABLE pdc_deposit_info (
  id INT NOT NULL PRIMARY KEY  AUTO_INCREMENT,
  pdc_id INT NOT NULL,
  deposit_date_ad DATE NOT NULL,
  deposit_date_bs VARCHAR(45) NOT NULL,
  bank_ledger_id INT NOT NULL,
  deposited_by TEXT CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  status TINYINT(1) NOT NULL DEFAULT 1,
  created_by INT NOT NULL,
  saved_in DATETIME NOT NULL,
  functional_year_id INT NOT NULL,
  cheque_status VARCHAR(45) NOT NULL,
  created_at DATETIME NOT NULL,
  updated_at DATETIME NOT NULL
  
);

CREATE TABLE pdc_cheque_return_info (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  pdc_id INT NOT NULL,
  return_date_ad DATE NOT NULL,
  return_date_bs VARCHAR(45) NOT NULL,
  return_reason TEXT CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  status TINYINT(1) NOT NULL DEFAULT 1,
  created_by INT NOT NULL,
  saved_in DATE NOT NULL,
  functional_year_id VARCHAR(45) NOT NULL,
  cheque_status VARCHAR(45) NOT NULL
);

CREATE TABLE pdc_bounce_info (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  pdc_id INT NOT NULL,
  bounce_date_ad DATE NOT NULL,
  bounce_date_bs VARCHAR(45) NOT NULL,
  status TINYINT(1) NOT NULL DEFAULT 1,
  saved_in VARCHAR(45) NOT NULL,
  functional_year_id INT NOT NULL,
  cheque_status VARCHAR(45) NOT NULL,
  created_by INT NOT NULL,
  created_at DATETIME NOT NULL,
  updated_at DATETIME NOT NULL,
  pdc_deposit_id INT DEFAULT NULL
  
);

ALTER TABLE pdc_info ADD CONSTRAINT fk_pdc_info_created_by FOREIGN KEY (created_by) REFERENCES user(user_id);
ALTER TABLE pdc_info ADD CONSTRAINT fk_pdc_info_party_ledger_id FOREIGN KEY (party_ledger_id) REFERENCES party_info(party_id);

ALTER TABLE pdc_info ADD COLUMN remarks TEXT DEFAULT NULL;


ALTER TABLE pharmacy_opening_stock_info ADD COLUMN mrp DECIMAL(19,2) DEFAULT 0.00;

ALTER TABLE pdc_deposit_info ADD CONSTRAINT fk_pdc_deposit_info_pdc_id FOREIGN KEY (pdc_id) REFERENCES pdc_info(id);
ALTER TABLE pdc_deposit_info ADD CONSTRAINT fk_pdc_deposit_info_deposited_by FOREIGN KEY (created_by) REFERENCES user(user_id);


ALTER TABLE pdc_cheque_return_info ADD CONSTRAINT fk_pdc_cheque_return_info_pdc_id FOREIGN KEY (pdc_id) REFERENCES pdc_info(id);
ALTER TABLE pdc_cheque_return_info ADD CONSTRAINT fk_pdc_cheque_return_info_deposited_by FOREIGN KEY (created_by) REFERENCES user(user_id);


ALTER TABLE pdc_bounce_info ADD CONSTRAINT fk_pdc_bounce_info_pdc_id FOREIGN KEY (pdc_id) REFERENCES pdc_info(id);
ALTER TABLE pdc_bounce_info ADD CONSTRAINT fk_pdc_bounce_info_pdc_deposit_id FOREIGN KEY (pdc_deposit_id) REFERENCES pdc_deposit_info(id);
ALTER TABLE pdc_bounce_info ADD CONSTRAINT fk_pdc_bounce_info_deposited_by FOREIGN KEY (created_by) REFERENCES user(user_id);