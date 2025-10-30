START TRANSACTION;

INSERT INTO version_info (version,description) 
VALUES (
    '1.1.0',
    ' Added summary report,
      Added confirmation message in all the available modules
    '
);

COMMIT;