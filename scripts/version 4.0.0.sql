CREATE TABLE free_pharmacy_lab_test_info (
  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  ip INT NOT NULL,
  mul_darta_no VARCHAR(45) NOT NULL,
  date_ad DATE NOT NULL,
  date_bs DATE NOT NULL,
  ipd_no INT NULL,
  lab_test_id INT NOT NULL,
  lab_test_result VARCHAR(55) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  remarks TEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL,
  created_by INT NOT NULL,
  created_at DATETIME NOT NULL,
  status TINYINT(2) NOT NULL DEFAULT 1,
  functional_year_id INT NOT NULL,
  bill_no VARCHAR(50) NULL);

  ALTER TABLE patient_admission_info ADD COLUMN isFree tinyint(1) NOT NULL DEFAULT '0';

  ALTER TABLE billing_info ADD COLUMN isFree tinyint(1) NOT NULL DEFAULT '0';
 


CREATE TABLE free_pharmacy_medicine_info (
  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  ip INT NOT NULL,
  mul_darta_no VARCHAR(45) NOT NULL,
  date_ad DATE NOT NULL,
  date_bs VARCHAR(45) NOT NULL,
  ipd_no INT NULL,
  product_id INT NOT NULL,
  base_unit_id  INT NOT NULL,
  qty DECIMAL(50,2) NOT NULL,
  batch_id INT NOT NULL,
  party_id INT NOT NULL,
  expiry_date_ad_month VARCHAR(45) NOT NULL,
  expiry_date_ad_year VARCHAR(45) NOT NULL,
  remarks TEXT NULL,
  created_by INT NOT NULL,
  created_at  DATETIME NOT NULL,
  status INT NOT NULL,
  functional_year_id INT NOT NULL,
  group_id varchar(255) NOT NULL
);


CREATE TABLE physiotherapy_group_info (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    physiotherapy_group_code INT NOT NULL,
    physiotherapy_group_name TEXT NOT NULL,
    status TINYINT NOT NULL DEFAULT 1,
    remarks TEXT DEFAULT NULL,
    created_by INT NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL
);

ALTER TABLE disease_info MODIFY disease_code FLOAT NOT NULL;


ALTER TABLE disease_group_info MODIFY disease_group_code FLOAT NOT NULL;

INSERT INTO version_info (version,description) 
VALUES ('4.0.0','added free pharmacy lab , medicine , patient_admission_info , patient_admission_info, disease_info and disease_group_info ');