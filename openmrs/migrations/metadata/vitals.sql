-- This file is used to set up Vitals concept_set

set @concept_id = 0;

-- Vitals concept set
call ensure_concept(@concept_id, '80c8b161-a871-42db-a1ca-185095a1d798', 'Vitals','Vitals', 'N/A', 'Misc', true);
set @vitals_concept_id = @concept_id;

-- Add Vitals to "All Observation Templates" concept set
call ensure_concept(@concept_id, '7eb83ffc-e42f-11e5-8c3e-08002715d519', 'All Observation Templates','All Observation Templates', 'N/A', 'ConvSet', true);
set @obs_templates_concept_id = @concept_id;
call ensure_concept_set_members(@obs_templates_concept_id, @vitals_concept_id, 1);

-- Temperature Set
call ensure_concept(@concept_id, '85bfd9d5-0c3c-4e78-b55f-8467d34c005a', 'Temperature Set','Temperature', 'N/A', 'ConvSet', true);
set @temp_concept_id = @concept_id;
call ensure_concept_set_members(@vitals_concept_id, @temp_concept_id, 1);

-- Temperature Data
call ensure_concept(@concept_id, 'c37afa71-3f10-11e4-adec-0800271c1b75', 'Temperature Data','Temperature', 'N/A', 'Concept Details', true);
set @temp_data_concept_id = @concept_id;
call ensure_concept_set_members(@temp_concept_id, @temp_data_concept_id, 1);

-- Temperature
call ensure_concept(@concept_id, '3ce939d2-26fe-102b-80cb-0017a47871b2', 'Temperature','Temperature', 'Numeric', 'Test', false);
set @child_concept_id = @concept_id;
call ensure_concept_set_members(@temp_data_concept_id, @child_concept_id, 1);
call ensure_concept_numeric(@child_concept_id, NULL, NULL, 37.2, NULL, NULL, 36.5, 'C', 0, NULL);

-- Temperature Abnormal
call ensure_concept(@concept_id, 'c37c942d-3f10-11e4-adec-0800271c1b75', 'Temperature Abnormal','Temperature Abnormal', 'Boolean', 'Abnormal', false);
set @child_concept_id = @concept_id;
call ensure_concept_set_members(@temp_data_concept_id, @child_concept_id, 2);

-- Pulse Set
call ensure_concept(@concept_id, 'C485C3CF-4BEA-4389-A9C8-20111F66EAC2', 'Pulse Set','Pulse', 'N/A', 'ConvSet', true);
set @pulse_concept_id = @concept_id;
call ensure_concept_set_members(@vitals_concept_id, @pulse_concept_id, 3);

-- Pulse Data
call ensure_concept(@concept_id, '3ce93824-26fe-102b-80cb-0017a47871b2', 'Pulse Data','Pulse', 'N/A', 'Concept Details', true);
set @pulse_data_concept_id = @concept_id;
call ensure_concept_set_members(@pulse_concept_id, @pulse_data_concept_id, 1);

-- Pulse
call ensure_concept(@concept_id, 'c36bc411-3f10-11e4-adec-0800271c1b75', 'Pulse','Pulse', 'Numeric', 'Test', false);
set @child_concept_id = @concept_id;
call ensure_concept_set_members(@pulse_data_concept_id, @child_concept_id, 1);
call ensure_concept_numeric(@child_concept_id, NULL, NULL, 100, NULL, NULL, 60, '/min', 0, NULL);

-- Pulse Abnormal
call ensure_concept(@concept_id, 'c36c7c98-3f10-11e4-adec-0800271c1b75', 'Pulse Abnormal','Pulse Abnormal', 'Boolean', 'Abnormal', false);
set @child_concept_id = @concept_id;
call ensure_concept_set_members(@pulse_data_concept_id, @child_concept_id, 2);

-- Blood Pressure Set
call ensure_concept(@concept_id, 'c36d22e6-3f10-11e4-adec-0800271c1b75', 'Blood Pressure Set','Blood Pressure', 'N/A', 'ConvSet', true);
set @blood_pressure_concept_id = @concept_id;
call ensure_concept_set_members(@vitals_concept_id, @blood_pressure_concept_id, 2);

-- Systolic Data
call ensure_concept(@concept_id, 'c36ddb6d-3f10-11e4-adec-0800271c1b75', 'Systolic Data','Systolic', 'N/A', 'Concept Details', true);
set @systolic_data_concept_id = @concept_id;
call ensure_concept_set_members(@blood_pressure_concept_id, @systolic_data_concept_id, 1);

-- Systolic
call ensure_concept(@concept_id, 'c36e9c8b-3f10-11e4-adec-0800271c1b75', 'Systolic','Systolic', 'Numeric', 'Test', false);
set @child_concept_id = @concept_id;
call ensure_concept_set_members(@systolic_data_concept_id, @child_concept_id, 1);
call ensure_concept_numeric(@child_concept_id, NULL, NULL, 140, NULL, NULL, 110, 'mm Hg', 0, NULL);

-- Systolic Abnormal
call ensure_concept(@concept_id, 'c36f5a8b-3f10-11e4-adec-0800271c1b75', 'Systolic Abnormal','Systolic Abnormal', 'Boolean', 'Abnormal', false);
set @child_concept_id = @concept_id;
call ensure_concept_set_members(@systolic_data_concept_id, @child_concept_id, 2);

-- Diastolic Data
call ensure_concept(@concept_id, 'c378f635-3f10-11e4-adec-0800271c1b75', 'Diastolic Data','Diastolic', 'N/A', 'Concept Details', true);
set @diastolic_data_concept_id = @concept_id;
call ensure_concept_set_members(@blood_pressure_concept_id, @diastolic_data_concept_id, 2);

-- Diastolic
call ensure_concept(@concept_id, 'c379aa1d-3f10-11e4-adec-0800271c1b75', 'Diastolic','Diastolic', 'Numeric', 'Test', false);
set @child_concept_id = @concept_id;
call ensure_concept_set_members(@diastolic_data_concept_id, @child_concept_id, 1);
call ensure_concept_numeric(@child_concept_id, NULL, NULL, 85, NULL, NULL, 70, 'mm Hg', 0, NULL);

-- Diastolic Abnormal
call ensure_concept(@concept_id, 'c37a5735-3f10-11e4-adec-0800271c1b75', 'Diastolic Abnormal','Diastolic Abnormal', 'Boolean', 'Abnormal', false);
set @child_concept_id = @concept_id;
call ensure_concept_set_members(@diastolic_data_concept_id, @child_concept_id, 2);

-- Posture
call ensure_concept(@concept_id, 'c44c3c37-3f10-11e4-adec-0800271c1b75', 'Posture','Posture', 'Coded', 'Test', false);
set @posture_concept_id = @concept_id;
call ensure_concept_set_members(@blood_pressure_concept_id, @posture_concept_id, 3);

-- Sitting
call ensure_concept(@concept_id, 'c44cfed2-3f10-11e4-adec-0800271c1b75', 'Sitting','Sitting', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@posture_concept_id, @child_concept_id, 1);

-- Supine
call ensure_concept(@concept_id, 'c44d6b8e-3f10-11e4-adec-0800271c1b75', 'Supine','Supine', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@posture_concept_id, @child_concept_id, 2);

-- Respiratory Rate Set
call ensure_concept(@concept_id, '00ca72e2-cc86-4d36-aeb1-b90f803f6c9c', 'Respiratory Rate Set','Respiratory Rate', 'N/A', 'ConvSet', true);
set @rr_concept_id = @concept_id;
call ensure_concept_set_members(@vitals_concept_id, @rr_concept_id, 4);

--  Respiratory Rate Data
call ensure_concept(@concept_id, '1ed7b7d0-b09d-4b24-8f27-22c816c5ac06', 'Respiratory Rate Data','Respiratory Rate', 'N/A', 'Concept Details', true);
set @rr_data_concept_id = @concept_id;
call ensure_concept_set_members(@rr_concept_id, @rr_data_concept_id, 1);

--  Respiratory Rate 
call ensure_concept(@concept_id, '3ceb11f8-26fe-102b-80cb-0017a47871b2', 'Respiratory Rate','Respiratory Rate', 'Numeric', 'Test', false);
set @child_concept_id = @concept_id;
call ensure_concept_set_members(@rr_data_concept_id, @child_concept_id, 1);
call ensure_concept_numeric(@child_concept_id, NULL, NULL, 18, NULL, NULL, 12, '/min', 0, NULL);

-- Respiratory Rate Abnormal
call ensure_concept(@concept_id, 'ab33bc98-ac76-4c5d-8c51-579dc06ce657', 'Respiratory Rate Abnormal','Respiratory Rate Abnormal', 'Boolean', 'Abnormal', false);
set @child_concept_id = @concept_id;
call ensure_concept_set_members(@rr_data_concept_id, @child_concept_id, 2);

-- Blood Oxygen Set
call ensure_concept(@concept_id, '54cf74db-fad6-4a7d-bfe2-750424727f90', 'Blood Oxygen Set','Blood Oxygen', 'N/A', 'ConvSet', true);
set @oxygen_concept_id = @concept_id;
call ensure_concept_set_members(@vitals_concept_id, @oxygen_concept_id, 5);

--  Blood Oxygen Data
call ensure_concept(@concept_id, 'd4aaacd9-de67-4187-be85-849e303a3363', 'Oxygen Saturation Data','Oxygen Saturation', 'N/A', 'Concept Details', true);
set @oxygen_data_concept_id = @concept_id;
call ensure_concept_set_members(@oxygen_concept_id, @oxygen_data_concept_id, 1);

--  Oxygen Saturation 
call ensure_concept(@concept_id, '075c2485-ea84-4e3b-8df8-638ef18edf41', 'Oxygen Saturation Set','Oxygen Saturation', 'Numeric', 'Test', false);
set @child_concept_id = @concept_id;
call ensure_concept_set_members(@oxygen_data_concept_id, @child_concept_id, 1);
call ensure_concept_numeric(@child_concept_id, NULL, NULL, 100, NULL, NULL, 97, '%', 0, NULL);

-- Oxygen Saturation Abnormal
call ensure_concept(@concept_id, '2cf2580f-ab29-4f58-951b-8dd2613ce091', 'Oxygen Saturation Abnormal','Oxygen Saturation Abnormal', 'Boolean', 'Abnormal', false);
set @child_concept_id = @concept_id;
call ensure_concept_set_members(@oxygen_data_concept_id, @child_concept_id, 2);

-- Weight Set
call ensure_concept(@concept_id, '7d52a2de-080a-43be-858a-377ebffacb34', 'Weight Set','Weight', 'N/A', 'ConvSet', true);
set @weight_concept_id = @concept_id;
call ensure_concept_set_members(@vitals_concept_id, @weight_concept_id, 6);

--  Weight Data
call ensure_concept(@concept_id, '7d308557-5cb9-4bc4-9827-2d55dc8edfd6', 'Weight Data','Weight', 'N/A', 'Concept Details', true);
set @weight_data_concept_id = @concept_id;
call ensure_concept_set_members(@weight_concept_id, @weight_data_concept_id, 1);

--  Weight
call ensure_concept(@concept_id, '3ce93b62-26fe-102b-80cb-0017a47871b2', 'Weight','Weight', 'Numeric', 'Test', false);
set @child_concept_id = @concept_id;
call ensure_concept_set_members(@weight_data_concept_id, @child_concept_id, 1);
call ensure_concept_numeric(@child_concept_id, NULL, NULL, 140, NULL, NULL, NULL, 'kg', 0, NULL);

-- Weight Abnormal
call ensure_concept(@concept_id, '74c42c16-a8f9-4ce7-80ad-a0ec0184df6f', 'Weight Abnormal','Weight Abnormal', 'Boolean', 'Abnormal', false);
set @child_concept_id = @concept_id;
call ensure_concept_set_members(@weight_data_concept_id, @child_concept_id, 2);

