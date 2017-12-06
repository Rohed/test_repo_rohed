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
'Bing Ads' as platform,
lower(trim(regexp_replace(replace(replace(replace(replace(url,'www.',''),'http://',''),'https://',''),'.html',''),r'\?.*$',''),'/')) as url,
max(cost) as cost, 
max(impressions) as impressions, 
max(clicks) as clicks, 
max(conversions) as conversions
FROM `agency-data-pipeline-185318.agency_data_pipeline.bing_ads_ad` 
where account in (select account from `agency-data-pipeline-185318`.`agency_data_pipeline`.`accounts_proc` where platform = 'Bing Ads')
group by date, account, channel, platform, url
  )
group by date, account, channel, platform, url
order by account asc, date asc, url asc