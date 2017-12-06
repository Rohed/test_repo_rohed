SELECT 
closedate CloseDate,
client Client,
channel Channel,
platform Platform,
leadsource LeadSource,
dealname DealName,
revenue Revenue
FROM {{ref('agg_crm')}}
WHERE client = 'eSub'
AND isclosed = true
AND iswon = true
ORDER BY CloseDate asc