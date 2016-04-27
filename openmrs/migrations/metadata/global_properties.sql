-- This file should be used to set up GLOBAL_PROPERTY in the system

-- GLOBAL_PROPERTY

call ensure_global_property('concept.reasonForDeath', 'Reasons for Death', 'Concept id of the REASON FOR DEATH Concept Set');

call ensure_global_property('emr.primaryIdentifierType', '7dfc1a64-e42f-11e5-8c3e-08002715d519', 'Primary identifier type for looking up patients, generating barcodes, etc');
