
CREATE TABLE patient_ip_info ( 
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
patient_id  INT NOT NULL,
muldharta_no VARCHAR(255) NOT NULL,
functional_year_id INT NOT NULL,
status TINYINT NOT NULL DEFAULT 1
);

ALTER TABLE patient_ip_info ADD CONSTRAINT fk_patient_ip_info_functional_year FOREIGN KEY (functional_year_id) REFERENCES functional_year(functional_year_id);
ALTER TABLE patient_ip_info ADD CONSTRAINT fk_patient_ip_info_patient_info FOREIGN KEY (patient_id) REFERENCES patient_info(patient_id);

INSERT INTO index_info (functional_year_id,title,index_code,max_id) values (2,'muldarta_number','MDN',0);

INSERT INTO version_info (version,description) 
VALUES ('3.2.1','added feature for muldharta');