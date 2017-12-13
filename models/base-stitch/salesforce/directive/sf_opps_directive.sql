SELECT 
client,
platform,
channel,
leadsource,
cast(date(createddate) as date) date,
count(id) opportunities
FROM {{ref('sf_client_directive')}}
group by client, platform, channel, date, leadsource
order by date asc