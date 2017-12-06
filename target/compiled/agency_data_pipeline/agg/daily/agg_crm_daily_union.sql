SELECT
client,
'Salesforce' data_source,
platform,
channel,
date,
null as leads,
opportunities,
deals,
revenue,
null as xero_revenue
FROM 
`agency-data-pipeline-185318`.`agency_data_pipeline`.`sf_stats_all`

UNION ALL

SELECT
client,
'Hubspot' data_source,
platform,
channel,
date,
leads,
opportunities,
deals,
revenue,
null as xero_revenue
FROM 
`agency-data-pipeline-185318`.`agency_data_pipeline`.`hubspot_stats_all`

UNION ALL

SELECT 
client,
'Marketo' data_source,
platform,
channel,
date,
leads,
null as opportunities,
null as deals,
null as revenue,
null as xero_revenue
FROM
`agency-data-pipeline-185318`.`agency_data_pipeline`.`marketo_stats_esub`


UNION ALL

SELECT
client,
'Xero' data_source,
platform,
channel,
date,
null as leads,
null as opportunities,
null as deals,
null as revenue,
xero_revenue
FROM
`agency-data-pipeline-185318`.`agency_data_pipeline`.`xero_stats_directive`