SELECT 
client,
platform,
channel,
cast(date(createddate) as date) date,
count(id) opportunities
FROM `agency-data-pipeline-185318`.`agency_data_pipeline`.`sf_client_clear`
group by client, platform, channel, date
order by date asc