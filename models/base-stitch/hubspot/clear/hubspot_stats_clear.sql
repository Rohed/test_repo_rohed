SELECT 
client,
platform,
channel,
leadsource,
date,
count(id) leads
FROM {{ref('hubspot_client_clear')}}
group by client, platform, channel, date, leadsource
order by date asc  