
-- Retire person_attribute_type

CREATE PROCEDURE retire_person_attribute_type (
  _uuid          CHAR(38),
  _retire_reason VARCHAR(255)

)
BEGIN

  DECLARE _id INT;

  SELECT person_attribute_type_id INTO _id FROM person_attribute_type WHERE uuid = _uuid;

  IF (_id IS NOT NULL) THEN
    UPDATE person_attribute_type SET retired = 1, retired_by = 1, retire_reason = _retire_reason WHERE person_attribute_type_id = _id;
  END IF;

END;