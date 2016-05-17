-- This file is used to set up History and Examination concept_set

set @concept_id = 0;

-- History and Examination concept set
call ensure_concept(@concept_id, 'c393fd1d-3f10-11e4-adec-0800271c1b75', 'History and Examination','History and Examination', 'N/A', 'Misc', true);
set @h_e_concept_id = @concept_id;

-- Add "History and Examination" to "All Observation Templates" concept set
call ensure_concept(@concept_id, '7eb83ffc-e42f-11e5-8c3e-08002715d519', 'All Observation Templates','All Observation Templates', 'N/A', 'ConvSet', true);
set @obs_templates_concept_id = @concept_id;
call ensure_concept_set_members(@obs_templates_concept_id, @h_e_concept_id, 4);

-- Chief Complaint Data
call ensure_concept(@concept_id, 'c3949eb6-3f10-11e4-adec-0800271c1b75', 'Chief Complaint Data','Chief Complaint', 'N/A', 'Concept Details', true);
set @chief_complaint_data_concept_id = @concept_id;
call ensure_concept_set_members(@h_e_concept_id, @chief_complaint_data_concept_id, 1);

-- Chief Complaint
call ensure_concept(@concept_id, 'c3959ab5-3f10-11e4-adec-0800271c1b75', 'Chief Complaint','Chief Complaint', 'Coded', 'Misc', false);
set @chief_complaint_concept_id = @concept_id;
call ensure_concept_set_members(@chief_complaint_data_concept_id, @chief_complaint_concept_id, 1);

-- Abdominal Pain
call ensure_concept(@concept_id, '1dfb0948-4e15-11e4-8a57-0800271c1b75', 'Abdominal Pain','Abdominal Pain', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@chief_complaint_concept_id, @child_concept_id, 1);

-- Chest Pain
call ensure_concept(@concept_id, '1e0f4158-4e15-11e4-8a57-0800271c1b75', 'Chest Pain','Chest Pain', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@chief_complaint_concept_id, @child_concept_id, 2);

-- Non-Coded Chief Complaint
call ensure_concept(@concept_id, 'c3966752-3f10-11e4-adec-0800271c1b75', 'Non-Coded Chief Complaint','Non-Coded Chief Complaint', 'Text', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_set_members(@chief_complaint_data_concept_id, @child_concept_id, 2);

-- Chief Complaint Duration
call ensure_concept(@concept_id, 'c3975851-3f10-11e4-adec-0800271c1b75', 'Chief Complaint Duration','Chief Complaint Duration', 'Numeric', 'Duration', false);
set @child_concept_id = @concept_id;
call ensure_concept_set_members(@chief_complaint_data_concept_id, @child_concept_id, 3);
call ensure_concept_numeric(@child_concept_id, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);

