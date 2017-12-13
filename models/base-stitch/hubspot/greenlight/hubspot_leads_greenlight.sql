SELECT 
client,
platform,
channel,
date,
leadsource,
count(id) leads
FROM {{ref('hubspot_client_leads_greenlight')}}
group by client, platform, channel, date, leadsource
order by date asc  