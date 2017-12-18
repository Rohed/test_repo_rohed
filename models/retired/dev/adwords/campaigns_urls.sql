select
date,
campaignid, 
client,
account, 
channel,
platform,
url,
cost,
impressions,
clicks,
conversions,
impression_share_num,
impression_share_den
FROM {{ref('campaigns_proc')}} a
LEFT JOIN {{ref('urls_proc')}} b
ON a.campaignid = b.campaignid