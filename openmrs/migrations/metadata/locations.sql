-- This file should be used to set up all Locations in the system and to tag these Locations appropriately

-- Locations

call ensure_location('Wellbody Health Center', 'Wellbody Health Center', '88ce74ab-e0f9-11e5-be03-e82aea237783');


-- Login Locations

call ensure_location_has_tag('Wellbody Health Center', 'Login Location');
