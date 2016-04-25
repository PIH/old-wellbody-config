-- This file is used to set up PATIENT_IDENTIFIER_TYPE in the system

-- PATIENT_IDENTIFIER_TYPE
call ensure_patient_identifier_type('Wellbody ID', 'New patient identifier type created for use at Wellbody Health Center', 1, '61CA5C17-0A60-4F4C-A3A3-61E17AAF4657');

call ensure_idgen_identifier_source('61CA5C17-0A60-4F4C-A3A3-61E17AAF4657', 'WBA', 'Local identifier generator for Wellbody' ,'1234567890', '100001', 'WBA', '', 9, 9, '88ce74ab-e0f9-11e5-be03-e82aea237783');
