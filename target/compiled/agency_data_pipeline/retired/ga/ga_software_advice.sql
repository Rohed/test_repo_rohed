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