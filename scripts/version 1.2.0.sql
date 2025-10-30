START TRANSACTION;

ALTER TABLE province ADD COLUMN isDefault TINYINT DEFAULT 0;
ALTER TABLE district ADD COLUMN isDefault TINYINT DEFAULT 0;

UPDATE province SET isDefault=1 WHERE id=5;
UPDATE district SET isDefault=1 WHERE id=49;

INSERT INTO version_info (version,description) 
VALUES (
    '1.2.0',
    'Added Transaction report,
      Added default province and district feature
    '
);

COMMIT;