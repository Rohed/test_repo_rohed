SELECT 
client,
platform,
channel,
createddate date,
count(id) opportunities
FROM `agency-data-pipeline-185318`.`agency_data_pipeline`.`hubspot_client_deals_greenlight`
group by client, platform, channel, date
order by date asc