



ALTER TABLE disease_info MODIFY disease_code FLOAT NOT NULL;
ALTER TABLE disease_group_info MODIFY disease_group_code FLOAT NOT NULL;

ALTER TABLE free_pharmacy_medicine_info
ADD COLUMN `duration` INT NOT NULL DEFAULT 0 COMMENT 'Duration for the medication',
ADD COLUMN `duration_unit` ENUM('days', 'months', 'years') NOT NULL COMMENT 'Unit of duration',
ADD COLUMN `is_mastitis` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '1 for Mastitis, 0 for Not';
