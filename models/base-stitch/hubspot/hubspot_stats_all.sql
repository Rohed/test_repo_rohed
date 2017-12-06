SELECT 
client,
platform,
channel,
date,
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
leads,
opportunities,
deals,
revenue
FROM {{ref('hubspot_stats_greenlight')}}