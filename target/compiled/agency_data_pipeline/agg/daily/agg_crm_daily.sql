SELECT 
client,
platform,
channel,
date,
sum(leads) leads,
sum(opportunities) opportunities,
sum(deals) deals,
sum(revenue) revenue,
sum(xero_revenue) xero_revenue
FROM
`agency-data-pipeline-185318`.`agency_data_pipeline`.`agg_crm_daily_union`
GROUP BY 
client,
platform,
channel,
date
ORDER BY 
client asc, platform asc, date asc