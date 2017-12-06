SELECT 
client,
platform,
channel,
date,
count(id) leads
FROM {{ref('hubspot_client_clear')}}
group by client, platform, channel, date
order by date asc  