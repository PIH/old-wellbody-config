-- This file is used to set up Reason For Visit concept_set

set @concept_id = 0;
set @answer_concept_id = 0;

-- Reason For Visit concept set
call ensure_concept(@concept_id, 'A8BD7AE5-9261-4A0C-9BD0-119B2DB43E78', 'Reason for visit','Reason for visit', 'N/A', 'Misc', true);
set @reason_for_visit_concept_id = @concept_id;

-- Patient Category Construct
call ensure_concept(@concept_id, '93549133-4b58-4c46-b2fd-166295df62ba', 'Patient category construct','Patient category', 'N/A', 'Misc', true);
set @category_construct_concept_id = @concept_id;

-- Patient Category
call ensure_concept(@concept_id, '97484123-E38C-4B37-A938-6DBB739FAF57', 'Patient category','Patient category', 'Coded', 'Question', false);
set @parent_concept_id = @concept_id;
-- add Patient Category to the Patient Category Construct
call ensure_concept_set_members(@category_construct_concept_id, @parent_concept_id, 1);

-- A - Amputee
call ensure_concept(@concept_id, 'FDCCA240-77BE-41E6-B582-1E89BF9F1041', 'A - Amputee','A - Amputee', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 1);

-- AD - Amptuee dependents
call ensure_concept(@concept_id, '6EADE631-2AE8-46A2-8BBA-6B51ED433811', 'AD - Amptuee dependents','AD - Amptuee dependents', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 2);

-- C5 - Children (0-59 months)
call ensure_concept(@concept_id, '8128EAAF-AB6F-4058-BBE4-666316971401', 'C5 - Children (0-59 months)','C5 - Children (0-59 months)', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 3);

-- C5+ - Children (5-16 years)
call ensure_concept(@concept_id, '3F0446F1-38D9-498D-BEE9-A2E5184E7031', 'C5+ - Children (5-16 years)','C5+ - Children (5-16 years)', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 4);

-- EP - Epilepsy
call ensure_concept(@concept_id, '7C020E2A-465F-487A-B688-C33721D5E434', 'EP - Epilepsy', 'EP - Epilepsy', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 5);

-- H - HIV patients
call ensure_concept(@concept_id, '1C70621C-3D73-46C9-A2A6-08DCFFA8B4B1', 'H - HIV patients', 'H - HIV patients', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 6);

-- HD - HIV dependents
call ensure_concept(@concept_id, 'B1E8D5DB-E9DD-42E4-8A3A-F511EDA7931A', 'HD - HIV dependents', 'HD - HIV dependents', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 7);

-- LM - Lactating mothers
call ensure_concept(@concept_id, 'B4FBEFC1-5ECA-434B-9985-28E8AC5BD221', 'LM - Lactating mothers', 'LM - Lactating mothers', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 8);

-- MH - Mental health
call ensure_concept(@concept_id, 'CD7A2334-338D-4A61-BCCE-4B5FAFC715B0', 'MH - Mental health', 'MH - Mental health', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 9);

-- PW - Pregnant women
call ensure_concept(@concept_id, 'FBC8C748-AC1B-4C04-A529-D95AE3AE524F', 'PW - Pregnant women', 'PW - Pregnant women', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 10);

-- S - Staff
call ensure_concept(@concept_id, '1A70F507-58C3-420C-8A4D-ED90F4054EB6', 'S - Staff', 'S - Staff', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 11);

-- SD - Staff dependents
call ensure_concept(@concept_id, '601603E3-726F-4D25-88B7-E6355B83426B', 'SD - Staff dependents', 'SD - Staff dependents', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 12);

-- TB - Tuberculosis
call ensure_concept(@concept_id, '6A37E600-59EB-4438-A4C2-B981F65066CB', 'TB - Tuberculosis', 'TB - Tuberculosis', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 13);

-- V - Vulnerable
call ensure_concept(@concept_id, 'CD647760-F6B3-4429-B79C-911112D60D82', 'V - Vulnerable', 'V - Vulnerable', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 14);

-- Other
call ensure_concept(@concept_id, '3cee7fb4-26fe-102b-80cb-0017a47871b2', 'Other','Other', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 15);

-- Type of Visit Construct
call ensure_concept(@concept_id, '09d68a0e-c4ef-4dee-bb7d-2833c98f5c36', 'Type of visit construct','Type of visit', 'N/A', 'Misc', true);
set @visit_construct_concept_id = @concept_id;
-- Type of Visit Question
call ensure_concept(@concept_id, '86a2cf11-1ea5-4b8a-9e4b-08f4cdbe1346', 'Type of visit','Type of visit', 'Coded', 'Question', false);
set @parent_concept_id = @concept_id;
-- add Type of Visit to the Type of Visit Construct
call ensure_concept_set_members(@visit_construct_concept_id, @parent_concept_id, 1);

-- ANC
call ensure_concept(@concept_id, 'cabf0c04-7d4e-4db4-921c-d5ba90f00fc9', 'ANC', 'ANC', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 1);

-- Circumcision
call ensure_concept(@concept_id, '87A1ACE2-8409-4221-AD00-358DAE1B73B9', 'Circumcision', 'Circumcision', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 2);

-- Dental
call ensure_concept(@concept_id, '4E4976DC-2C2E-4435-B628-9D58D537E2B3', 'Dental', 'Dental', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 3);

-- Epilepsy
call ensure_concept(@concept_id, '8AD611DF-9D2E-429F-9A35-93D5B9AAE6B4', 'Epilepsy', 'Epilepsy', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 4);

-- Family Planning
call ensure_concept(@concept_id, '3ced003a-26fe-102b-80cb-0017a47871b2', 'Family Planning', 'Family Planning', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 5);

-- HIV
call ensure_concept(@concept_id, '3f13b60e-5674-4a13-b5ed-5a31a62c749a', 'HIV', 'HIV', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 6);

-- Immunization
call ensure_concept(@concept_id, '199a0a09-bd4f-47b5-93fb-337cb214e693', 'Immunization', 'Immunization', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 7);

-- Malnutrition
call ensure_concept(@concept_id, '3ce1e560-26fe-102b-80cb-0017a47871b2', 'Malnutrition', 'Malnutrition', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 8);

-- Maternity/Delivery
call ensure_concept(@concept_id, 'b44e2e97-0577-4747-ae42-5ac8432729ae', 'Maternity/Delivery', 'Maternity/Delivery', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 9);

-- OPD
call ensure_concept(@concept_id, '3cdc871e-26fe-102b-80cb-0017a47871b2', 'OPD', 'OPD', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 10);

-- TB
call ensure_concept(@concept_id, '19b6e33c-a6cc-4b0e-9ad1-aa42062500e4', 'TB', 'TB', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 11);
