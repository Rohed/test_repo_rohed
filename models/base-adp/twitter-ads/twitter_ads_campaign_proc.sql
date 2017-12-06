select
date, 
account, 
channel,
platform,
url,
sum(cost) as cost,
sum(impressions) as impressions,
sum(clicks) as clicks,
sum(conversions) as conversions
from 
  ( 
SELECT  
date, 
account,
'Paid' as channel,
'Twitter Ads' as platform,
campaign as url,
max(cost) as cost, 
max(impressions) as impressions, 
max(clicks) as clicks, 
max(conversions) as conversions
FROM `agency-data-pipeline-185318.agency_data_pipeline.twitter_ads_campaign` 
where account in (select account from {{ref('accounts_proc')}} where platform = 'Twitter Ads')
and cost > 0
group by date, account, channel, platform, url
  )
group by date, account, channel, platform, url
order by account asc, date asc