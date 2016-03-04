# Ensure a user account exists with the given attributes

DROP PROCEDURE IF EXISTS ensure_user;

CREATE PROCEDURE ensure_user (
  _username    VARCHAR(255),
  _given_name  VARCHAR(255),
  _family_name VARCHAR(255),
  _gender      VARCHAR(255),
  _password    VARCHAR(255),
  _salt        VARCHAR(255)
)
BEGIN

  DECLARE _user_id INT;
  DECLARE _person_id INT;
  DECLARE _person_uuid CHAR(38);

  SELECT user_id, person_id INTO _user_id, _person_id FROM users WHERE system_id = _username OR username = _username;

  IF (_user_id IS NOT null) THEN
    UPDATE users SET username = _username, system_id = _username, password = _password, salt = _salt WHERE user_id = _user_id;
    UPDATE person SET gender = _gender WHERE person_id = _person_id;
    UPDATE person_name SET given_name = _given_name, family_name = _family_name where person_id = _person_id;
  ELSE
    SELECT uuid() INTO _person_uuid;
    INSERT INTO person(gender, creator, date_created, uuid) values (_gender, 1, now(), _person_uuid);
    SELECT person_id into _person_id FROM person WHERE uuid = _person_uuid;
    INSERT INTO person_name(person_id, given_name, family_name, preferred, creator, date_created, uuid) values (_person_id, _given_name, _family_name, 1, 1, now(), uuid());
    INSERT INTO users (person_id, username, system_id, creator, date_created, uuid, password, salt) values (_person_id, _username, _username, 1, now(), uuid(), _password, _salt);
  END IF;

END;

# Ensure a provider account with the given identifier exists for the given user

DROP PROCEDURE IF EXISTS ensure_provider;

CREATE PROCEDURE ensure_provider(
  _username            VARCHAR(255),
  _provider_identifier VARCHAR(255)
)
BEGIN

  DECLARE _person_id INT;
  DECLARE _provider_id INT;

  SELECT person_id INTO _person_id FROM users WHERE username = _username;
  SELECT provider_id INTO _provider_id FROM provider WHERE person_id = _person_id AND identifier = _provider_identifier;

  IF (_provider_id IS NULL) THEN
    INSERT INTO provider (person_id, identifier, creator, date_created, uuid) VALUES (_person_id, _provider_identifier, 1, now(), uuid());
  END IF;

END;

# Ensure the given user account has the given set of roles.
# This will remove all existing roles for the user and ensure they only have those in this list (comma-delimited)

DROP PROCEDURE IF EXISTS ensure_user_roles;

CREATE PROCEDURE ensure_user_roles( _username VARCHAR(255), _role_list VARCHAR(255) )
BEGIN

  DECLARE _user_id INT;
  DECLARE _role_name VARCHAR(255);

  SELECT user_id INTO _user_id FROM users WHERE username = _username;
  DELETE FROM user_role WHERE user_id = _user_id;

  # Iterate over each role in the passed role list, using a comma as a separator
  WHILE _role_list != '' > 0 DO
    SET _role_name = SUBSTRING_INDEX(_role_list, ',', 1);
    INSERT INTO user_role(user_id, role) VALUES(_user_id, TRIM(_role_name));
    SET _role_list = SUBSTRING(_role_list, CHAR_LENGTH(_role_name) + 2);
  END WHILE;

END;
