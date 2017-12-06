SELECT
    client,
    channel,
    platform,
    yyyymm,
    url,
    coalesce(sum(users),0) as users,    
    coalesce(sum(sessions),0) as sessions,
    coalesce(sum(warm_goal_completions),0) as warm_goal_completions,    
    coalesce(sum(hot_goal_completions),0) as hot_goal_completions,        
    coalesce(sum(cost),0) as cost,
    coalesce(sum(impressions),0) as impressions,    
    coalesce(sum(clicks),0) as clicks,
    coalesce(sum(conversions),0) as conversions,      
    count( distinct case when (sessions > 0 or clicks > 0) then date else null end) as day_count,
    count( distinct case when sessions > 0 then date else null end) as days_ga,
    count( distinct case when clicks > 0 then date else null end) as days_p,
    count( distinct case when (sessions > 0 and clicks > 0) then date else null end) as days_both,
    min(first_seen) as first_seen,
    max(last_seen) as last_seen       
	FROM
	  {{ref('agg_channels')}}
	GROUP BY 
    client, channel, platform, yyyymm, url
	ORDER BY
	  client asc, channel asc, platform asc, yyyymm asc, url asc