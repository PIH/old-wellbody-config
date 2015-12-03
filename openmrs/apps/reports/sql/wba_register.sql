-- get list of all patients
-- TODO: handle voided/retired

select 
p.patient_id as internal_id,
(select pi.identifier from patient_identifier pi where pi.patient_id = p.patient_id and pi.identifier_type = 3) as id,
p.date_created,
(select concat(pn.given_name, ' ', pn.family_name) from person_name pn where pn.person_id = p.patient_id) as name,
(select person.gender from person where person.person_id = p.patient_id)as gender,
(select person.birthdate from person where person_id = p.patient_id) as birth_date,
(select person.death_date from person where person.person_id = p.patient_id) as death_date,
(select pa.country from person_address pa where pa.person_id = p.patient_id) as country,
(select pa.state_province from person_address pa where pa.person_id = p.patient_id) as district,
(select pa.address2 from person_address pa where pa.person_id = p.patient_id) as chiefdom,
(select pa.city_village from person_address pa where pa.person_id = p.patient_id) as village,
(select pa.address1 from person_address pa where pa.person_id = p.patient_id) as address,
(select pa.value from person_attribute pa where pa.person_id = p.patient_id and pa.person_attribute_type_id = 28) as paper_id,
(select cn.name from concept_name cn, person_attribute pa where pa.person_id = p.patient_id and pa.person_attribute_type_id = 14 and cn.concept_id = pa.value and concept_name_type='FULLY_SPECIFIED') as occupation,
1
from
patient p
where p.date_created BETWEEN '#startDate#' and '#endDate#'
order by p.date_created;