# deletes all (known) data elements for a single patient identified by its id
	
set @patientid = 7;

# obs
SET foreign_key_checks = 0;
delete from obs where person_id > @patientid and person_id not in (select person_id from users);
SET foreign_key_checks = 1;

# order
delete from drug_order where order_id in (select order_id from orders where patient_id > @patientid and patient_id not in (select person_id from users));
delete from orders where patient_id > @patientid and patient_id not in (select person_id from users);

# encounter
delete from encounter_provider where encounter_id in (select encounter_id from encounter where patient_id > @patientid and patient_id not in (select person_id from users));
delete from encounter where patient_id > @patientid and patient_id not in (select person_id from users);

# programs
delete from patient_state where patient_program_id in (select patient_program_id from patient_program where patient_id > @patientid and patient_id not in (select person_id from users));
delete from patient_program where patient_id > @patientid and patient_id not in (select person_id from users);

# visit
delete from visit_attribute where visit_id in (select visit_id from visit where patient_id > @patientid and patient_id not in (select person_id from users));
delete from visit where patient_id > @patientid and patient_id not in (select person_id from users);   

#
delete from bed_patient_assignment_map where patient_id > @patientid and patient_id not in (select person_id from users);
	
# patient
delete from patient where patient_id > @patientid and patient_id not in (select person_id from users);   
delete from patient_identifier where patient_id > @patientid and patient_id not in (select person_id from users);

# person
delete from person_name where person_id > @patientid and person_id not in (select person_id from users);  
delete from person_attribute where person_id > @patientid and person_id not in (select person_id from users);  
delete from person_address where person_id > @patientid and person_id not in (select person_id from users);
delete from person where person_id > @patientid and person_id not in (select person_id from users);


