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
impression_share_den,
warm_conversions,
hot_conversions
FROM {{ref('campaigns_urls')}} a
LEFT JOIN {{ref('ads_proc')}} b
ON ( a.campaignid = b.campaignid
	and a.date = b.date )