select
date, 
client,
account, 
channel,
platform,
url,
cost,
impressions,
clicks,
conversions
FROM {{ref('adroll_ads_report_proc_xactly')}} a
LEFT JOIN {{ref('adroll_ads_proc_xactly')}} b
ON a.eid = b.eid
