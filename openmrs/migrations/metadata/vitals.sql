-- This file is used to set up Vitals concept_set

set @concept_id = 0;

-- Vitals concept set
call ensure_concept(@concept_id, '80c8b161-a871-42db-a1ca-185095a1d798', 'Vitals','Vitals', 'N/A', 'Misc', true);
set @vitals_concept_id = @concept_id;

-- Add Vitals to "All Observation Templates" concept set
call ensure_concept(@concept_id, '7eb83ffc-e42f-11e5-8c3e-08002715d519', 'All Observation Templates','All Observation Templates', 'N/A', 'ConvSet', true);
set @obs_templates_concept_id = @concept_id;
call ensure_concept_set_members(@obs_templates_concept_id, @vitals_concept_id, 1);

-- Temperature Construct
call ensure_concept(@concept_id, '85bfd9d5-0c3c-4e78-b55f-8467d34c005a', 'Temperature','Temperature', 'N/A', 'ConvSet', true);
set @temp_concept_id = @concept_id;
call ensure_concept_set_members(@vitals_concept_id, @temp_concept_id, 1);

-- Temperature Data
call ensure_concept(@concept_id, 'c37afa71-3f10-11e4-adec-0800271c1b75', 'Temperature Data','Temperature', 'N/A', 'Concept Details', true);
set @temp_data_concept_id = @concept_id;
call ensure_concept_set_members(@temp_concept_id, @temp_data_concept_id, 1);

-- Temperature
call ensure_concept(@concept_id, '3ce939d2-26fe-102b-80cb-0017a47871b2', 'Temperature','Temperature', 'Numeric', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_set_members(@temp_data_concept_id, @child_concept_id, 1);
call ensure_concept_numeric(@child_concept_id, NULL, NULL, 98.8, NULL, NULL, 98.4, 'C', 0, NULL);

-- Temperature Abnormal
call ensure_concept(@concept_id, 'c37c942d-3f10-11e4-adec-0800271c1b75', 'Temperature Abnormal','Temperature Abnormal', 'Boolean', 'Abnormal', false);
set @child_concept_id = @concept_id;
call ensure_concept_set_members(@temp_data_concept_id, @child_concept_id, 2);

-- Pulse
call ensure_concept(@concept_id, 'C485C3CF-4BEA-4389-A9C8-20111F66EAC2', 'Pulse','Pulse', 'N/A', 'ConvSet', true);
set @pulse_concept_id = @concept_id;
call ensure_concept_set_members(@vitals_concept_id, @pulse_concept_id, 1);

-- Pulse Data
call ensure_concept(@concept_id, '3ce93824-26fe-102b-80cb-0017a47871b2', 'Pulse Data','Pulse', 'N/A', 'Concept Details', true);
set @pulse_data_concept_id = @concept_id;
call ensure_concept_set_members(@pulse_concept_id, @pulse_data_concept_id, 1);

-- Pulse
call ensure_concept(@concept_id, 'c36bc411-3f10-11e4-adec-0800271c1b75', 'Pulse','Pulse', 'Numeric', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_set_members(@pulse_data_concept_id, @child_concept_id, 1);
call ensure_concept_numeric(@child_concept_id, NULL, NULL, 100, NULL, NULL, 60, '/min', 0, NULL);

-- Pulse Abnormal
call ensure_concept(@concept_id, 'c36c7c98-3f10-11e4-adec-0800271c1b75', 'Pulse Abnormal','Pulse Abnormal', 'Boolean', 'Abnormal', false);
set @child_concept_id = @concept_id;
call ensure_concept_set_members(@pulse_data_concept_id, @child_concept_id, 2);

-- Blood Pressure
call ensure_concept(@concept_id, 'c36d22e6-3f10-11e4-adec-0800271c1b75', 'Blood Pressure','Blood Pressure', 'N/A', 'ConvSet', true);
set @blood_pressure_concept_id = @concept_id;
call ensure_concept_set_members(@vitals_concept_id, @blood_pressure_concept_id, 2);

-- Systolic Data
call ensure_concept(@concept_id, 'c36ddb6d-3f10-11e4-adec-0800271c1b75', 'Systolic Data','Systolic', 'N/A', 'Concept Details', true);
set @systolic_data_concept_id = @concept_id;
call ensure_concept_set_members(@blood_pressure_concept_id, @systolic_data_concept_id, 1);

-- Systolic
call ensure_concept(@concept_id, 'c36e9c8b-3f10-11e4-adec-0800271c1b75', 'Systolic','Systolic', 'Numeric', 'Misc', false);
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
call ensure_concept(@concept_id, 'c379aa1d-3f10-11e4-adec-0800271c1b75', 'Diastolic','Diastolic', 'Numeric', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_set_members(@diastolic_data_concept_id, @child_concept_id, 1);
call ensure_concept_numeric(@child_concept_id, NULL, NULL, 85, NULL, NULL, 70, 'mm Hg', 0, NULL);

-- Diastolic Abnormal
call ensure_concept(@concept_id, 'c37a5735-3f10-11e4-adec-0800271c1b75', 'Diastolic Abnormal','Diastolic Abnormal', 'Boolean', 'Abnormal', false);
set @child_concept_id = @concept_id;
call ensure_concept_set_members(@diastolic_data_concept_id, @child_concept_id, 2);

-- Posture
call ensure_concept(@concept_id, 'c44c3c37-3f10-11e4-adec-0800271c1b75', 'Posture','Posture', 'Coded', 'Misc', false);
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


