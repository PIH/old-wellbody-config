
-- Ensure the given role has the given set of privileges.
-- This will not remove any existing privileges, but will simply ensure the role has those in this list (comma-delimited)

CREATE PROCEDURE ensure_role_privileges( _role_name VARCHAR(255), _privilege_list VARCHAR(255) )
BEGIN

  DECLARE _privilege_name VARCHAR(255);
  DECLARE _num_existing INT;

  -- Iterate over each role in the passed role list, using a comma as a separator
  WHILE (_privilege_list != '') DO
    SET _privilege_name = SUBSTRING_INDEX(_privilege_list, ',', 1);

    SELECT count(*) INTO _num_existing FROM role_privilege WHERE role = TRIM(_role_name) AND privilege = TRIM(_privilege_name);

    IF (_num_existing = 0) THEN
      INSERT INTO role_privilege(role, privilege) VALUES(TRIM(_role_name), TRIM(_privilege_name));
      SET _privilege_list = SUBSTRING(_privilege_list, CHAR_LENGTH(_privilege_name) + 2);
    END IF;
    
  END WHILE;

END;
