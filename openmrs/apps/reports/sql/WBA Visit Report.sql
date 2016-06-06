select p.Patient_id, wba.identifier,e.encounter_datetime,CONCAT(pn.given_name, ' ',pn.family_name) provider,
obsjoin.* 
from patient p
-- pull in all registration encounters
INNER JOIN encounter e ON p.patient_id = e.patient_id and e.voided = 0 AND e.encounter_type in
   (select encounter_type_id from encounter_type where name = 'REG') 
-- Most recent WBA EMR ID
INNER JOIN (SELECT patient_id, identifier, location_id FROM patient_identifier pid, patient_identifier_type pit
            WHERE pid.identifier_type = pit.patient_identifier_type_id 
            and pit.name = 'Bahmni Id'
            AND pid.voided = 0 AND pid.preferred = 1 ORDER BY pid.date_created DESC) wba ON p.patient_id = wba.patient_id
-- join in provider
INNER JOIN encounter_provider ep ON ep.encounter_id = e.encounter_id and ep.voided = 0
INNER JOIN provider pv ON pv.provider_id = ep.provider_id 
INNER JOIN person_name pn ON pn.person_id = pv.person_id and pn.voided = 0
-- join in observations
INNER JOIN
(select o.encounter_id,
group_concat(CASE when cn1.name = 'Type of Visit' then cn2.name end separator ',') 'Type_of_Visit',
max(CASE when cn1.name = 'Payment received' then cn2.name end) 'Payment_Received',
max(CASE when cn1.name = 'Payment received' then o.comments end) 'Payment_Received_comments',
max(CASE when cn1.name = 'Payment type' then cn2.name end) 'Payment_type',
max(CASE when cn1.name = 'Payment type' then o.comments end) 'Payment_type_comment',
group_concat(CASE when cn1.name = 'Patient Category' then cn2.name end separator ',' ) 'Patient_Category'
from obs o
INNER JOIN encounter e on e.encounter_id = o.encounter_id 
INNER JOIN concept_name cn1 on o.concept_id = cn1.concept_id and cn1.locale = 'en' and cn1.locale_preferred = '1'  and cn1.voided = 0
LEFT OUTER JOIN concept_name cn2 on o.value_coded = cn2.concept_id and cn2.locale = 'en' and cn2.locale_preferred = '1'  and cn2.voided = 0
where 1=1
and o.concept_id = cn1.concept_id 
AND date(e.encounter_datetime) BETWEEN '#startDate#' and '#endDate#' 
group by o.encounter_id) obsjoin on obsjoin.encounter_id = e.encounter_id
order by e.encounter_datetime ;
