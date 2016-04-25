-- This file should be used to set up GLOBAL_PROPERTY in the system

-- GLOBAL_PROPERTY

call ensure_global_property('concept.reasonForDeath', 'Reasons for Death', 'Concept id of the REASON FOR DEATH Concept Set');

call ensure_global_property('emr.primaryIdentifierType', '61CA5C17-0A60-4F4C-A3A3-61E17AAF4657', 'Primary identifier type for looking up patients, generating barcodes, etc');
