SELECT *
FROM 
  `agency-data-pipeline-185318`.`agency_data_pipeline`.`adwords_ad_proc`
 UNION ALL

SELECT *
FROM 
  `agency-data-pipeline-185318`.`agency_data_pipeline`.`bing_ads_ad_proc`
UNION ALL  

SELECT *
FROM 
  `agency-data-pipeline-185318`.`agency_data_pipeline`.`capterra_proc`
UNION ALL  

SELECT *
FROM  
  `agency-data-pipeline-185318`.`agency_data_pipeline`.`fb_ads_campaign_proc`
UNION ALL  

SELECT *
FROM  
  `agency-data-pipeline-185318`.`agency_data_pipeline`.`linkedin_ads_campaign_proc`

UNION ALL  

SELECT *
FROM  
  `agency-data-pipeline-185318`.`agency_data_pipeline`.`twitter_ads_campaign_proc`

UNION ALL

SELECT *
FROM  
  `agency-data-pipeline-185318`.`agency_data_pipeline`.`search_console_proc`

UNION ALL

SELECT *
FROM  
  `agency-data-pipeline-185318`.`agency_data_pipeline`.`software_advice_campaign_proc`

UNION ALL

SELECT *
FROM  
  `agency-data-pipeline-185318`.`agency_data_pipeline`.`software_advice_campaign_proc`  

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
  `agency-data-pipeline-185318`.`agency_data_pipeline`.`adroll_ads_proc`