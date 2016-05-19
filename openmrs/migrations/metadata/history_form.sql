-- This file is used to set up the History form

set @concept_id = 0;

-- History template concept set
call ensure_concept(@concept_id, '37571079-99C4-4EF6-BB26-D8F32E766D77', 'History template','History', 'N/A', 'ConvSet', true);
set @history_concept_id = @concept_id;

-- Add "History template" to "All Observation Templates" concept set
call ensure_concept(@concept_id, '7eb83ffc-e42f-11e5-8c3e-08002715d519', 'All Observation Templates','All Observation Templates', 'N/A', 'ConvSet', true);
set @obs_templates_concept_id = @concept_id;
call ensure_concept_set_members(@obs_templates_concept_id, @history_concept_id, 3);

-- 1. Reason for visit ConvSet
call ensure_concept(@concept_id, '44F824BC-D589-4053-B3E6-B2EBA61F9F13', 'Reason for visit construct','Reason for visit', 'N/A', 'ConvSet', true);
set @reason_concept_id = @concept_id;
call ensure_concept_set_members(@history_concept_id, @reason_concept_id, 1);
-- 1.a. Reason for visit data
call ensure_concept(@concept_id, '40F05BB2-5E72-4382-B3DC-149F0D84A991', 'Reason for visit data','Reason for visit', 'N/A', 'Concept Details', true);
set @reason_data_concept_id = @concept_id;
call ensure_concept_set_members(@reason_concept_id, @reason_data_concept_id, 1);
-- Reason for visit text field
call ensure_concept(@concept_id, '4587CFB9-C56E-41CC-9FB2-669471E6544D', 'Reason for visit','Reason for visit', 'Text', 'Misc', false);
call ensure_concept_set_members(@reason_data_concept_id, @concept_id, 1);

-- 2. Allergies ConvSet
call ensure_concept(@concept_id, 'FED78E4B-549E-4E76-AA09-5921568C595B', 'Allergies construct','Allergies', 'N/A', 'ConvSet', true);
set @allergies_concept_id = @concept_id;
call ensure_concept_set_members(@history_concept_id, @allergies_concept_id, 1);

-- 2.a. Allergies Question data
call ensure_concept(@concept_id, '16C1F043-2F37-41B5-9383-786ED1C5BD05', 'Allergies data','Allergies', 'N/A', 'Concept Details', true);
set @allergies_question_data_concept_id = @concept_id;
call ensure_concept_set_members(@allergies_concept_id, @allergies_question_data_concept_id, 1);
-- Allergies question
call ensure_concept(@concept_id, 'F1281D0F-D42C-48D7-BABC-A356FBA11C48', 'Allergies question','Allergies question', 'Coded', 'Misc', false);
set @allergy_question_concept_id = @concept_id;
call ensure_concept_set_members(@allergies_question_data_concept_id, @allergy_question_concept_id, 1);
-- Yes
call ensure_concept(@concept_id, '17BD7650-C745-45BE-880F-FF323880DDF4', 'Yes','Yes', 'N/A', 'Misc', false);
set @yes_concept_id = @concept_id;
call ensure_concept_answer(@allergy_question_concept_id, @yes_concept_id, 1);
-- No
call ensure_concept(@concept_id, '83930A21-C3DD-400C-A24D-91A835D77FFC', 'No','No', 'N/A', 'Misc', false);
set @no_concept_id = @concept_id;
call ensure_concept_answer (@allergy_question_concept_id, @no_concept_id, 2);

-- 2.b. Allergies data
call ensure_concept(@concept_id, '4CC54D5C-0B6F-441D-B4EC-485FADCB92CF', 'Allergies data','If yes, specify', 'N/A', 'Concept Details', true);
set @allergies_data_concept_id = @concept_id;
call ensure_concept_set_members(@allergies_concept_id, @allergies_data_concept_id, 2);
-- Allergies text field
call ensure_concept(@concept_id, '42F47964-BA41-4CAB-B11C-38207CC1ED51', 'Allergies','Allergies', 'Text', 'Misc', false);
call ensure_concept_set_members(@allergies_data_concept_id, @concept_id, 1);