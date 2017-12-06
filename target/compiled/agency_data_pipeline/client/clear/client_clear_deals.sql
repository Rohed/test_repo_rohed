SELECT 
closedate CloseDate,
client Client,
channel Channel,
platform Platform,
leadsource LeadSource,
dealname DealName,
revenue Revenue
FROM `agency-data-pipeline-185318`.`agency_data_pipeline`.`agg_crm`
WHERE client = 'Clear Company'
AND dealstage = 'Closed'
ORDER BY CloseDate asc