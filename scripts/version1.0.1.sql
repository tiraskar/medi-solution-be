START TRANSACTION;

ALTER TABLE `patient_follow_up_info` 
DROP FOREIGN KEY `fk_patient_follow_up_info_billing_title`,
DROP FOREIGN KEY `fk_patient_follow_up_info_billing_info`;
ALTER TABLE `patient_follow_up_info` 
DROP INDEX `fk_patient_follow_up_info_billing_info` ,
DROP INDEX `fk_patient_follow_up_info_billing_title` ;
;

ALTER TABLE patient_follow_up_info CHANGE remarks registration_type VARCHAR(255) DEFAULT NULL;
ALTER TABLE patient_follow_up_info ADD COLUMN isFreeRegistration BOOLEAN NOT NULL DEFAULT FALSE;
ALTER TABLE patient_follow_up_info ADD COLUMN remarks TEXT DEFAULT NULL;

ALTER TABLE patient_follow_up_info MODIFY COLUMN billing_title_id INT DEFAULT NULL;
ALTER TABLE patient_follow_up_info MODIFY COLUMN receipt_id INT DEFAULT NULL;

CREATE TABLE version_info(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  version VARCHAR(45) NOT NULL,
  description TEXT DEFAULT NULL,
  created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO version_info (version,description) 
VALUES ('1.0.1','added feature for free registration of patient');

COMMIT;