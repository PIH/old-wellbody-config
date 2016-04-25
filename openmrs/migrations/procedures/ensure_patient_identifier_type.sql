-- Ensure a patient identifier type exists

CREATE PROCEDURE ensure_patient_identifier_type (
  _name    VARCHAR(50),
  _description  TEXT,
  _required     TINYINT(1),
  _uuid    CHAR(38)

)
BEGIN

  DECLARE _id INT;

  SELECT patient_identifier_type_id INTO _id FROM patient_identifier_type WHERE uuid = _uuid;

  IF (_id IS NULL) THEN
    INSERT INTO patient_identifier_type(name, description, creator, date_created, required, uuid) VALUES (_name, _description, 1, now(), _required, _uuid);
  ELSE
    UPDATE patient_identifier_type SET name = _name, description = _description, required = _required WHERE uuid = _uuid;
  END IF;

END;
