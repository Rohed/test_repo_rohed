with __dbt__CTE__ga_adwords as (
SELECT 
coalesce(ga.date, p.date) date, 
coalesce(ga.account, p.account) lookup_account, 
ga.account ga_account, 
p.account p_account,
coalesce(ga.channel, p.channel) channel,
coalesce(ga.platform, p.platform) platform,
case when p.account is null then 'Google Analytics' else p.platform end lookup_platform,
coalesce(ga.url, p.url) url,
sum(p.cost) as cost,
sum(p.impressions) as impressions,
sum(p.clicks) as clicks,
sum(p.conversions) as conversions,
sum(ga.users) users,
sum(ga.sessions) sessions,
sum(ga.warm_goal_completions) warm_goal_completions,
sum(ga.hot_goal_completions) hot_goal_completions
FROM `agency-data-pipeline-185318`.`agency_data_pipeline`.`agg_ga` ga
FULL OUTER JOIN `agency-data-pipeline-185318`.`agency_data_pipeline`.`adwords_ad_proc` p
on ( p.platform = ga.platform
  and p.url = ga.url
  and p.date = ga.date )
where ( ga.platform = 'Adwords' or p.platform = 'Adwords' )
GROUP BY date, lookup_account, ga_account, p_account, channel, platform, lookup_platform, url
),  __dbt__CTE__ga_bing_ads as (
SELECT 
coalesce(ga.date, p.date) date, 
coalesce(ga.account, p.account) lookup_account, 
ga.account ga_account, 
p.account p_account,
coalesce(ga.channel, p.channel) channel,
coalesce(ga.platform, p.platform) platform,
case when p.account is null then 'Google Analytics' else p.platform end lookup_platform,
coalesce(ga.url, p.url) url,
sum(p.cost) as cost,
sum(p.impressions) as impressions,
sum(p.clicks) as clicks,
sum(p.conversions) as conversions,
sum(ga.users) users,
sum(ga.sessions) sessions,
sum(ga.warm_goal_completions) warm_goal_completions,
sum(ga.hot_goal_completions) hot_goal_completions
FROM `agency-data-pipeline-185318`.`agency_data_pipeline`.`agg_ga` ga
FULL OUTER JOIN `agency-data-pipeline-185318`.`agency_data_pipeline`.`bing_ads_ad_proc` p
on ( p.platform = ga.platform
  and p.url = ga.url
  and p.date = ga.date )
where ( ga.platform = 'Bing Ads' or p.platform = 'Bing Ads' )
GROUP BY date, lookup_account, ga_account, p_account, channel, platform, lookup_platform, url
),  __dbt__CTE__ga_capterra as (
SELECT 
coalesce(ga.date, p.date) date, 
coalesce(ga.account, p.account) lookup_account, 
ga.account ga_account, 
p.account p_account,
coalesce(ga.channel, p.channel) channel,
coalesce(ga.platform, p.platform) platform,
case when p.account is null then 'Google Analytics' else p.platform end lookup_platform,
coalesce(ga.url, p.url) url,
sum(p.cost) as cost,
sum(p.impressions) as impressions,
sum(p.clicks) as clicks,
sum(p.conversions) as conversions,
sum(ga.users) users,
sum(ga.sessions) sessions,
sum(ga.warm_goal_completions) warm_goal_completions,
sum(ga.hot_goal_completions) hot_goal_completions
FROM `agency-data-pipeline-185318`.`agency_data_pipeline`.`agg_ga` ga
FULL OUTER JOIN `agency-data-pipeline-185318`.`agency_data_pipeline`.`capterra_proc` p
on ( p.platform = ga.platform
  and p.date = ga.date
  and p.account = ga.account
  )
where ( ga.platform = 'Capterra' or p.platform = 'Capterra' )
GROUP BY date, lookup_account, ga_account, p_account, channel, platform, lookup_platform, url
),  __dbt__CTE__ga_fb_ads as (
SELECT 
coalesce(ga.date, p.date) date, 
coalesce(ga.account, p.account) lookup_account, 
ga.account ga_account, 
p.account p_account,
coalesce(ga.channel, p.channel) channel,
coalesce(ga.platform, p.platform) platform,
case when p.account is null then 'Google Analytics' else p.platform end lookup_platform,
coalesce(ga.url, p.url) url,
sum(p.cost) as cost,
sum(p.impressions) as impressions,
sum(p.clicks) as clicks,
sum(p.conversions) as conversions,
sum(ga.users) users,
sum(ga.sessions) sessions,
sum(ga.warm_goal_completions) warm_goal_completions,
sum(ga.hot_goal_completions) hot_goal_completions
FROM `agency-data-pipeline-185318`.`agency_data_pipeline`.`agg_ga` ga
FULL OUTER JOIN `agency-data-pipeline-185318`.`agency_data_pipeline`.`fb_ads_campaign_proc` p
on ( p.platform = ga.platform
  and p.url = ga.url
  and p.date = ga.date )
where ( ga.platform = 'FB Ads' or p.platform = 'FB Ads' )
GROUP BY date, lookup_account, ga_account, p_account, channel, platform, lookup_platform, url
),  __dbt__CTE__ga_linkedin_ads as (
SELECT 
coalesce(ga.date, p.date) date, 
coalesce(ga.account, p.account) lookup_account, 
ga.account ga_account, 
p.account p_account,
coalesce(ga.channel, p.channel) channel,
coalesce(ga.platform, p.platform) platform,
case when p.account is null then 'Google Analytics' else p.platform end lookup_platform,
coalesce(ga.url, p.url) url,
sum(p.cost) as cost,
sum(p.impressions) as impressions,
sum(p.clicks) as clicks,
sum(p.conversions) as conversions,
sum(ga.users) users,
sum(ga.sessions) sessions,
sum(ga.warm_goal_completions) warm_goal_completions,
sum(ga.hot_goal_completions) hot_goal_completions
FROM `agency-data-pipeline-185318`.`agency_data_pipeline`.`agg_ga` ga
FULL OUTER JOIN `agency-data-pipeline-185318`.`agency_data_pipeline`.`linkedin_ads_campaign_proc` p
on ( p.platform = ga.platform
  and p.date = ga.date
  and p.account = ga.account
  )
where ( ga.platform = 'LinkedIn Ads' or p.platform = 'LinkedIn Ads')
GROUP BY date, lookup_account, ga_account, p_account, channel, platform, lookup_platform, url
),  __dbt__CTE__ga_twitter_ads as (
SELECT 
coalesce(ga.date, p.date) date, 
coalesce(ga.account, p.account) lookup_account, 
ga.account ga_account, 
p.account p_account,
coalesce(ga.channel, p.channel) channel,
coalesce(ga.platform, p.platform) platform,
case when p.account is null then 'Google Analytics' else p.platform end lookup_platform,
coalesce(ga.url, p.url) url,
sum(p.cost) as cost,
sum(p.impressions) as impressions,
sum(p.clicks) as clicks,
sum(p.conversions) as conversions,
sum(ga.users) users,
sum(ga.sessions) sessions,
sum(ga.warm_goal_completions) warm_goal_completions,
sum(ga.hot_goal_completions) hot_goal_completions
FROM `agency-data-pipeline-185318`.`agency_data_pipeline`.`agg_ga` ga
FULL OUTER JOIN `agency-data-pipeline-185318`.`agency_data_pipeline`.`twitter_ads_campaign_proc` p
on ( p.platform = ga.platform
  and p.date = ga.date
  and p.account = ga.account
  and p.url = ga.url
  )
where ( ga.platform = 'Twitter Ads' or p.platform = 'Twitter Ads')
GROUP BY date, lookup_account, ga_account, p_account, channel, platform, lookup_platform, url
),  __dbt__CTE__ga_search_console as (
SELECT 
coalesce(ga.date, p.date) date, 
coalesce(ga.account, p.account) lookup_account, 
ga.account ga_account, 
p.account p_account,
coalesce(ga.channel, p.channel) channel,
coalesce(ga.platform, p.platform) platform,
'Google Analytics' lookup_platform,
coalesce(ga.url, p.url) url,
sum(p.cost) as cost,
sum(p.impressions) as impressions,
sum(p.clicks) as clicks,
sum(p.conversions) as conversions,
sum(ga.users) users,
sum(ga.sessions) sessions,
sum(ga.warm_goal_completions) warm_goal_completions,
sum(ga.hot_goal_completions) hot_goal_completions
FROM `agency-data-pipeline-185318`.`agency_data_pipeline`.`agg_ga` ga
FULL OUTER JOIN `agency-data-pipeline-185318`.`agency_data_pipeline`.`search_console_proc`  p
on ( 
  p.date = ga.date
  and p.url = ga.url
  and p.channel = ga.channel
  )
where ( ga.platform = 'Organic' or p.platform = 'Organic' )
GROUP BY date, lookup_account, ga_account, p_account, channel, platform, lookup_platform, url
),  __dbt__CTE__ga_direct as (
SELECT 
coalesce(ga.date, p.date) date, 
coalesce(ga.account, p.account) lookup_account, 
ga.account ga_account, 
p.account p_account,
coalesce(ga.channel, p.channel) channel,
coalesce(ga.platform, p.platform) platform,
case when p.account is null then 'Google Analytics' else p.platform end lookup_platform,
coalesce(ga.url, p.url) url,
sum(p.cost) as cost,
sum(p.impressions) as impressions,
sum(p.clicks) as clicks,
sum(p.conversions) as conversions,
sum(ga.users) users,
sum(ga.sessions) sessions,
sum(ga.warm_goal_completions) warm_goal_completions,
sum(ga.hot_goal_completions) hot_goal_completions
FROM `agency-data-pipeline-185318`.`agency_data_pipeline`.`agg_ga` ga
FULL OUTER JOIN `agency-data-pipeline-185318`.`agency_data_pipeline`.`twitter_ads_campaign_proc` p
on ( p.platform = ga.platform
  and p.date = ga.date
  and p.account = ga.account
  )
where ( ga.platform = 'Direct' or p.platform = 'Direct')
GROUP BY date, lookup_account, ga_account, p_account, channel, platform, lookup_platform, url
),  __dbt__CTE__ga_software_advice as (
SELECT 
coalesce(ga.date, p.date) date, 
coalesce(ga.account, p.account) lookup_account, 
ga.account ga_account, 
p.account p_account,
coalesce(ga.channel, p.channel) channel,
coalesce(ga.platform, p.platform) platform,
case when p.account is null then 'Google Analytics' else p.platform end lookup_platform,
coalesce(ga.url, p.url) url,
sum(p.cost) as cost,
sum(p.impressions) as impressions,
sum(p.clicks) as clicks,
sum(p.conversions) as conversions,
sum(ga.users) users,
sum(ga.sessions) sessions,
sum(ga.warm_goal_completions) warm_goal_completions,
sum(ga.hot_goal_completions) hot_goal_completions
FROM `agency-data-pipeline-185318`.`agency_data_pipeline`.`agg_ga` ga
FULL OUTER JOIN `agency-data-pipeline-185318`.`agency_data_pipeline`.`software_advice_campaign_proc` p
on ( p.platform = ga.platform
  and p.date = ga.date
  and p.account = ga.account
  )
where ( ga.platform = 'Software Advice' or p.platform = 'Software Advice' )
GROUP BY date, lookup_account, ga_account, p_account, channel, platform, lookup_platform, url
)SELECT *
FROM 
  __dbt__CTE__ga_adwords
 UNION ALL

SELECT *
FROM 
  __dbt__CTE__ga_bing_ads
UNION ALL  

SELECT *
FROM 
  __dbt__CTE__ga_capterra
UNION ALL  

SELECT *
FROM  
  __dbt__CTE__ga_fb_ads
UNION ALL  

SELECT *
FROM  
  __dbt__CTE__ga_linkedin_ads

UNION ALL  

SELECT *
FROM  
  __dbt__CTE__ga_twitter_ads

UNION ALL

SELECT *
FROM  
  __dbt__CTE__ga_search_console

UNION ALL

SELECT *
FROM  

  __dbt__CTE__ga_direct

UNION ALL

SELECT *
FROM  

  __dbt__CTE__ga_software_advice