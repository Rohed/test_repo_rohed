SELECT 
closedate CloseDate,
client Client,
channel Channel,
platform Platform,
leadsource LeadSource,
dealname DealName,
revenue Revenue
FROM {{ref('agg_crm')}}
WHERE client = 'Greenlight Guru'
AND dealstage = 'Closed'
ORDER BY CloseDate asc