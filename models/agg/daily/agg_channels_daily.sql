SELECT 
date,
client,
channel,
platform,
sum(users) users,
sum(sessions) sessions,
sum(warm_goal_completions) warm_goal_completions,
sum(hot_goal_completions) hot_goal_completions,
sum(cost) cost,
sum(impressions) impressions,
sum(clicks) clicks,
sum(conversions) conversions,
sum(case when first_seen = date then 1 else 0 end) new_pages,
sum(case when last_seen = date then 1 else 0 end) retired_pages
FROM   
{{ref('agg_channels')}}
GROUP BY
date, client, channel, platform
ORDER BY
client asc, date asc, channel asc, platform asc