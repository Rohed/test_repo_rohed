SELECT  
client,
channel,
platform,
date,
sum(revenue) xero_revenue
FROM {{ref('xero_proc_directive')}}
group by client, channel, platform, date
order by client asc, date asc