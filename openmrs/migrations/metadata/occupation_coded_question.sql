-- This file is used to set up Occupation coded question concept

set @concept_id = 0;
set @answer_concept_id = 0;
set @concept_name_short_id = 0;
set @concept_name_full_id = 0;

-- Occupation Coded Question
call ensure_concept(@concept_id, '3cd97286-26fe-102b-80cb-0017a47871b2', 'Occupation','Occupation', 'Coded', 'Question', false);
set @parent_concept_id = @concept_id;

-- Occupation Person Attribute Type
call ensure_person_attribute_type('occupation', 'Occupation', 'org.openmrs.Concept', @parent_concept_id, 1, 1, 0, NULL, NULL, NULL, 5, 'c1f7d1f1-3f10-11e4-adec-0800271c1b75');


-- Commercial bike rider
call ensure_concept(@concept_id, 'EAC97EE3-5059-4533-B544-6BC01218A6E9', 'Commercial bike rider','Commercial bike rider', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 1);

-- Driver
call ensure_concept(@concept_id, 'f15d07f0-be62-44d4-89ef-0e17e0aa480e', 'Driver','Driver', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 2);

-- Farmer
call ensure_concept(@concept_id, '3cd9757e-26fe-102b-80cb-0017a47871b2', 'Farmer','Farmer', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 3);

-- Health Worker
call ensure_concept(@concept_id, '3cdbc91e-26fe-102b-80cb-0017a47871b2', 'Health care worker','Health care worker', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 4);

-- Housewife
call ensure_concept(@concept_id, '3cda14e8-26fe-102b-80cb-0017a47871b2', 'Housewife','Housewife', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 5);

-- Military
call ensure_concept(@concept_id, '034BCF1B-1D5A-4D80-87D3-35E440081A34', 'Military','Military', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 6);

-- Miner
call ensure_concept(@concept_id, '3cdcbd06-26fe-102b-80cb-0017a47871b2', 'Miner','Miner', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 7);

-- Pensioneer
call ensure_concept(@concept_id, '3ce4113c-26fe-102b-80cb-0017a47871b2', 'Pensioneer','Pensioneer', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 8);

-- Police
call ensure_concept(@concept_id, 'a1e44baf-c82f-4d4f-ac09-232da84c8a28', 'Police','Police', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 9);

-- Student
call ensure_concept(@concept_id, '3cd976f0-26fe-102b-80cb-0017a47871b2', 'Student','Student', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 10);

-- Teacher
call ensure_concept(@concept_id, 'd192f132-999a-4666-8725-028f9fcb8df4', 'Teacher','Teacher', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 11);

-- Trader
call ensure_concept(@concept_id, '3cd9740c-26fe-102b-80cb-0017a47871b2', 'Trader','Trader', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 12);

-- Other
call ensure_concept(@concept_id, '3cee7fb4-26fe-102b-80cb-0017a47871b2', 'Other','Other', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 13);
