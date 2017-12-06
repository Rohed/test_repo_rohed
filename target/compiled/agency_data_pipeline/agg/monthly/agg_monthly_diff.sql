SELECT 
  client,
  channel,
  platform,
  yyyymm,
  day_count,
  lag(day_count,1) OVER (
     PARTITION BY client, platform
     ORDER BY yyyymm asc ) day_count_0,  
  days_sessions,
  lag(days_sessions,1) OVER (
     PARTITION BY client, platform
     ORDER BY yyyymm asc ) days_sessions_0,  
  days_clicks,
  lag(days_clicks,1) OVER (
     PARTITION BY client, platform
     ORDER BY yyyymm asc ) days_clicks_0,      
  days_both,
  lag(days_both,1) OVER (
     PARTITION BY client, platform
     ORDER BY yyyymm asc ) days_both_0,          
  sessions,
  lag(sessions,1) OVER (
     PARTITION BY client, platform
     ORDER BY yyyymm asc ) sessions_0,    
  warm_goal_completions,
  lag(warm_goal_completions,1) OVER (
     PARTITION BY client, platform
     ORDER BY yyyymm asc ) warm_goal_completions_0,
  hot_goal_completions,
  lag(hot_goal_completions,1) OVER (
     PARTITION BY client, platform
     ORDER BY yyyymm asc ) hot_goal_completions_0,     
  clicks,
  lag(clicks,1) OVER (
     PARTITION BY client, platform
     ORDER BY yyyymm asc ) clicks_0,
  conversions,
  lag(conversions,1) OVER (
     PARTITION BY client, platform
     ORDER BY yyyymm asc ) conversions_0,     
  cost,  
  lag(cost,1) OVER (
     PARTITION BY client, platform
     ORDER BY yyyymm asc ) cost_0,
  leads,
  lag(leads,1) OVER (
     PARTITION BY client, platform
     ORDER BY yyyymm asc ) leads_0,     
  opportunities,
  lag(opportunities,1) OVER (
     PARTITION BY client, platform
     ORDER BY yyyymm asc ) opportunities_0,
  deals,
  lag(deals,1) OVER (
     PARTITION BY client, platform
     ORDER BY yyyymm asc ) deals_0,     
  revenue,
  lag(revenue,1) OVER (
     PARTITION BY client, platform
     ORDER BY yyyymm asc ) revenue_0,  
  xero_revenue,
  lag(xero_revenue,1) OVER (
     PARTITION BY client, platform
     ORDER BY yyyymm asc ) xero_revenue_0,       
  return_on_spend,  
  lag(return_on_spend,1) OVER (
     PARTITION BY client, platform
     ORDER BY yyyymm asc ) return_on_spend_0,     
  clicks - sessions as click_session_diff
FROM `agency-data-pipeline-185318`.`agency_data_pipeline`.`agg_monthly`