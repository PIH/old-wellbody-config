select p.Patient_id, p.date_created, 
wba.identifier,
pn.given_name,
pn.family_name,
prs.gender,
prs.birthdate,
prs.birthdate_estimated,
padd.country "Country",
padd.STATE_PROVINCE "District",
padd.COUNTY_DISTRICT "Chiefdom",
padd.CITY_VILLAGE "Section",
padd.ADDRESS1 "Village",
padd.ADDRESS2 "Street Address/Landmark",
attributesjoin.*,
prs.dead,
prs.death_date,
prs.cause_of_death
from patient p
INNER JOIN person prs on prs.person_id = p.patient_id
INNER JOIN person_name pn on pn.person_id = p.patient_id
-- Most recent WBA EMR ID
INNER JOIN (SELECT patient_id, identifier, location_id FROM patient_identifier pid, patient_identifier_type pit
            WHERE pid.identifier_type = pit.patient_identifier_type_id 
            and pit.name = 'Bahmni Id'
            AND pid.voided = 0 AND pid.preferred = 1 ORDER BY pid.date_created DESC) wba ON p.patient_id = wba.patient_id
LEFT OUTER JOIN person_address padd on padd.person_id = p.patient_id and padd.preferred = 1 and padd.voided = 0
-- join in all person attributes
INNER JOIN
(select p.patient_id,
max(CASE when pat.name = 'WBA Paper ID' then pa.value end) 'WBA_Paper_ID',
max(CASE when pat.name = 'telephoneNumber' then pa.value end) 'Telephone Number',
max(CASE when pat.name = 'primaryRelative' then pa.value end) 'Primary Relative',
max(CASE when pat.name = 'HIV ID' then pa.value end) 'HIV_ID',
max(CASE when pat.name = 'occupation' then cn.name end) 'Occupation',
max(CASE when pat.name = 'Partner of survivor' then cn.name end) 'Partner_of_survivor',
max(CASE when pat.name = 'Survivor' then cn.name end) 'Survivor',
max(CASE when pat.name = 'Survivor ID' then pa.value end) 'Survivor_ID'
from patient p
left outer join person_attribute pa on pa.person_id = p.patient_id
left outer join person_attribute_type pat ON pat.person_attribute_type_id = pa.person_attribute_type_id 
LEFT OUTER JOIN concept_name cn on pa.value = cn.concept_id and cn.locale = 'en' and cn.locale_preferred = '1'  and cn.voided = 0
group by p.patient_id) attributesjoin on attributesjoin.patient_id = p.patient_id
where 1=1
AND date(p.date_created) BETWEEN '#startDate#' and '#endDate#'
order by p.date_created
;

