SELECT 
client,
FORMAT_DATE("%Y-%m", date) AS yyyymm,
data_source,
platform,
channel,
leadsource,   
sum(leads) leads,
sum(opportunities) opportunities,
sum(deals) deals,
sum(revenue) revenue
FROM {{ref('agg_crm_daily_union')}}
GROUP BY client, data_source, channel, platform, leadsource, yyyymm
ORDER BY yyyymm desc, client asc, data_source asc, platform asc, leadsource asc