-- This file is used to set up PATIENT_IDENTIFIER_TYPE in the system

-- PATIENT_IDENTIFIER_TYPE
call ensure_patient_identifier_type('Bahmni Id', 'Patient identifier type for use at Wellbody Health Center', 1, '7dfc1a64-e42f-11e5-8c3e-08002715d519');

call ensure_idgen_identifier_source('7dfc1a64-e42f-11e5-8c3e-08002715d519', 'WBA', 'Local identifier generator for Wellbody' ,'1234567890', '100001', 'WBA', '', 9, 9, '88ce74ab-e0f9-11e5-be03-e82aea237783');
