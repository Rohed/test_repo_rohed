SELECT 
date Date,
client Client,
channel Channel,
platform Platform,
first_seen FirstSeen,
last_seen LastSeen,
source_domain RefDomain,
source_url LinkingURL,
url URL,
citation_flow CitationFlow,
trust_flow TrustFlow,
channel_group_path ChannelPath,
sum(users) Users,
sum(sessions) Sessions,
sum(warm_goal_completions) as WarmGoalCompletions,
sum(hot_goal_completions) as HotGoalCompletions,
sum(cost) Cost,
sum(impressions) Impressions,
sum(clicks) Clicks,
sum(conversions) Conversions,
sum(assisted_conversions) AssistedConversions,
sum(case when first_seen = date then 1 else 0 end) NewPages,
sum(case when last_seen = date then 1 else 0 end) RetiredPages
FROM `agency-data-pipeline-185318`.`agency_data_pipeline`.`agg_all_line_level` 
WHERE client = 'Directive Consulting'
AND ( goal_number in (5, 7, 10, 13) OR goal_number is null )
GROUP BY date, client, channel, platform, FirstSeen, LastSeen, RefDomain, LinkingURL, url, CitationFlow, TrustFlow, ChannelPath
ORDER BY date asc, channel asc, platform asc