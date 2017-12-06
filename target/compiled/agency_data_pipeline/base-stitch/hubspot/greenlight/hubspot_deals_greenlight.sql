SELECT 
client,
platform,
channel,
closedate date,
count(id) deals,
sum(revenue) revenue
FROM `agency-data-pipeline-185318`.`agency_data_pipeline`.`hubspot_client_deals_greenlight`
WHERE dealstage = 'Closed'
group by client, platform, channel, date
order by date asc