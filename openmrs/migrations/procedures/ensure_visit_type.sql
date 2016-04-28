-- Create visit_type

CREATE PROCEDURE ensure_visit_type (
  _name             VARCHAR(50),
  _description      TEXT,
  _uuid             CHAR(38)
)
BEGIN

  DECLARE _visit_type_id INT;

  SELECT visit_type_id INTO _visit_type_id FROM visit_type WHERE uuid = _uuid;

  IF ( _visit_type_id IS NULL ) THEN
    INSERT INTO visit_type (name, description, creator, date_created, uuid)
    VALUES( _name, _description, 1, now(), _uuid);
  END IF;

END;