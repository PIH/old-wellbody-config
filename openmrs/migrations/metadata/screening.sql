-- This file is used to set up the Screening form

set @concept_id = 0;

-- Consultation form
call ensure_concept(@concept_id, 'CF417837-B896-4011-9C12-749626D2C245', 'Consultation','Consultation', 'N/A', 'ConvSet', true);
set @consultation_form_concept_id = @concept_id;

-- Add "Consultation form" to "All Observation Templates" concept set
call ensure_concept(@concept_id, '7eb83ffc-e42f-11e5-8c3e-08002715d519', 'All Observation Templates','All Observation Templates', 'N/A', 'ConvSet', true);
set @obs_templates_concept_id = @concept_id;
call ensure_concept_set_members(@obs_templates_concept_id, @consultation_form_concept_id, 2);

-- 1. TB Screening Construct
call ensure_concept(@concept_id, '3ADF9CF5-BADF-4FA7-AFE4-34C2D1C53823', 'TB Screening Construct','Screening', 'N/A', 'ConvSet', true);
set @tb_screening_concept_id = @concept_id;
call ensure_concept_set_members(@consultation_form_concept_id, @tb_screening_concept_id, 1);

-- 1.a. Pregnancy Question data
call ensure_concept(@concept_id, 'FDCF677B-69F1-4B6C-AEF0-BDA784DA2441', 'Pregnant data','Pregnant', 'N/A', 'Concept Details', true);
set @pregnant_question_data_concept_id = @concept_id;
call ensure_concept_set_members(@tb_screening_concept_id, @pregnant_question_data_concept_id, 1);
-- Pregnancy question
call ensure_concept(@concept_id, '152B4E79-8B05-4776-B10C-851DFEEF95A8', 'Pregnancy question','Pregnancy question', 'Coded', 'Misc', false);
set @pregnant_question_concept_id = @concept_id;
call ensure_concept_set_members(@pregnant_question_data_concept_id, @pregnant_question_concept_id, 1);
-- Yes
call ensure_concept(@concept_id, '17BD7650-C745-45BE-880F-FF323880DDF4', 'Yes','Yes', 'N/A', 'Misc', false);
set @yes_concept_id = @concept_id;
call ensure_concept_answer(@pregnant_question_concept_id, @yes_concept_id, 1);
-- No
call ensure_concept(@concept_id, '83930A21-C3DD-400C-A24D-91A835D77FFC', 'No','No', 'N/A', 'Misc', false);
set @no_concept_id = @concept_id;
call ensure_concept_answer (@pregnant_question_concept_id, @no_concept_id, 2);

-- TB Screening data
call ensure_concept(@concept_id, 'E55F4F83-A5D8-43C2-A916-0C488DBA843B', 'TB Screening data','TB Screening', 'N/A', 'Concept Details', true);
set @tb_data_concept_id = @concept_id;
call ensure_concept_set_members(@tb_screening_concept_id, @tb_data_concept_id, 2);

-- TB Screening answer
call ensure_concept(@concept_id, '54A1DD43-01C3-4825-AA7C-89630E7FEFAC', 'TB Screening answer','TB Screening answer', 'Coded', 'Misc', false);
set @tb_answer_concept_id = @concept_id;
call ensure_concept_set_members(@tb_data_concept_id, @tb_answer_concept_id, 1);
-- COUGH FOR MORE THAN 2 WEEKS
call ensure_concept(@concept_id, '9B76D4C5-A1E3-4F9A-93FE-0516C4E97B29', 'COUGH FOR MORE THAN 2 WEEKS','COUGH FOR MORE THAN 2 WEEKS', 'N/A', 'Misc', false);
call ensure_concept_answer (@tb_answer_concept_id, @concept_id, 1);
-- COUGHING BLOOD
call ensure_concept(@concept_id, '2DCF1959-510E-4B74-A2C4-947CF425B648', 'COUGHING BLOOD','COUGHING BLOOD', 'N/A', 'Misc', false);
call ensure_concept_answer (@tb_answer_concept_id, @concept_id, 2);
-- WEIGHT LOSS
call ensure_concept(@concept_id, 'A83A8AAA-ABA4-46B6-B9A4-2163EA8DB0FF', 'WEIGHT LOSS','WEIGHT LOSS', 'N/A', 'Misc', false);
call ensure_concept_answer (@tb_answer_concept_id, @concept_id, 3);
-- FEVER
call ensure_concept(@concept_id, '6D0673B6-3249-45AC-BBF8-80B8F0AA4B2B', 'FEVER','FEVER', 'N/A', 'Misc', false);
call ensure_concept_answer (@tb_answer_concept_id, @concept_id, 4);
-- NIGHT SWEATS
call ensure_concept(@concept_id, '862230A9-E32B-4D2C-8628-591EC68B1229', 'NIGHT SWEATS','NIGHT SWEATS', 'N/A', 'Misc', false);
call ensure_concept_answer (@tb_answer_concept_id, @concept_id, 5);


