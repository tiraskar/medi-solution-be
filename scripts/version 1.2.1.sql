START TRANSACTION;

ALTER TABLE billing_info ADD COLUMN qty INT NOT NULL DEFAULT 1;

INSERT INTO version_info (version,description) 
VALUES (
    '1.2.1',
    ' fixed date issue in print api,
      added from date and to date in summary report,
      added qty in opd billing,
      added edit option in billing title
    '
);

COMMIT;