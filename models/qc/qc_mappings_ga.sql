SELECT 
client,
account,
FORMAT_DATE("%Y-%m", date) AS yyyymm,
platform,
source,
medium,
source_medium,   
sum(users) users,
sum(sessions) sessions,
sum(warm_goal_completions) warm_goal_completions,
sum(hot_goal_completions) hot_goal_completions
FROM {{ref('agg_ga')}}
WHERE
  source_medium like '%facebook%'
  or source_medium like '%twitter%'
  or source_medium like '%bing%'
  or source_medium like '%adwords%'
  or source_medium like '%google%'
  or source_medium like '%adroll%'
  or source_medium like '%organic%'
  or source_medium like '%(direct)%'
  or source_medium like '%linkedin%'
  or source_medium like '%capterra%'
  or source_medium like '%advice%'
GROUP BY client, account, source, medium, source_medium, platform, yyyymm
ORDER BY yyyymm desc, client asc, platform asc, source asc, medium asc