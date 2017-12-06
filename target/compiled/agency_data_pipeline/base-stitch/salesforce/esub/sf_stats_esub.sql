SELECT 
coalesce(d.client, o.client) client,
coalesce(d.platform, o.platform) platform,
coalesce(d.channel, o.channel) channel,
coalesce(d.date, o.date) date,
o.opportunities opportunities,
d.deals deals,
d.revenue revenue
FROM `agency-data-pipeline-185318`.`agency_data_pipeline`.`sf_deals_esub` d
FULL OUTER JOIN `agency-data-pipeline-185318`.`agency_data_pipeline`.`sf_opps_esub` o
on ( d.date = o.date
  and d.platform = o.platform )