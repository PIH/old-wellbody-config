
-- Ensure a location exists with the given attributes

CREATE PROCEDURE ensure_location (
  _location_name    VARCHAR(255),
  _description      VARCHAR(255),
  _uuid             CHAR(38)
)
BEGIN

  DECLARE _location_id INT;

  SELECT location_id INTO _location_id FROM location WHERE uuid = _uuid;

  IF (_location_id IS NULL) THEN
    INSERT INTO location (name, description, creator, date_created, uuid) VALUES (_location_name, _description, 1, now(), _uuid);
  ELSE
    UPDATE location SET name = _location_name, description = _description WHERE uuid = _uuid;
  END IF;

END;
