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
'Software Advice' as platform,
max(cost) as cost, 
null as impressions, 
null as clicks, 
max(conversions) as conversions
FROM `agency-data-pipeline-185318.agency_data_pipeline.software_advice_campaign` 
where account in (select account from {{ref('accounts_proc')}} where platform = 'Software Advice')
and company != cast(cost as string)
and conversions = 1 
group by date, account, channel, platform, company
  )
group by date, account, channel, platform
order by account asc, date asc