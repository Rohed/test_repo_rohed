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
'FB Ads' as platform,
lower(trim(regexp_replace(replace(replace(replace(replace(url,'www.',''),'http://',''),'https://',''),'.html',''),r'\?.*$',''),'/')) as url,
max(spend) as cost, 
max(impressions) as impressions, 
max(clicks) as clicks, 
max(conversions) as conversions
FROM `agency-data-pipeline-185318.agency_data_pipeline.fb_ads_campaign`
where account in (select account from {{ref('accounts_proc')}} where platform = 'FB Ads')
group by date, account, channel, platform, url, campaign, utm_tags
  )
group by date, account, channel, platform, url
order by account asc, date asc, url asc