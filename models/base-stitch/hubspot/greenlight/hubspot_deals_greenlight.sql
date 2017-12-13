SELECT 
client,
platform,
channel,
leadsource,
closedate date,
count(id) deals,
sum(revenue) revenue
FROM {{ref('hubspot_client_deals_greenlight')}}
WHERE dealstage = 'Closed'
group by client, platform, channel, date, leadsource
order by date asc