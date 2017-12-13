SELECT 
client,
platform,
channel,
leadsource,
createddate date,
count(id) opportunities
FROM {{ref('hubspot_client_deals_greenlight')}}
group by client, platform, channel, date, leadsource
order by date asc