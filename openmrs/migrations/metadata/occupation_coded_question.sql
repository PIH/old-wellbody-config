-- This file is used to set up additional CONCEPT in the system

set @concept_id = 0;
set @answer_concept_id = 0;
set @concept_name_short_id = 0;
set @concept_name_full_id = 0;

-- Occupation Coded Question
call ensure_concept(@concept_id, '3cd97286-26fe-102b-80cb-0017a47871b2', 'Occupation','Occupation', 'Coded', 'Question', false);
set @parent_concept_id = @concept_id;

-- Occupation Person Attribute Type
call ensure_person_attribute_type('occupation', 'Occupation', 'org.openmrs.Concept', @parent_concept_id, 1, 1, 0, NULL, NULL, NULL, 'c1f7d1f1-3f10-11e4-adec-0800271c1b75');

-- Farmer
call ensure_concept(@concept_id, '3cd9757e-26fe-102b-80cb-0017a47871b2', 'Farmer','Farmer', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 1);
-- Trader
call ensure_concept(@concept_id, '3cd9740c-26fe-102b-80cb-0017a47871b2', 'Trader','Trader', 'N/A', 'Misc', false);
set @child_concept_id = @concept_id;
call ensure_concept_answer (@parent_concept_id, @child_concept_id, 1);



