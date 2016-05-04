-- Add concept_numeric

CREATE PROCEDURE ensure_concept_numeric (
                                INOUT new_concept_id INT,
                                _hi_absolute double,
                                _hi_critical double,
                                _hi_normal double,
                                _low_absolute double,
                                _low_critical double,
                                _low_normal double,
                                _units varchar(50),
                                _precise tinyint,
                                _display_precision int)
BEGIN
  DECLARE _concept_id INT;


  SELECT concept_id INTO _concept_id FROM concept_numeric WHERE concept_id = new_concept_id;

  IF ( _concept_id IS NULL ) THEN
    INSERT INTO concept_numeric(
                                concept_id,
                                hi_absolute,
                                hi_critical,
                                hi_normal,
                                low_absolute,
                                low_critical,
                                low_normal,
                                units,
                                precise,
                                display_precision)
    VALUES (
                                new_concept_id,
                                _hi_absolute,
                                _hi_critical,
                                _hi_normal,
                                _low_absolute,
                                _low_critical,
                                _low_normal,
                                _units,
                                _precise,
                                _display_precision
    );
  ElSE
     UPDATE concept_numeric
     SET    hi_absolute = _hi_absolute,
            hi_critical = _hi_critical,
            hi_normal = _hi_normal,
            low_absolute = _low_absolute,
            low_critical = _low_critical,
            low_normal = _low_normal,
            units = _units,
            precise = _precise,
            display_precision = _display_precision
     WHERE concept_id = _concept_id;
  END IF;

END;

