SELECT 
client,
platform,
channel,
date,
count(id) leads
FROM `agency-data-pipeline-185318`.`agency_data_pipeline`.`hubspot_client_leads_greenlight`
group by client, platform, channel, date
order by date asc