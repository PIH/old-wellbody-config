
-- Ensure a global property with given value is set

CREATE PROCEDURE ensure_global_property (
  _property         VARCHAR(255),
  _property_value   TEXT,
  _description      TEXT
)
BEGIN

  DECLARE _property_name VARCHAR(255) ;

  SELECT property INTO _property_name FROM global_property WHERE property = _property;

  IF (_property_name IS NULL) THEN
    INSERT INTO global_property (property, property_value, description, uuid) VALUES (_property, _property_value, _description, uuid());
  ELSE
    UPDATE global_property SET property_value = _property_value, description = _description WHERE property = _property;
  END IF;

END;
