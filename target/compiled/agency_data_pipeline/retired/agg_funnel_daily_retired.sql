SELECT 
coalesce(c.client, crm.client) client,
coalesce(c.platform, crm.platform) platform,
coalesce(c.channel, crm.channel) channel,
coalesce(c.date, crm.date) date,
c.users users,
c.sessions sessions,
c.warm_goal_completions warm_goal_completions, 
c.hot_goal_completions hot_goal_completions, 
coalesce(c.cost, 0) cost,
c.impressions impressions,
c.clicks clicks,
c.conversions conversions,
c.new_pages new_pages,
c.retired_pages retired_pages,
crm.leads leads,
crm.opportunities opportunities,
crm.deals deals,
coalesce(crm.revenue, 0) revenue,
coalesce(crm.xero_revenue, 0) xero_revenue
FROM `agency-data-pipeline-185318`.`agency_data_pipeline`.`agg_channels_daily` c
FULL OUTER JOIN `agency-data-pipeline-185318`.`agency_data_pipeline`.`agg_crm_daily` crm
on ( c.platform = crm.platform
  and c.client = crm.client
  and c.date = crm.date
  and c.channel = crm.channel )