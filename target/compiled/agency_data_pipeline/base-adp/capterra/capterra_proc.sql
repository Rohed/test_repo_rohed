select
date, 
account, 
channel,
platform,
'' as url,
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
'Capterra' as platform,
max(cost) as cost, 
max(impressions) as impressions, 
max(clicks) as clicks, 
max(conversions) as conversions
FROM `agency-data-pipeline-185318.agency_data_pipeline.capterra_campaign` 
where account in (select account from `agency-data-pipeline-185318`.`agency_data_pipeline`.`accounts_proc` where platform = 'Capterra')
group by date, account, channel, platform, directory, location
  )
group by date, account, channel, platform, url
order by account asc, date asc