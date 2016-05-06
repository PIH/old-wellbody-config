-- This file is used to set up Diagnoses

set @concept_id = 0;

-- "Diagnosis Set of Sets" concept set
call ensure_concept(@concept_id, 'dbc2ecdb-4e14-11e4-8a57-0800271c1b75', 'Diagnosis Set of Sets','Diagnosis Set of Sets', 'N/A', 'ConvSet', true);
set @diagnosis_set_concept_id = @concept_id;

-- "Infectious and Parasitic Diseases" concept set
call ensure_concept(@concept_id, 'dbd1cd6c-4e14-11e4-8a57-0800271c1b75', 'Infectious and Parasitic Diseases','Infectious and Parasitic Diseases', 'N/A', 'ConvSet', true);
set @id_concept_id = @concept_id;
call ensure_concept_set_members(@diagnosis_set_concept_id, @id_concept_id, 1);

-- Add "Bacteremia (not septicemia)" to "Infectious and Parasitic Diseases"
call ensure_concept(@concept_id, 'dbdb223a-4e14-11e4-8a57-0800271c1b75', 'Bacteremia (not septicemia)','Bacteremia (not septicemia)', 'N/A', 'Diagnosis', true);
set @disease_concept_id = @concept_id;
call ensure_concept_set_members(@id_concept_id, @disease_concept_id, 1);

