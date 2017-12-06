SELECT 
date, 
a.account account, 
b.client client,
a.platform platform,
a.channel channel,
url,
cost,
impressions,
clicks,
conversions
FROM 
  `agency-data-pipeline-185318`.`agency_data_pipeline`.`agg_platforms_union` a
LEFT JOIN 
  `agency-data-pipeline-185318`.`agency_data_pipeline`.`accounts_proc` b
ON ( 
  a.account = b.account AND
  a.platform = b.platform
)