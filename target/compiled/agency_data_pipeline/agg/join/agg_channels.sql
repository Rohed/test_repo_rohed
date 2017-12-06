SELECT
    date, 
    FORMAT_DATE("%Y-%m", date) AS yyyymm,
    client,
    platform,
    channel, 
    url,
    sum(cost) cost,
    sum(impressions) impressions,
    sum(clicks) clicks,
    sum(users) users,
    sum(sessions) sessions,
    sum(warm_goal_completions) warm_goal_completions,
    sum(hot_goal_completions) hot_goal_completions,
    sum(case when (channel = 'Organic' or channel = 'Direct') then (warm_goal_completions + hot_goal_completions) else conversions end) conversions,
    FIRST_VALUE(date) OVER (PARTITION BY platform, url ORDER BY date asc) first_seen,
    FIRST_VALUE(date) OVER (PARTITION BY platform, url ORDER BY date desc) last_seen
FROM
  `agency-data-pipeline-185318`.`agency_data_pipeline`.`agg_platforms_ga`
GROUP BY
  date, yyyymm, client, platform, channel, url
order by client asc, date asc