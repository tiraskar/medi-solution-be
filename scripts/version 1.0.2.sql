START TRANSACTION;

ALTER TABLE patient_follow_up_info ADD COLUMN queue_no INT NOT NULL;

INSERT INTO version_info (version,description) 
VALUES (
    '1.0.2',
    ' added sticker reprint option in patient registration,
      added queue no in patient registration,
      added fromData and toDate in patient pagination
    '
);

UPDATE district SET district_eng="Nawalparasi", district_nep="नवलपरासी" WHERE id=48;

COMMIT;