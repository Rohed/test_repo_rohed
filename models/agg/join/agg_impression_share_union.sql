SELECT 
  date,
  account,
  channel,
  platform,
  impressions,
  available_impressions,
  case when available_impressions > 0 then impressions/available_impressions else 0 end as impression_share
FROM   
{{ref('adwords_impression_share_proc')}}

UNION ALL

SELECT 
  date,
  account,
  channel,
  platform,
  impressions,
  available_impressions,
  case when available_impressions > 0 then impressions/available_impressions else 0 end as impression_share
FROM
{{ref('bing_ads_impression_share_proc')}}