SELECT
client,
canonical_vid id,
date,
leadsource,
leadstatus
FROM
(
SELECT 
'Clear Company' as client,
canonical_vid,
DATE_FROM_UNIX_DATE(case when properties.createdate.value is null then null else cast(cast(properties.createdate.value as int64)/(1000*60*60*24) as int64) end) date, 
properties.leadstatus.value leadstatus,
properties.leadsource.value leadsource,
_sdc_sequence,
first_value(_sdc_sequence) OVER (PARTITION BY canonical_vid ORDER BY _sdc_sequence DESC) lv
FROM `agency-data-pipeline-185318.hubspot_lead_clear.contacts`
where properties.leadstatus.value in ('Sales Qualified', 'Current Client')
)
where lv = _sdc_sequence
order by date desc