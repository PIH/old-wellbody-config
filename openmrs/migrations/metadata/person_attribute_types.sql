-- This file is used to set up PERSON_ATTRIBUTE_TYPE in the system


-- telephoneNumber
call ensure_person_attribute_type('Telephone Number', 'Telephone Number', 'java.lang.String', NULL, 0, 1,
    0, NULL, NULL, NULL, 'f5eaf645-4c78-11e5-9192-080027b662ec');

-- givenNameLocal
call ensure_person_attribute_type('givenNameLocal', 'First name in local language', 'java.lang.String', NULL, 0, 1,
    1, 1, now(), 'remove from registration screen', '7e6db4ea-e42f-11e5-8c3e-08002715d519');

-- familyNameLocal
call ensure_person_attribute_type('familyNameLocal', 'Family name in local language', 'java.lang.String', NULL, 0, 1,
    1, 1, now(), 'remove from registration screen', '7e6f78a4-e42f-11e5-8c3e-08002715d519');

-- middleNameLocal
call ensure_person_attribute_type('middleNameLocal', 'Middle name in local language', 'java.lang.String', NULL, 0, 1,
    1, 1, now(), 'remove from registration screen', '7e709f5b-e42f-11e5-8c3e-08002715d519');


