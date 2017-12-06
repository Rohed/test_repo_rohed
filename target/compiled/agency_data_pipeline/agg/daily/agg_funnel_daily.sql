with channels as (

	select 
		date, client, channel, platform,
		users, sessions, warm_goal_completions, hot_goal_completions,
		cost, impressions, clicks, conversions, 
		new_pages, retired_pages,
		null as leads, null as opportunities, null as deals, null as revenue, null as xero_revenue

	from `agency-data-pipeline-185318`.`agency_data_pipeline`.`agg_channels_daily`

),

crm as (

	select 
		date, client, channel, platform,
		null as users, null as sessions, null as warm_goal_completions, null as hot_goal_completions,
		null as cost, null as impressions, null as clicks, null as conversions,
		null as new_pages, null as retired_pages,
		leads, opportunities, deals, revenue, xero_revenue
	from `agency-data-pipeline-185318`.`agency_data_pipeline`.`agg_crm_daily`

)


SELECT
    date, 
    client,
    platform,
    channel, 
    sum(cost) cost,
	sum(impressions) impressions,
	sum(clicks) clicks,
	sum(conversions) conversions,
	sum(users) users,
	sum(sessions) sessions,
	sum(warm_goal_completions) warm_goal_completions,
	sum(hot_goal_completions) hot_goal_completions,
	sum(new_pages) new_pages,
	sum(retired_pages) retired_pages,
	sum(leads) leads,
	sum(opportunities) opportunities,
	sum(deals) deals,
	sum(revenue) revenue,
	sum(xero_revenue) xero_revenue
FROM
(
    SELECT *
    FROM 
      channels
    UNION ALL
    SELECT *
    FROM 
      crm
) 
GROUP BY
    date, client, platform, channel