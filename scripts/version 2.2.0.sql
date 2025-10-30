CREATE TABLE pharmacy_purchase_return_info (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    grand_total_amount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
    ledger_id INT NOT NULL,
    purchase_bill_no VARCHAR(45) NOT NULL,
    purchase_id INT NOT NULL,
    purchase_return_date_ad DATE NOT NULL,
    purchase_return_date_bs VARCHAR(50) NOT NULL,
    purchase_return_no VARCHAR(45) NOT NULL,
    remarks TEXT,
    total_damage_amount DECIMAL(65 , 2 ) DEFAULT '0.00',
    total_return_amount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
    total_taxable_amount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
    transaction_id INT NOT NULL,
    vat_amount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
    discount_amount DECIMAL(19 , 2 ) DEFAULT NULL,
    non_taxable_amount DECIMAL(19 , 2 ) DEFAULT NULL,
    vat_rate DECIMAL(19 , 2 ) DEFAULT NULL,
    functional_year_id INT NOT NULL,
    branch_id INT NOT NULL,
    status TINYINT NOT NULL DEFAULT 1,
    created_by INT DEFAULT NULL,
    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
); 

ALTER TABLE pharmacy_purchase_return_info ADD CONSTRAINT fk_pharmacy_purchase_return_info_purchase_id FOREIGN KEY (purchase_id) REFERENCES pharmacy_purchase_info(purchase_id);
ALTER TABLE pharmacy_purchase_return_info ADD CONSTRAINT fk_pharmacy_purchase_return_info_functional_year FOREIGN KEY (functional_year_id) REFERENCES functional_year(functional_year_id);
ALTER TABLE pharmacy_purchase_return_info ADD CONSTRAINT fk_pharmacy_purchase_return_info_branch FOREIGN KEY (branch_id) REFERENCES branch_info (branch_id);
ALTER TABLE pharmacy_purchase_return_info ADD CONSTRAINT fk_pharmacy_purchase_return_info_user FOREIGN KEY (created_by) REFERENCES user(user_id);

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
    transaction_id INT NOT NULL,
    functional_year_id INT NOT NULL,
    branch_id INT NOT NULL,
    status TINYINT NOT NULL DEFAULT 1,
    created_by INT DEFAULT NULL,
    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
);

ALTER TABLE pharmacy_purchase_return_info_detail ADD CONSTRAINT fk_pharmacy_purchase_return_info_detail_purchase_id FOREIGN KEY (purchase_detail_id) REFERENCES pharmacy_purchase_info_detail(id);
ALTER TABLE pharmacy_purchase_return_info_detail ADD CONSTRAINT fk_pharmacy_purchase_return_info_detail_functional_year FOREIGN KEY (functional_year_id) REFERENCES functional_year(functional_year_id);
ALTER TABLE pharmacy_purchase_return_info_detail ADD CONSTRAINT fk_pharmacy_purchase_return_info_detail_branch FOREIGN KEY (branch_id) REFERENCES branch_info (branch_id);
ALTER TABLE pharmacy_purchase_return_info_detail ADD CONSTRAINT fk_pharmacy_purchase_return_info_detail_user FOREIGN KEY (created_by) REFERENCES user(user_id);
ALTER TABLE pharmacy_purchase_return_info_detail ADD CONSTRAINT fk_pharmacy_purchase_return_info_detail_product_id FOREIGN KEY (product_id) REFERENCES pharmacy_product_basic_info(product_id);
ALTER TABLE pharmacy_purchase_return_info_detail ADD CONSTRAINT fk_pharmacy_purchase_return_info_detail_unit_id FOREIGN KEY (unit_id) REFERENCES pharmacy_unit_info (unit_id);


INSERT INTO version_info (version,description) 
VALUES (
    '2.2.0',
    'purchase return by purchase voucher voucher number'
);