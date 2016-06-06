-- This file is used to set up Physical Exam form

set @concept_id = 0;

-- Consultation form
call ensure_concept(@concept_id, 'CF417837-B896-4011-9C12-749626D2C245', 'Consultation','Consultation', 'N/A', 'ConvSet', true);
set @consultation_form_concept_id = @concept_id;

-- Add "Consultation form" to "All Observation Templates" concept set
call ensure_concept(@concept_id, '7eb83ffc-e42f-11e5-8c3e-08002715d519', 'All Observation Templates','All Observation Templates', 'N/A', 'ConvSet', true);
set @obs_templates_concept_id = @concept_id;
call ensure_concept_set_members(@obs_templates_concept_id, @consultation_form_concept_id, 2);

-- 1. Exam ConvSet
call ensure_concept(@concept_id, '41BA03B8-3FFB-4B76-B5C2-168D6E78DF8F', 'Exam','Exam', 'N/A', 'ConvSet', true);
set @examm_concept_id = @concept_id;
call ensure_concept_set_members(@consultation_form_concept_id, @examm_concept_id, 8);
-- HEENT data
call ensure_concept(@concept_id, '3cd75b86-26fe-102b-80cb-0017a47871b2', 'HEENT data','HEENT', 'N/A', 'Concept Details', true);
set @heent_data_concept_id = @concept_id;
call ensure_concept_set_members(@examm_concept_id, @heent_data_concept_id, 1);

-- Status
call ensure_concept(@concept_id, 'ABB8A739-32CA-436D-B260-0E512A4797EB', 'Status','Status', 'Coded', 'Misc', false);
set @status_concept_id = @concept_id;
call ensure_concept_set_members(@heent_data_concept_id, @status_concept_id, 1);
-- Normal
call ensure_concept(@concept_id, '3cd750a0-26fe-102b-80cb-0017a47871b2', 'Normal','Normal', 'N/A', 'Misc', false);
set @normal_concept_id = @concept_id;
call ensure_concept_answer (@status_concept_id, @normal_concept_id, 1);
-- Abnormal
call ensure_concept(@concept_id, '3cd75230-26fe-102b-80cb-0017a47871b2', 'Abnormal','Abnormal', 'N/A', 'Misc', false);
set @abnormal_concept_id = @concept_id;
call ensure_concept_answer (@status_concept_id, @abnormal_concept_id, 2);
-- N/A
call ensure_concept(@concept_id, '313780DC-B884-40A8-B939-DDAD1A5CEE3B', 'Not Applicable','N/A', 'N/A', 'Misc', false);
set @n_a_concept_id = @concept_id;
call ensure_concept_answer (@status_concept_id, @n_a_concept_id, 3);

-- Heart data
call ensure_concept(@concept_id, '70520541-2C56-4681-97C3-B18062F510A1', 'Heart data','Heart', 'N/A', 'Concept Details', true);
set @heart_data_concept_id = @concept_id;
call ensure_concept_set_members(@examm_concept_id, @heart_data_concept_id, 2);
-- Status
call ensure_concept_set_members(@heart_data_concept_id, @status_concept_id, 1);

-- Lungs data
call ensure_concept(@concept_id, 'F4DEB130-4C7A-43B7-AAE8-3F3BB6F891A5', 'Lungs data','Lungs', 'N/A', 'Concept Details', true);
set @lungs_data_concept_id = @concept_id;
call ensure_concept_set_members(@examm_concept_id, @lungs_data_concept_id, 3);
-- Status
call ensure_concept_set_members(@lungs_data_concept_id, @status_concept_id, 1);

-- Abdomen data
call ensure_concept(@concept_id, 'B1071C5F-D441-4629-904B-B939DBE76892', 'Abdomen data','Abdomen', 'N/A', 'Concept Details', true);
set @abdomen_data_concept_id = @concept_id;
call ensure_concept_set_members(@examm_concept_id, @abdomen_data_concept_id, 4);
-- Status
call ensure_concept_set_members(@abdomen_data_concept_id, @status_concept_id, 1);

-- Other data
call ensure_concept(@concept_id, '40A35A23-8017-4916-8938-4C37A1B6C015', 'Other data','Other (Specify)', 'N/A', 'Concept Details', true);
set @other_data_concept_id = @concept_id;
call ensure_concept_set_members(@examm_concept_id, @other_data_concept_id, 5);
-- Status
call ensure_concept_set_members(@other_data_concept_id, @status_concept_id, 1);

-- Impression data
call ensure_concept(@concept_id, '30E0B5DB-9D6F-488E-8B28-AE94E2615BDB', 'Impression data','Impression and Plan', 'N/A', 'Concept Details', true);
set @impression_data_concept_id = @concept_id;
call ensure_concept_set_members(@examm_concept_id, @impression_data_concept_id, 6);

-- Impression and Plan text field
call ensure_concept(@concept_id, 'BDA6FEB0-A8DE-46D0-AA50-203BB097B892', 'Impression and Plan','Impression and Plan', 'Text', 'Misc', false);
set @impression_concept_id = @concept_id;
call ensure_concept_set_members(@impression_data_concept_id, @impression_concept_id, 1);

-- Counseled for RVS data
call ensure_concept(@concept_id, 'EA417364-1C88-4FD3-8261-1A1D7213E1AF', 'Counseled for RVS data','Counseled for RVS testing', 'N/A', 'Concept Details', true);
set @counseled_data_concept_id = @concept_id;
call ensure_concept_set_members(@examm_concept_id, @counseled_data_concept_id, 7);
-- Counseled for RVS question
call ensure_concept(@concept_id, 'D4E5F3F2-A290-4161-A0E8-013331B5FDB9', 'Counseled for RVS question','Counseled for RVS', 'Coded', 'Misc', false);
set @rvs_question_concept_id = @concept_id;
call ensure_concept_set_members(@counseled_data_concept_id, @rvs_question_concept_id, 1);
-- Yes
call ensure_concept(@concept_id, '17BD7650-C745-45BE-880F-FF323880DDF4', 'Yes','Yes', 'N/A', 'Misc', false);
set @yes_concept_id = @concept_id;
call ensure_concept_answer(@rvs_question_concept_id, @yes_concept_id, 1);
-- No
call ensure_concept(@concept_id, '83930A21-C3DD-400C-A24D-91A835D77FFC', 'No','No', 'N/A', 'Misc', false);
set @no_concept_id = @concept_id;
call ensure_concept_answer (@rvs_question_concept_id, @no_concept_id, 2);
-- N/A
call ensure_concept_answer (@rvs_question_concept_id, @n_a_concept_id, 3);