SELECT
    client,
    channel,
    platform,
    FORMAT_DATE("%Y-%m", date) AS yyyymm,
    count(distinct date) as day_count,
    min(date) first_date,
    max(date) last_date,
    count( distinct case when sessions > 0 then date else null end) as days_sessions,
    count( distinct case when clicks > 0 then date else null end) as days_clicks,
    count( distinct case when (sessions > 0 and clicks > 0) then date else null end) as days_both,    
    coalesce(sum(users),0) as users,    
    coalesce(sum(sessions),0) as sessions,
    coalesce(sum(warm_goal_completions),0) as warm_goal_completions,    
    coalesce(sum(hot_goal_completions),0) as hot_goal_completions,        
    coalesce(sum(cost),0) as cost,
    coalesce(sum(impressions),0) as impressions,    
    coalesce(sum(clicks),0) as clicks,
    coalesce(sum(conversions),0) as conversions,    
    coalesce(sum(leads),0) as leads,
    coalesce(sum(opportunities),0) as opportunities,    
    coalesce(sum(deals),0) as deals,        
    coalesce(sum(revenue),0) as revenue,        
    coalesce(sum(xero_revenue),0) as xero_revenue,
    coalesce(sum(revenue)-sum(cost),0) as return_on_spend        
  FROM
    {{ref('agg_funnel_daily')}}
  GROUP BY 
    client, channel, platform, yyyymm
  ORDER BY 
    client asc, channel asc, platform asc, yyyymm asc