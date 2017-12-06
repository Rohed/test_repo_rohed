SELECT 
client,
platform,
channel,
closedate date,
count(id) deals,
sum(revenue) revenue
FROM {{ref('hubspot_client_deals_greenlight')}}
WHERE dealstage = 'Closed'
group by client, platform, channel, date
order by date asc