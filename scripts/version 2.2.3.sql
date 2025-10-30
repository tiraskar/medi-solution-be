ALTER TABLE pharmacy_stock_info add mrp DECIMAL(65 , 2 ) NOT NULL DEFAULT '0.00';

INSERT INTO version_info (version,description) 
VALUES (
    '2.2.3',
    'added mrp in pharmacy_stock_info'
);