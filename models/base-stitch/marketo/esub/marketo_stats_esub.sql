SELECT 
client,
platform,
channel,
leadsource,
date,
count(leadperson) leads
FROM {{ref('marketo_client_esub')}}
group by client, platform, channel, date, leadsource
order by date asc  