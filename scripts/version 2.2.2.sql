ALTER TABLE pharmacy_purchase_info
ADD COLUMN taxable_discount_amount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00',
ADD COLUMN non_taxable_discount_amount DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00';


INSERT INTO version_info (version,description) 
VALUES (
    '2.2.2',
    'add taxable_discount_amount and non_taxable_discount_amount in pharmacy_purchase_info'
);