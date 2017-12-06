SELECT
client,
date,
leadsource,
leadperson
FROM (

SELECT 
'eSub' as client,
leadperson,
cast(date(createdat) as date) date,
leadstatus, 
leadsource,  
_sdc_sequence,
first_value(_sdc_sequence) OVER (PARTITION BY leadperson ORDER BY _sdc_sequence DESC) lv
FROM `agency-data-pipeline-185318.marketo_lead_esub.leads`
WHERE leadstatus = 'Converted'
OR leadstatus like '%QL%'
)
WHERE lv = _sdc_sequence
order by date desc