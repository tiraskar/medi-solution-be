START TRANSACTION;

ALTER TABLE patient_admission_info ADD COLUMN is_discharged TINYINT DEFAULT 0;
ALTER TABLE patient_admission_info ADD COLUMN discharge_date_ad DATE;
ALTER TABLE patient_admission_info ADD COLUMN discharge_date_bs VARCHAR(45);


CREATE TABLE user_branch_info(
   id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
   user_id INT NOT NULL,
   branch_id INT NOT NULL,
   status TINYINT NOT NULL DEFAULT 1,
   created_by INT DEFAULT NULL,
   created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
   updated_at TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
);

ALTER TABLE user_branch_info ADD CONSTRAINT fk_user_branch_info_user_id FOREIGN KEY (user_id) REFERENCES user(user_id);
ALTER TABLE user_branch_info ADD CONSTRAINT fk_user_branch_info_branch_id FOREIGN KEY (branch_id) REFERENCES branch_info(branch_id);
ALTER TABLE user_branch_info ADD CONSTRAINT fk_user_branch_info_created_by FOREIGN KEY (created_by) REFERENCES user(user_id);

CREATE TABLE pharmacy_unit_info (
    unit_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    unit_name VARCHAR(255) NOT NULL,
    unit_symbol VARCHAR(55) NOT NULL,
    status TINYINT NOT NULL DEFAULT 1,
	created_by INT NOT NULL,
    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE pharmacy_category_info (
    category_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    category_code INT NOT NULL,
    category_name VARCHAR(200) NOT NULL,
    status TINYINT NOT NULL DEFAULT 1,
	created_by INT NOT NULL,
    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE pharmacy_brand_info (
    brand_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    brand_code INT NOT NULL,
    brand_name VARCHAR(255) NOT NULL,
    company_name VARCHAR(255) NOT NULL,
    status TINYINT NOT NULL DEFAULT 1,
	created_by INT NOT NULL,
    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE pharmacy_product_generic_name_info (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    generic_name VARCHAR(255) NOT NULL,
	status TINYINT NOT NULL DEFAULT 1,
	created_by INT NOT NULL,
    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE pharmacy_product_basic_info (
    product_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	product_code INT NOT NULL,
    product_name VARCHAR(255) NOT NULL,
    category_id INT DEFAULT NULL,
    is_free BOOLEAN NOT NULL,
    is_taxable BOOLEAN NOT NULL,
    tax_rate DOUBLE(50 , 2 ) NOT NULL,
    sales_margin DOUBLE(50,2) NOT NULL,
    brand_id INT DEFAULT NULL,
	base_unit_id INT NOT NULL,
    minimum_stock_qty INT NOT NULL,
    status TINYINT NOT NULL DEFAULT 1,
	created_by INT NOT NULL,
	functional_year_id INT NOT NULL,
    branch_id INT NOT NULL,
    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
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


INSERT INTO version_info (version,description) 
VALUES (
    '2.0.0',
    ' added pharmacy module,
      added service summary report,
      minor ui changes,
      added IPD module,
    '
);


COMMIT;