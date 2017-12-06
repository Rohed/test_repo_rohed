SELECT 
client,
platform,
channel,
date,
leads,
null as opportunities,
null as deals,
null as revenue
FROM `agency-data-pipeline-185318`.`agency_data_pipeline`.`hubspot_stats_clear`

UNION ALL

SELECT 
client,
platform,
channel,
date,
leads,
opportunities,
deals,
revenue
FROM `agency-data-pipeline-185318`.`agency_data_pipeline`.`hubspot_stats_greenlight`