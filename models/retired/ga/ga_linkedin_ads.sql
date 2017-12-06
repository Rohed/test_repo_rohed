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
FROM {{ref('agg_ga')}} ga
FULL OUTER JOIN {{ref('linkedin_ads_campaign_proc')}} p
on ( p.platform = ga.platform
  and p.date = ga.date
  and p.account = ga.account
  )
where ( ga.platform = 'LinkedIn Ads' or p.platform = 'LinkedIn Ads')
GROUP BY date, lookup_account, ga_account, p_account, channel, platform, lookup_platform, url