CREATE TABLE patient_ip_info ( 
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
patient_id  INT NOT NULL,
muldharta_no VARCHAR(255) NOT NULL,
functional_year_id INT NOT NULL,
status TINYINT NOT NULL DEFAULT 1
);

ALTER TABLE patient_ip_info ADD CONSTRAINT fk_patient_ip_info_functional_year FOREIGN KEY (functional_year_id) REFERENCES functional_year(functional_year_id);
ALTER TABLE patient_ip_info ADD CONSTRAINT fk_patient_ip_info_patient_info FOREIGN KEY (patient_id) REFERENCES patient_info(patient_id);

INSERT INTO index_info (functional_year_id,title,index_code,max_id) values (3,'muldarta_number','MDN',0);

INSERT INTO version_info (version,description) 
VALUES ('3.2.1','added feature for muldharta');


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

ALTER TABLE pdc_info ADD COLUMN remarks TEXT DEFAULT NULL;

ALTER TABLE pdc_deposit_info ADD CONSTRAINT fk_pdc_deposit_info_pdc_id FOREIGN KEY (pdc_id) REFERENCES pdc_info(id);
ALTER TABLE pdc_deposit_info ADD CONSTRAINT fk_pdc_deposit_info_deposited_by FOREIGN KEY (created_by) REFERENCES user(user_id);


ALTER TABLE pdc_cheque_return_info ADD CONSTRAINT fk_pdc_cheque_return_info_pdc_id FOREIGN KEY (pdc_id) REFERENCES pdc_info(id);
ALTER TABLE pdc_cheque_return_info ADD CONSTRAINT fk_pdc_cheque_return_info_deposited_by FOREIGN KEY (created_by) REFERENCES user(user_id);


ALTER TABLE pdc_bounce_info ADD CONSTRAINT fk_pdc_bounce_info_pdc_id FOREIGN KEY (pdc_id) REFERENCES pdc_info(id);
ALTER TABLE pdc_bounce_info ADD CONSTRAINT fk_pdc_bounce_info_pdc_deposit_id FOREIGN KEY (pdc_deposit_id) REFERENCES pdc_deposit_info(id);
ALTER TABLE pdc_bounce_info ADD CONSTRAINT fk_pdc_bounce_info_deposited_by FOREIGN KEY (created_by) REFERENCES user(user_id);


INSERT INTO version_info (version,description) 
VALUES ('3.3.0','added feature for pdc management');

