
ALTER TABLE user_branch_info MODIFY COLUMN branch_id INT DEFAULT 0;
ALTER TABLE user_branch_info DROP FOREIGN KEY fk_user_branch_info_branch_id;

INSERT INTO version_info (version,description) 
VALUES (
    '2.1.1',
    'change branch_id datatype to int default 0 and removed foreign key constraint'
);