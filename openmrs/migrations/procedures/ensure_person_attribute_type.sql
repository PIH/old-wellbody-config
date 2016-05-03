
-- Create person_attribute_type

CREATE PROCEDURE ensure_person_attribute_type (
  _name             VARCHAR(50),
  _description      TEXT,
  _format           VARCHAR(50),
  _foreign_key      INT(11),
  _searchable       TINYINT(1),
  _creator          INT(11),
  _retired          TINYINT(1),
  _retired_by       INT(11),  
  _date_retired     DATETIME,
  _retire_reason    VARCHAR(255),
  _sort_weight      DOUBLE,
  _uuid             CHAR(38)
)
BEGIN

  DECLARE _id INT;
  
  SELECT person_attribute_type_id INTO _id FROM person_attribute_type WHERE uuid = _uuid;

  IF (_id IS NULL) THEN
    INSERT INTO person_attribute_type(
                    `name`,
                    `description`,
                    `format`,
                    `foreign_key`,
                    `searchable`,
                    `creator`,
                    `date_created`,
                    `retired`,
                    `retired_by`,
                    `date_retired`,
                    `retire_reason`,
                    `sort_weight`,
                    `uuid`)
    VALUES(
                    _name,
                    _description,
                    _format,
                    _foreign_key,
                    _searchable,
                    _creator,
                    now(),
                    _retired,
                    _retired_by,
                    _date_retired,
                    _retire_reason,
                    _sort_weight,
                    _uuid);

  ELSE
    UPDATE person_attribute_type
    SET name = _name,
        description = _description,
        format  = _format,
        foreign_key = _foreign_key,
        searchable = _searchable,
        retired = _retired,
        retired_by = _retired_by,
        date_retired = _date_retired,
        retire_reason = _retire_reason,
        sort_weight = _sort_weight
    WHERE person_attribute_type_id = _id;
  END IF;
END;