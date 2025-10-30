ALTER TABLE pharmacy_purchase_info_detail MODIFY COLUMN discount_type VARCHAR(50) DEFAULT 'PERCENT';
ALTER TABLE pharmacy_stock_info MODIFY COLUMN discount_type VARCHAR(50) DEFAULT 'PERCENT';
ALTER TABLE pharmacy_opening_stock_info MODIFY COLUMN  discount_type VARCHAR(50) DEFAULT 'PERCENT';


UPDATE pharmacy_stock_info
SET discount_type = 'PERCENT'
WHERE discount_type IS NULL;

UPDATE pharmacy_purchase_info_detail
SET discount_type = 'PERCENT'
WHERE discount_type IS NULL;

UPDATE pharmacy_opening_stock_info
SET discount_type = 'PERCENT'
WHERE discount_type IS NULL;

ALTER TABLE pdc_info ADD COLUMN remarks TEXT DEFAULT NULL;

ALTER TABLE pdc_info ADD CONSTRAINT fk_pdc_info_functional_year FOREIGN KEY (functional_year_id) REFERENCES functional_year(functional_year_id);

ALTER TABLE pharmacy_product_batch_info MODIFY COLUMN batch_no VARCHAR(255) NOT NULL;


INSERT INTO version_info (version,description) 
VALUES (
    '3.2.0',
    'add mrp column in pharmacy_opening_stock_info',
    'add remarks on pdc_info',
    'pdc management cheque settlement',
    'modify batch_no to varchar in product batch info',
    'set discount type percent default value in discount_type present table i.e pharmacy_opening_stock_info pharmacy_purchase_info_detail and pharmacy_opening_stock_info'
);

ALTER TABLE pharmacy_purchase_info_detail ADD is_taxable TINYINT NOT NULL DEFAULT 0;