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
site as account,
'Organic' as channel,
'Organic' as platform,
lower(trim(regexp_replace(replace(replace(replace(replace(url,'www.',''),'http://',''),'https://',''),'.html',''),r'\?.*$',''),'/')) as url,
0.00 as cost, 
max(impressions) as impressions, 
max(clicks) as clicks, 
0 as conversions
FROM `agency-data-pipeline-185318.agency_data_pipeline.search_console_landing_page`
where site in (select account from {{ref('accounts_proc')}} where platform = 'Organic')
group by date, account, channel, platform, url
  ) 
group by date, account, channel, platform, url
order by account asc, date asc, url asc