SELECT 
client,
platform,
channel,
cast(date(closedate) as date) date,
count(id) deals,
sum(revenue) revenue
FROM {{ref('sf_client_directive')}}
WHERE isclosed = true
and iswon = true
group by client, platform, channel, date
order by date asc