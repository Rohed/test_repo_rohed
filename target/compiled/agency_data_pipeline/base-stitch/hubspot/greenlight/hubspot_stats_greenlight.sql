SELECT 
client,
platform,
channel,
date,
null as leads,
null as opportunities,
deals,
revenue
FROM 
`agency-data-pipeline-185318`.`agency_data_pipeline`.`hubspot_deals_greenlight`

UNION ALL

SELECT 
client,
platform,
channel,
date,
null as leads,
opportunities,
null as deals,
null as revenue
FROM
`agency-data-pipeline-185318`.`agency_data_pipeline`.`hubspot_opps_greenlight`

UNION ALL

SELECT
client,
platform,
channel,
date,
leads,
null as opportunities,
null as deals,
null as revenue
FROM
`agency-data-pipeline-185318`.`agency_data_pipeline`.`hubspot_leads_greenlight`