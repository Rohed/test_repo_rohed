SELECT 
client Client,
platform Platform,
channel Channel,
date Date,
sum(users) Users,
sum(sessions) Sessions,
sum(warm_goal_completions) as WarmGoalCompletions,
sum(hot_goal_completions) as HotGoalCompletions,
sum(cost) Cost,
sum(impressions) Impressions,
sum(clicks) Clicks,
sum(conversions) Conversions,
sum(new_pages) NewPages,
sum(retired_pages) RetiredPages,
sum(assisted_conversions) AssistedConversions,
max(ref_domains) RefDomains,
max(top_5_keywords) Top5Keywords,
sum(organic_value) OrganicTrafficValue,
max(domain_authority) DomainAuthority,
sum(realized_impressions) RealizedImpressions,
sum(available_impressions) AvailableImpressions
FROM `agency-data-pipeline-185318`.`agency_data_pipeline`.`agg_all_daily`
WHERE client = 'TimeTrade'
AND ( goal_number in (2, 4, 6, 8, 18) OR goal_number is null )
GROUP BY Client, Platform, Channel, Date
ORDER by Channel asc, Date asc, Platform asc