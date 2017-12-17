SELECT 
closedate CloseDate,
client Client,
channel Channel,
platform Platform,
leadsource LeadSource,
dealname DealName,
revenue Revenue
FROM {{ref('agg_crm')}}
WHERE client = 'Clear Company'
AND dealstage like '%Won%'
ORDER BY CloseDate asc