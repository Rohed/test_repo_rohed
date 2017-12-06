SELECT 
  client,
  channel,
  platform,
  yyyymm,
  url,
  day_count,
  lag(day_count,1) OVER (
     PARTITION BY client, platform, url
     ORDER BY yyyymm asc ) day_count_0,  
  sessions,
  lag(sessions,1) OVER (
     PARTITION BY client, platform, url
     ORDER BY yyyymm asc ) sessions_0,    
  warm_goal_completions,
  lag(warm_goal_completions,1) OVER (
     PARTITION BY client, platform, url
     ORDER BY yyyymm asc ) warm_goal_completions_0,
  hot_goal_completions,
  lag(hot_goal_completions,1) OVER (
     PARTITION BY client, platform, url
     ORDER BY yyyymm asc ) hot_goal_completions_0,          
  clicks,
  lag(clicks,1) OVER (
     PARTITION BY client, platform, url
     ORDER BY yyyymm asc ) clicks_0,
  conversions,
  lag(conversions,1) OVER (
     PARTITION BY client, platform, url
     ORDER BY yyyymm asc ) conversions_0,     
  cost,  
  lag(cost,1) OVER (
     PARTITION BY client, platform, url
     ORDER BY yyyymm asc ) cost_0,
  clicks - sessions as click_session_diff,
  case when day_count > 0.00 then days_p/day_count else 0.00 end as days_p_pct,
  case when day_count > 0.00 then days_ga/day_count else 0.00 end as days_ga_pct,
  case when day_count > 0.00 then days_both/day_count else 0.00 end as days_both_pct
FROM `agency-data-pipeline-185318`.`agency_data_pipeline`.`agg_monthly_url`
order by client asc, channel asc, platform asc, url asc, yyyymm asc