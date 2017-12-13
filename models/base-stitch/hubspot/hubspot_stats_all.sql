SELECT 
client,
platform,
channel,
date,
leadsource,
leads,
null as opportunities,
null as deals,
null as revenue
FROM {{ref('hubspot_stats_clear')}}

UNION ALL

SELECT 
client,
platform,
channel,
date,
leadsource,
leads,
opportunities,
deals,
revenue
FROM {{ref('hubspot_stats_greenlight')}}