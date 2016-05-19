-- This file is used to set up PERSON_ATTRIBUTE_TYPE in the system


-- WBA Paper ID
call ensure_person_attribute_type('WBA Paper ID', 'WBA Paper ID', 'java.lang.String', NULL, 1, 1,
    0, NULL, NULL, NULL, 1, 'ae859ec2-3ff2-4b0f-b018-abe5ab2ce3c5');

-- HIV ID
call ensure_person_attribute_type('HIV ID', 'HIV ID', 'java.lang.String', NULL, 1, 1,
    0, NULL, NULL, NULL, 2, 'FF2774A0-66BA-42E1-9C20-6F71CF4EBCA3');

-- telephoneNumber
call ensure_person_attribute_type('telephoneNumber', 'Telephone Number', 'java.lang.String', NULL, 1, 1,
    0, NULL, NULL, NULL, 3, 'f5eaf645-4c78-11e5-9192-080027b662ec');

-- Mother's Name
call ensure_person_attribute_type('primaryRelative', 'Mother\'s Name', 'java.lang.String', NULL, 1, 1,
    0, NULL, NULL, NULL, 4, 'c1f84df3-3f10-11e4-adec-0800271c1b75');


-- Occupation Coded Question -- is the 5th attribute display

-- Survivor
call ensure_concept(@concept_id, 'F0DDB66A-9BD3-4B6E-9BEC-12FD30B2D328', 'Ebola Survivor','Survivor', 'Coded', 'Test', false);
set @survivor_concept_id = @concept_id;

-- Yes
call ensure_concept(@concept_id, '17BD7650-C745-45BE-880F-FF323880DDF4', 'Yes','Yes', 'N/A', 'Misc', false);
set @yes_concept_id = @concept_id;
call ensure_concept_answer (@survivor_concept_id, @yes_concept_id, 1);
-- No
call ensure_concept(@concept_id, '83930A21-C3DD-400C-A24D-91A835D77FFC', 'No','No', 'N/A', 'Misc', false);
set @no_concept_id = @concept_id;
call ensure_concept_answer (@survivor_concept_id, @no_concept_id, 2);
-- Survivor Attribute Type
call ensure_person_attribute_type('Survivor', 'Survivor', 'org.openmrs.Concept', @survivor_concept_id, 1, 1, 0, NULL, NULL, NULL, 6, 'D3D9E005-C191-4267-8E71-8EA9F0CD36D8');

-- Survivor ID
call ensure_person_attribute_type('Survivor ID', 'Survivor ID', 'java.lang.String', NULL, 1, 1,
    0, NULL, NULL, NULL, 7, 'F21620C1-F125-430D-89F0-60D0629E9DE9');

-- Partner of Survivor
call ensure_concept(@concept_id, '229EB6C3-B298-4E68-AA97-1B49CCA627A6', 'Partner of Ebola Survivor','Partner of Survivor', 'Coded', 'Test', false);
set @partner_survivor_concept_id = @concept_id;
-- Yes
call ensure_concept_answer (@partner_survivor_concept_id, @yes_concept_id, 1);
-- No
call ensure_concept_answer (@partner_survivor_concept_id, @no_concept_id, 2);
-- Partner of Survivor Attribute Type
call ensure_person_attribute_type('Partner of survivor', 'Partner of Survivor', 'org.openmrs.Concept', @partner_survivor_concept_id, 1, 1, 0, NULL, NULL, NULL, 8, 'AF784184-C121-4140-B567-62F1E4969EA7');


-- retire givenNameLocal
call ensure_person_attribute_type('givenNameLocal', 'First name in local language', 'java.lang.String', NULL, 0, 1,
    1, 1, now(), 'remove from registration screen', 5, '7e6db4ea-e42f-11e5-8c3e-08002715d519');

-- retire familyNameLocal
call ensure_person_attribute_type('familyNameLocal', 'Family name in local language', 'java.lang.String', NULL, 0, 1,
    1, 1, now(), 'remove from registration screen', 6, '7e6f78a4-e42f-11e5-8c3e-08002715d519');

-- retire middleNameLocal
call ensure_person_attribute_type('middleNameLocal', 'Middle name in local language', 'java.lang.String', NULL, 0, 1,
    1, 1, now(), 'remove from registration screen', 7, '7e709f5b-e42f-11e5-8c3e-08002715d519');


