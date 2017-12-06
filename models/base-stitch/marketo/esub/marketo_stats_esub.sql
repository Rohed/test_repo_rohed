SELECT 
client,
platform,
channel,
date,
count(leadperson) leads
FROM {{ref('marketo_client_esub')}}
group by client, platform, channel, date
order by date asc  