-- This file is used to set up the History form

set @concept_id = 0;

-- Consultation form
call ensure_concept(@concept_id, 'CF417837-B896-4011-9C12-749626D2C245', 'Consultation','Consultation', 'N/A', 'ConvSet', true);
set @consultation_form_concept_id = @concept_id;

-- Add "Consultation form" to "All Observation Templates" concept set
call ensure_concept(@concept_id, '7eb83ffc-e42f-11e5-8c3e-08002715d519', 'All Observation Templates','All Observation Templates', 'N/A', 'ConvSet', true);
set @obs_templates_concept_id = @concept_id;
call ensure_concept_set_members(@obs_templates_concept_id, @consultation_form_concept_id, 2);

-- 1. Reason for visit ConvSet
call ensure_concept(@concept_id, '44F824BC-D589-4053-B3E6-B2EBA61F9F13', 'Reason for visit construct','Reason for visit', 'N/A', 'ConvSet', true);
set @reason_concept_id = @concept_id;
call ensure_concept_set_members(@consultation_form_concept_id, @reason_concept_id, 2);
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
call ensure_concept_set_members(@consultation_form_concept_id, @allergies_concept_id, 3);

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

-- 3. History of present illness Construct
call ensure_concept(@concept_id, '3875F363-D576-40BC-AC25-EB8450F2A8BE', 'History of present illness construct','History of present illness', 'N/A', 'ConvSet', true);
set @history_present_illness_concept_id = @concept_id;
call ensure_concept_set_members(@consultation_form_concept_id, @history_present_illness_concept_id, 4);
-- 3.a. History of present illness data
call ensure_concept(@concept_id, 'A34C9649-3C68-410E-BAE1-F28DC0AD4146', 'History of present illness data','History of present illness', 'N/A', 'Concept Details', true);
set @history_present_illness_data_concept_id = @concept_id;
call ensure_concept_set_members(@history_present_illness_concept_id, @history_present_illness_data_concept_id, 1);
-- History of present illness text field
call ensure_concept(@concept_id, 'D8035567-B97D-46AB-9846-6795DA13100E', 'History of present illness','History of present illness', 'Text', 'Misc', false);
call ensure_concept_set_members(@history_present_illness_data_concept_id, @concept_id, 1);

-- 4. Medical history Construct
call ensure_concept(@concept_id, '79C342C6-A886-4945-A268-FF74096EC3AA', 'Medical history construct','Medical history', 'N/A', 'ConvSet', true);
set @medical_history_concept_id = @concept_id;
call ensure_concept_set_members(@consultation_form_concept_id, @medical_history_concept_id, 5);
-- 4.a. Medical history Question data
call ensure_concept(@concept_id, 'CCE05FF9-ED45-440D-8F9B-A5295EDAC44B', 'Medical history data','Medical history', 'N/A', 'Concept Details', true);
set @medical_history_question_data_concept_id = @concept_id;
call ensure_concept_set_members(@medical_history_concept_id, @medical_history_question_data_concept_id, 1);
-- Medical history question
call ensure_concept(@concept_id, '3706DC6C-7373-4786-A93D-9119BE27ABE1', 'Medical history question','Medical history question', 'Coded', 'Misc', false);
set @medical_history_question_concept_id = @concept_id;
call ensure_concept_set_members(@medical_history_question_data_concept_id, @medical_history_question_concept_id, 1);
-- HBP
call ensure_concept(@concept_id, '9DDF2E03-555A-46C8-8EC9-8E63140D388B', 'HBP','HBP', 'N/A', 'Misc', false);
call ensure_concept_answer(@medical_history_question_concept_id, @concept_id, 1);
-- Diabetes
call ensure_concept(@concept_id, 'CF247AD0-516E-48C7-BA3F-D6EE2DB0651B', 'Diabetes','Diabetes', 'N/A', 'Misc', false);
call ensure_concept_answer (@medical_history_question_concept_id, @concept_id, 2);
-- Asthma
call ensure_concept(@concept_id, '0E13C353-C924-4491-9710-D2ABDAA1C30E', 'Asthma','Asthma', 'N/A', 'Misc', false);
call ensure_concept_answer (@medical_history_question_concept_id, @concept_id, 3);
-- TB
call ensure_concept(@concept_id, '9EE5C5F7-85B6-4889-98A3-B998C17A3D51', 'TB','TB', 'N/A', 'Misc', false);
call ensure_concept_answer (@medical_history_question_concept_id, @concept_id, 4);
-- Epilepsy
call ensure_concept(@concept_id, '3F2FAB27-AE68-4A1F-9DF1-DA4B642882C6', 'Epilepsy','Epilepsy', 'N/A', 'Misc', false);
call ensure_concept_answer (@medical_history_question_concept_id, @concept_id, 5);
-- RVS
call ensure_concept(@concept_id, 'E7E42575-0829-4903-89B1-FF21F324472F', 'RVS','RVS', 'N/A', 'Misc', false);
call ensure_concept_answer (@medical_history_question_concept_id, @concept_id, 6);
-- Sickle cell anemia
call ensure_concept(@concept_id, '09D7395F-FDC0-4317-9396-71282C921CD5', 'Sickle cell anemia','Sickle cell anemia', 'N/A', 'Misc', false);
call ensure_concept_answer (@medical_history_question_concept_id, @concept_id, 7);

-- 4.b. Medical history data
call ensure_concept(@concept_id, '9030046F-7EE6-4387-A2E6-4FB28E428F90', 'Medical history other','Others', 'N/A', 'Concept Details', true);
set @medical_history_others_data_concept_id = @concept_id;
call ensure_concept_set_members(@medical_history_concept_id, @medical_history_others_data_concept_id, 2);
-- Allergies text field
call ensure_concept(@concept_id, 'AD332C16-3DD2-4A76-84CE-B730308D8A55', 'Medical history other','Medical history other', 'Text', 'Misc', false);
call ensure_concept_set_members(@medical_history_others_data_concept_id, @concept_id, 1);

-- 5. Current Medications Construct
call ensure_concept(@concept_id, '01F3D8F2-8AF3-4F9A-B5A9-1D82219D1E0F', 'Current Medications construct','Current Medications', 'N/A', 'ConvSet', true);
set @current_medications_concept_id = @concept_id;
call ensure_concept_set_members(@consultation_form_concept_id, @current_medications_concept_id, 6);
-- 3.a. Current Medications data
call ensure_concept(@concept_id, 'D8219A6D-99D0-4494-8746-E66EBDEF7B82', 'Current Medications data','Current Medications', 'N/A', 'Concept Details', true);
set @current_medications_data_concept_id = @concept_id;
call ensure_concept_set_members(@current_medications_concept_id, @current_medications_data_concept_id, 1);
-- Current Medications text field
call ensure_concept(@concept_id, '4B258698-1ACC-47E3-9633-38431B4617F4', 'Current Medications','Current Medications', 'Text', 'Misc', false);
call ensure_concept_set_members(@current_medications_data_concept_id, @concept_id, 1);

-- 6. Habits ConvSet
call ensure_concept(@concept_id, '65A515A2-4253-4D90-9000-6462BB4B2B29', 'Habits construct','Habits', 'N/A', 'ConvSet', true);
set @habits_concept_id = @concept_id;
call ensure_concept_set_members(@consultation_form_concept_id, @habits_concept_id, 7);

-- 6.a. Tobacco Question data
call ensure_concept(@concept_id, '645CA4DB-99B8-43BD-AB95-D10A80498A05', 'Tobacco data','Tobacco', 'N/A', 'Concept Details', true);
set @tobacco_question_data_concept_id = @concept_id;
call ensure_concept_set_members(@habits_concept_id, @tobacco_question_data_concept_id, 1);
-- Tobacco question
call ensure_concept(@concept_id, 'E4FD5B7F-C5E1-498D-9EDC-A7016950482D', 'Tobacco question','Tobacco question', 'Coded', 'Misc', false);
set @tobacco_question_concept_id = @concept_id;
call ensure_concept_set_members(@tobacco_question_data_concept_id, @tobacco_question_concept_id, 1);
-- Yes
call ensure_concept_answer(@tobacco_question_concept_id, @yes_concept_id, 1);
-- No
call ensure_concept_answer (@tobacco_question_concept_id, @no_concept_id, 2);

-- 6.b. Alcohol Question data
call ensure_concept(@concept_id, '1E4F0D9B-AC45-4305-93E3-D2F652E65436', 'Alcohol data','Alcohol', 'N/A', 'Concept Details', true);
set @alcohol_question_data_concept_id = @concept_id;
call ensure_concept_set_members(@habits_concept_id, @alcohol_question_data_concept_id, 2);
-- Alcohol question
call ensure_concept(@concept_id, 'D2D98452-3976-4CC0-9AAC-1DB8DDBA04D3', 'Alcohol question','Alcohol question', 'Coded', 'Misc', false);
set @alcohol_question_concept_id = @concept_id;
call ensure_concept_set_members(@alcohol_question_data_concept_id, @alcohol_question_concept_id, 1);
-- Yes
call ensure_concept_answer(@alcohol_question_concept_id, @yes_concept_id, 1);
-- No
call ensure_concept_answer (@alcohol_question_concept_id, @no_concept_id, 2);

-- 6.c. Drugs Question data
call ensure_concept(@concept_id, 'D7F33414-644C-4661-99E0-435F7FE2FD46', 'Drugs data','Drugs', 'N/A', 'Concept Details', true);
set @drugs_question_data_concept_id = @concept_id;
call ensure_concept_set_members(@habits_concept_id, @drugs_question_data_concept_id, 3);
-- Drugs question
call ensure_concept(@concept_id, 'B209CBA6-871C-43F6-AA30-F4CFFBBA1FE6', 'Drugs question','Drugs question', 'Coded', 'Misc', false);
set @drugs_question_concept_id = @concept_id;
call ensure_concept_set_members(@drugs_question_data_concept_id, @drugs_question_concept_id, 1);
-- Yes
call ensure_concept_answer(@drugs_question_concept_id, @yes_concept_id, 1);
-- No
call ensure_concept_answer (@drugs_question_concept_id, @no_concept_id, 2);