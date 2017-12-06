SELECT 
client,
platform,
channel,
date,
count(leadperson) leads
FROM `agency-data-pipeline-185318`.`agency_data_pipeline`.`marketo_client_esub`
group by client, platform, channel, date
order by date asc