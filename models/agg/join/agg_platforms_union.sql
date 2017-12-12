SELECT *
FROM 
  {{ref('adwords_ad_proc')}}
 UNION ALL

SELECT *
FROM 
  {{ref('bing_ads_ad_proc')}}
UNION ALL  

SELECT *
FROM 
  {{ref('capterra_proc')}}
UNION ALL  

SELECT *
FROM  
  {{ref('fb_ads_campaign_proc')}}
UNION ALL  

SELECT *
FROM  
  {{ref('linkedin_ads_campaign_proc')}}

UNION ALL  

SELECT *
FROM  
  {{ref('twitter_ads_campaign_proc')}}

UNION ALL

SELECT *
FROM  
  {{ref('search_console_proc')}}

UNION ALL

SELECT *
FROM  
  {{ref('software_advice_campaign_proc')}}

UNION ALL

SELECT 
date, 
account, 
channel,
platform,
url,
cost,
impressions,
clicks,
conversions
FROM  
  {{ref('adroll_ads_proc')}}    