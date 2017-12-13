SELECT 
client,
platform,
channel,
leadsource,
date,
null as leads,
null as opportunities,
deals,
revenue
FROM 
{{ref('hubspot_deals_greenlight')}}

UNION ALL

SELECT 
client,
platform,
channel,
leadsource,
date,
null as leads,
opportunities,
null as deals,
null as revenue
FROM
{{ref('hubspot_opps_greenlight')}}

UNION ALL

SELECT
client,
platform,
channel,
leadsource,
date,
leads,
null as opportunities,
null as deals,
null as revenue
FROM
{{ref('hubspot_leads_greenlight')}}