SELECT 
client,
platform,
channel,
cast(date(createddate) as date) date,
count(id) opportunities
FROM {{ref('sf_client_directive')}}
group by client, platform, channel, date
order by date asc