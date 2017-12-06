select
date,
eid, 
client,
account, 
channel,
platform,
sum(cost) as cost,
sum(impressions) as impressions,
sum(clicks) as clicks,
sum(conversions) as conversions
from 
  ( 
SELECT  
parse_date("%m-%d-%Y", date) date,
eid,
'XactlyCorp' as client,
'XactlyCorp' as account,
'Paid' as channel,
'Adroll' as platform,
cost, 
paid_impressions as impressions, 
clicks, 
click_through_conversions as conversions,
_sdc_sequence,
first_value(_sdc_sequence) OVER (PARTITION BY eid ORDER BY _sdc_sequence DESC) lv
FROM `agency-data-pipeline-185318.adroll_xactly.adroll_ad_reports` 
where cost > 0
  )
where lv = _sdc_sequence
group by date, eid, client, account, channel, platform
order by account asc, date asc