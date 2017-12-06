SELECT 
client,
platform,
channel,
createddate date,
count(id) opportunities
FROM {{ref('hubspot_client_deals_greenlight')}}
group by client, platform, channel, date
order by date asc