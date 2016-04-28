-- This file is used to set up PERSON_ATTRIBUTE_TYPE in the system


-- telephoneNumber
call ensure_person_attribute_type('telephoneNumber', 'Telephone Number', 'java.lang.String', NULL, 1, 1,
    0, NULL, NULL, NULL, 'f5eaf645-4c78-11e5-9192-080027b662ec');

-- Mother's Name
call ensure_person_attribute_type('primaryRelative', 'Mother\'s Name', 'java.lang.String', NULL, 1, 1,
    0, NULL, NULL, NULL, 'c1f84df3-3f10-11e4-adec-0800271c1b75');

-- WBA Paper ID
call ensure_person_attribute_type('WBA Paper ID', 'WBA Paper ID', 'java.lang.String', NULL, 1, 1,
    0, NULL, NULL, NULL, 'ae859ec2-3ff2-4b0f-b018-abe5ab2ce3c5');

-- givenNameLocal
call ensure_person_attribute_type('givenNameLocal', 'First name in local language', 'java.lang.String', NULL, 0, 1,
    1, 1, now(), 'remove from registration screen', '7e6db4ea-e42f-11e5-8c3e-08002715d519');

-- familyNameLocal
call ensure_person_attribute_type('familyNameLocal', 'Family name in local language', 'java.lang.String', NULL, 0, 1,
    1, 1, now(), 'remove from registration screen', '7e6f78a4-e42f-11e5-8c3e-08002715d519');

-- middleNameLocal
call ensure_person_attribute_type('middleNameLocal', 'Middle name in local language', 'java.lang.String', NULL, 0, 1,
    1, 1, now(), 'remove from registration screen', '7e709f5b-e42f-11e5-8c3e-08002715d519');


