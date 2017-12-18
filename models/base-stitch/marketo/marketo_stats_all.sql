SELECT 
client,
platform,
channel,
date,
leadsource,
leads
FROM {{ref('marketo_stats_esub')}}