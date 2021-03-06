SELECT
client,
'Salesforce' data_source,
platform,
channel,
leadsource,
date,
null as leads,
opportunities,
deals,
revenue,
null as xero_revenue
FROM 
{{ref('sf_stats_all')}}

UNION ALL

SELECT
client,
'Hubspot' data_source,
platform,
channel,
leadsource,
date,
leads,
opportunities,
deals,
revenue,
null as xero_revenue
FROM 
{{ref('hubspot_stats_all')}}

UNION ALL

SELECT 
client,
'Marketo' data_source,
platform,
channel,
leadsource,
date,
leads,
null as opportunities,
null as deals,
null as revenue,
null as xero_revenue
FROM
{{ref('marketo_stats_all')}}


UNION ALL

SELECT
client,
'Xero' data_source,
platform,
channel,
null as leadsource,
date,
null as leads,
null as opportunities,
null as deals,
null as revenue,
xero_revenue
FROM
{{ref('xero_stats_directive')}}