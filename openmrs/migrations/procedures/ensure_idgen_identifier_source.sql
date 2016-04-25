-- Ensure the identifier source for a given patient identifier type exist

CREATE PROCEDURE ensure_idgen_identifier_source (
 _identifier_type_uuid CHAR(38),
 _identifier_source_name  VARCHAR(255),
 _description VARCHAR(1000),
 _base_character_set VARCHAR(255),
 _first_identifier_base VARCHAR(50),
 _prefix VARCHAR(20),
 _suffix VARCHAR(20),
 _min_length INT(11),
 _max_length INT(11),
 _location_uuid CHAR(38)

)
BEGIN

  DECLARE _identifier_type_id INT;
  DECLARE _identifier_source_id INT;
  DECLARE _seq_gen_id INT;
  DECLARE _location_id INT;
  DECLARE _auto_generation_option_id INT;

  SELECT patient_identifier_type_id INTO _identifier_type_id FROM patient_identifier_type WHERE uuid = _identifier_type_uuid;
  SELECT  location_id INTO _location_id from location where uuid = _location_uuid;

  IF ( _identifier_type_id IS NOT NULL AND _location_id IS NOT NULL) THEN
    SELECT id INTO _identifier_source_id FROM idgen_identifier_source WHERE identifier_type = _identifier_type_id and name = _identifier_source_name;
    IF ( _identifier_source_id IS NULL ) THEN
      INSERT INTO idgen_identifier_source(uuid, name, description, identifier_type, creator, date_created) VALUES( uuid(), _identifier_source_name, _description, _identifier_type_id, 1, now() );
    ELSE
      UPDATE idgen_identifier_source SET description = _description WHERE id = _identifier_source_id;
    END IF;

    SELECT id INTO _identifier_source_id FROM idgen_identifier_source WHERE identifier_type = _identifier_type_id and name = _identifier_source_name;
    SELECT id INTO _seq_gen_id FROM idgen_seq_id_gen WHERE id = _identifier_source_id;
    IF ( _seq_gen_id is NULL ) THEN
      INSERT INTO idgen_seq_id_gen (base_character_set, first_identifier_base, prefix, suffix, min_length, max_length, id) VALUES (_base_character_set, _first_identifier_base, _prefix, _suffix, _min_length, _max_length, _identifier_source_id);
    ELSE
      UPDATE idgen_seq_id_gen SET base_character_set = _base_character_set, first_identifier_base = _first_identifier_base, prefix = _prefix, suffix= _suffix, min_length = _min_length, max_length = _max_length WHERE id = _identifier_source_id;
    END IF;

    SELECT id INTO _auto_generation_option_id FROM idgen_auto_generation_option WHERE identifier_type = _identifier_type_id AND source = _identifier_source_id AND location = _location_id;
    IF (_auto_generation_option_id IS NULL ) THEN
        INSERT INTO idgen_auto_generation_option (identifier_type, location, source, manual_entry_enabled, automatic_generation_enabled) VALUES ( _identifier_type_id, _location_id, _identifier_source_id, 1, 1);
    ELSE
        UPDATE idgen_auto_generation_option SET identifier_type = _identifier_type_id, source = _identifier_source_id, location = _location_id, manual_entry_enabled = 1, automatic_generation_enabled = 1 WHERE id = _auto_generation_option_id;
    END IF;

  END IF;

END;
