
-- Ensure a location with the given name is tagged with the given tag

CREATE PROCEDURE ensure_location_has_tag (
  _location_name    VARCHAR(255),
  _tag_name         VARCHAR(255)
)
BEGIN

  DECLARE _location_id INT;
  DECLARE _location_tag_id INT;
  DECLARE _num_exists INT;

  SELECT location_id INTO _location_id FROM location WHERE name = _location_name;
  SELECT location_tag_id INTO _location_tag_id FROM location_tag where name = _tag_name;
  SELECT count(*) INTO _num_exists FROM location_tag_map where location_id = _location_id and location_tag_id = _location_tag_id;

  IF (_num_exists = 0) THEN
    INSERT INTO location_tag_map (location_id, location_tag_id) VALUES (_location_id, _location_tag_id);
  END IF;

END;
