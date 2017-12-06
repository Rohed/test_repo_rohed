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
sum(deals) Leads,
sum(opportunities) Opportunities,
sum(deals) Deals,
sum(revenue) Revenue,
sum(xero_revenue) XeroRevenue,
max(ref_domains) RefDomains,
max(top_5_keywords) Top5Keywords,
sum(realized_impressions) RealizedImpressions,
sum(available_impressions) AvailableImpressions
FROM `agency-data-pipeline-185318`.`agency_data_pipeline`.`agg_all_daily`
GROUP BY Client, Platform, Channel, Date
ORDER by Channel asc, Date asc, Platform asc