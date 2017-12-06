with ga as (

	select 
		date, account, client, channel, platform, url,
		users, sessions, warm_goal_completions, hot_goal_completions,
		null as cost, null as impressions, null as clicks, null as conversions

	from `agency-data-pipeline-185318`.`agency_data_pipeline`.`agg_ga`

),

platforms as (

	select 
		date, account, client, channel, platform, url,
		null as users, null as sessions, null as warm_goal_completions, null as hot_goal_completions,
		cost, impressions, clicks, conversions
	from `agency-data-pipeline-185318`.`agency_data_pipeline`.`agg_platforms_client`

)


SELECT
    date, 
    client,
    platform,
    channel, 
    url,
    sum(cost) cost,
	sum(impressions) impressions,
	sum(clicks) clicks,
	sum(conversions) conversions,
	sum(users) users,
	sum(sessions) sessions,
	sum(warm_goal_completions) warm_goal_completions,
	sum(hot_goal_completions) hot_goal_completions
FROM
(
    SELECT *
    FROM 
      ga
    UNION ALL
    SELECT *
    FROM 
      platforms 
) 
GROUP BY
    date, client, platform, channel, url