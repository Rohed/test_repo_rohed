SELECT 
client,
platform,
channel,
leadsource,
cast(date(closedate) as date) date,
count(id) deals,
sum(revenue) revenue
FROM {{ref('sf_client_clear')}}
WHERE isclosed = true
and iswon = true
group by client, platform, channel, date, leadsource
order by date asc