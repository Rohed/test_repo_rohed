select
date,
campaignid, 
client,
account, 
channel,
platform,
sum(cost) cost,
sum(impressions) impressions,
sum(clicks) clicks,
sum(conversions) conversions
sum(impression_share_num) impression_share_num,
sum(impression_share_den) impression_share_den
from 
  ( 
SELECT  
cast(day as date) date,
campaignid,
'Directive Consulting' as client,
account as account,
'Paid' as channel,
'Adwords' as platform,
cost/1000000 cost, 
impressions as impressions, 
clicks, 
conversions as conversions,
case when contentimprshare is not null then impressions as impression_share_num,
case when contentimprshare is not null then impressions/(contentimprshare/100) as impression_share_den,
_sdc_sequence,
first_value(_sdc_sequence) OVER (PARTITION BY campaignid, day ORDER BY _sdc_sequence DESC) lv
FROM `agency-data-pipeline-185318.adwords_directive.CAMPAIGN_PERFORMANCE_REPORT` 
  )
where lv = _sdc_sequence
group by date, campaignid, client, account, channel, platform
order by account asc, campaignid asc, date asc