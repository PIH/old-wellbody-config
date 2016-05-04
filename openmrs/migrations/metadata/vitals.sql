-- This file is used to set up Fee Information concept_set

set @concept_id = 0;
set @answer_concept_id = 0;

-- Vitals concept set
call ensure_concept(@concept_id, '80c8b161-a871-42db-a1ca-185095a1d798', 'Vitals','Vitals', 'N/A', 'Misc', true);
set @vitals_concept_id = @concept_id;

-- Pulse Data
call ensure_concept(@concept_id, '3ce93824-26fe-102b-80cb-0017a47871b2', 'Pulse Data','Pulse', 'N/A', 'Concept Details', true);
set @pulse_data_concept_id = @concept_id;
call ensure_concept_set_members(@vitals_concept_id, @pulse_data_concept_id, 1);

-- Pulse
call ensure_concept(@concept_id, 'c36bc411-3f10-11e4-adec-0800271c1b75', 'Pulse','Pulse', 'Numeric', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_set_members(@pulse_data_concept_id, @child_concept_id, 1);
call ensure_concept_numeric(@child_concept_id, NULL, NULL, 72, NULL, NULL, 72, '/min', 0, NULL);

-- Pulse Abnormal
call ensure_concept(@concept_id, 'c36c7c98-3f10-11e4-adec-0800271c1b75', 'Pulse Abnormal','Pulse Abnormal', 'Boolean', 'Abnormal', false);
set @child_concept_id = @concept_id;
call ensure_concept_set_members(@pulse_data_concept_id, @child_concept_id, 2);


-- Add Vitals to "All Observation Templates" concept set
call ensure_concept(@concept_id, '7eb83ffc-e42f-11e5-8c3e-08002715d519', 'All Observation Templates','All Observation Templates', 'N/A', 'ConvSet', true);
set @obs_templates_concept_id = @concept_id;
call ensure_concept_set_members(@obs_templates_concept_id, @vitals_concept_id, 1);